#!/usr/bin/env perl -w
#***** BEGIN LICENSE BLOCK *****
# Version: MPL 1.1
#
# The contents of this file are subject to the Mozilla Public License Version
# 1.1 (the "License"); you may not use this file except in compliance with
# the License. You may obtain a copy of the License at
# http://www.mozilla.org/MPL/
#
# Software distributed under the License is distributed on an "AS IS" basis,
# WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
# for the specific language governing rights and limitations under the
# License.
#
# The Original Code is MozLCDB: Mozilla Locale Database
#
# The Initial Developer of the Original Code is
# Hung-Te Lin <piaip@csie.ntu.edu.tw>.
# Portions created by the Initial Developer are Copyright (C) 2004
# the Initial Developer. All Rights Reserved.
#
# Contributor(s):
#
# ***** END LICENSE BLOCK *****
#
# MozLCDB: Mozilla Locale Database
#
# Project Page: http://moztw.org/tools/mozlcdb/
# Author:   Hung-Te Lin <piaip@csie.ntu.edu.tw
# Original: Fri Sep 17 09:22:48 CST 2004
# $LastChangedBy$
# #Date#
# $Rev#
# #Id#
#
# The idea:
# We keep a glossary history database of (orig, trandlated)
# and export a text for current version.

# Features:
# 1. Free format on languagepack layout
# 2. Multiple product/version in own database

# Output
# DTD: Just flush the UTF-8 bytes
# .properties: working like |native2ascii -encoding utf-8

use strict;
use Encode;
use Data::Dumper;

# global vars
our ($now, $glossaryfn, $currentfn);
our (%db,%sys);

# version info
my $progver = '0.1';
my $dbver = '0.1';

%db = ();
%sys= (
	'VER' => $dbver,
);

$now = time;
$glossaryfn = 'mozlcdb.txt';
$currentfn = 'current.txt';

$Data::Dumper::Indent = 1; # we have too much stuff to outout.

sub importFile { # {{{
	my ($realfn, $fn) = @_;
	print STDERR "Importing [$fn]... ";
	my ($news, $olds, $updated, $same) = (0,0,0,0);
	# parse file
	open F, "$realfn";
	my @data = <F>;
	close F;
	my $set;
	my $refOrder = [];
	if ($fn =~ /\.dtd$/) {
		$set = &parsemozdtd($refOrder, @data);
	} elsif ($fn =~ /\.properties$/) {
		$set = &parsemozproperties($refOrder, @data);
	} else {
		print STDERR "ignore.\n";
		return ($news, $olds, $updated, $same);
	}

	# update database
	$olds = keys(%{$db{$fn}});

	for my $k (keys %{$set}) {
		# normally, i'd prefer ignore accesskeys
		#next if $k =~ /\.accesskey$/;
		#next if $k =~ /_accesskey$/;

		if (exists $db{$fn}{$k}) {
			my %hist = %{$db{$fn}{$k}};
			my @hist = &reverseTimestamps(keys(%hist));
			# quick check: same as last record?
			my $lk = $hist[0];
			if ($set->{$k} eq $db{$fn}{$k}{$lk}{'en'}) {
				$same ++;
				# make it with higher priority in history.
				my $ts = $now;
				if (exists $db{$fn}{$k}{$lk}{'tr'} ||
					$db{$fn}{$k}{$lk}{'keep'}) {
					$ts--; # because =now will output
				}
				$db{$fn}{$k}{$ts} = $db{$fn}{$k}{$lk};
				delete $db{$fn}{$k}{$lk};
			} else {
				$updated ++;
				# different? look up!
				my %newrec = (
					'en' => $set->{$k},
				);
				foreach my $h (@hist) {
					my $lastmsg = $db{$fn}{$k}{$h}{'en'};
					if($lastmsg eq $set->{$k}) {
						%newrec = %{$db{$fn}{$k}{$h}};
						# so latest is that. we don't need it anymore.
						delete $db{$fn}{$k}{$h};
						last;
					}
				}
				$db{$fn}{$k}{$now} = \%newrec;
				# access keys? ignore them!
				$db{$fn}{$k}{$now}{keep} = 1 if lc($k) =~ /[_\.]accesskey$/;
			}
		} else {
			$news ++;
			# new entry
			$db{$fn}{$k} = {
				"$now" => {
					'en' => $set->{$k},	# English
				},
			};
			$db{$fn}{$k}{$now}{keep} = 1 if lc($k) =~ /[_\.]accesskey$/;
		}
	}
	my $unused = $olds - $updated - $same;
	print STDERR " $news new, $updated updated, $same unchanged, $unused unused";
	print STDERR "\n";
	return ($news, $olds, $updated, $same);
} # }}}

sub exportFile { # {{{
	my ($realfn, $fn, $flIgnore) = @_;
	print STDERR "Exporting [$fn] ... ";
	my ($news, $olds, $updated, $same) = (0,0,0,0);
	# parse file
	open F, $realfn;
	my @data = <F>;
	close F;

	my $set;
	my $refOrder = [];
	if ($fn =~ /\.dtd$/) {
		$set = &parsemozdtd($refOrder, @data);
	} elsif ($fn =~ /\.properties$/) {
		$set = &parsemozproperties($refOrder, @data);
	} else {
		print STDERR "ignore.\n";
		return ($news, $olds, $updated, $same);
	}

	if (!exists $db{$fn} && !$flIgnore) {
		print STDERR "[WARN] Unknown file entry: [$fn ($realfn)]\n";
		print STDERR "Maybe you should import again.\n";
		exit(0);
	}

	$olds = keys(%{$db{$fn}});
	# load database entries
	my %ents = ();
	for my $k (keys %{$set}) {
		if (!exists $db{$fn}{$k} && !$flIgnore) {
			print STDERR "[WARN] Unknown key: [$k / $fn]\n";
			print STDERR "Maybe you should import again.\n";
			exit(0);
		}
		my $ts = '';
		my @hist = ();
		my %hist = ();
		if (exists $db{$fn}{$k}) {
			# try to find best match
			%hist = %{$db{$fn}{$k}};
			@hist = &reverseTimestamps(keys(%hist));
			$ts = '';
			# lookup history
			foreach my $h (@hist) {
				if ($set->{$k} eq $db{$fn}{$k}{$h}{'en'}) {
					$ts = $h;
					last;
				}
			}
		} else {
		}
		if ($ts eq '' && !$flIgnore) {
			# no entries?
			print STDERR "[WARN] Orig Msg Not Match: [$k @ $fn]\n";
			print STDERR "Maybe you should import again or invoke with -X.\n";
			exit(0);
			# or use best match
			$ts = $hist[0];
		}
		# found entry.
		my $v = $set->{$k};
		if ($ts ne '') {
			my %rec = %{$db{$fn}{$k}{$ts}};
			if ($rec{'keep'}) {
				$same++;
			} elsif (!exists($rec{'tr'})) {
				$news++;
			} else {
				$v = $rec{'tr'};
				$updated ++;
			}
		}
		$ents{$k} = $v;
	}
	# now all entries were written to ents.
	my $os = '';
	if ($fn =~ /\.dtd$/) {
		$os = &outputmozdtd($refOrder, %ents);
	} elsif ($fn =~ /\.properties$/) {
		$os = &outputmozproperties($refOrder, %ents);
	} else {
		print STDERR "[ERROR] Unknown program flow error: $fn\n";
		exit(0);
	}
	open FW, ">$realfn";
	print FW $os;
	close FW;

	my $unused = $olds - $updated - $same;
	print STDERR " $news new entries, $updated updated. ($same unchanged, $unused unused)";
	print STDERR "\n";
	return ($news, $olds, $updated, $same);
} # }}}

sub printCurrent { # {{{ current document translation for editing
	my ($fn, $flPrintAll) = @_;

	open F, ">$fn";
	print F "; [MozLCDB] mozilla localization database: current editing\n";
	print F "; Get MozLCDB from http://moztw.org/tools/mozlcdb/\n";
	print F "; extra keys: cm=COMMENT and kp=1 (KEEP)\n\n";
	my $lastFn = '';
	foreach my $f (sort(keys %db)) {
		foreach my $k (keys %{$db{$f}}) {
			my %e;
			if ($flPrintAll) {
				my @hist = &reverseTimestamps(keys %{$db{$f}{$k}});
				%e = %{$db{$f}{$k}{$hist[0]}};
			} else {
				# if not in current entries, ignore it.
				next if (!exists $db{$f}{$k}{$now});
				%e = %{$db{$f}{$k}{$now}};
			}
			if ($f ne $lastFn) {
				print F "[$f]\n\n";
				$lastFn = $f;
			}
			my $header = '';
			if (exists ($e{keep})) {
				$header = ';[keep] ';
			}
			print F "${header}id=$k\n";
			print F "${header}en=$e{'en'}\n";
			if (exists $e{'tr'}) {
				print F "${header}tr=$e{'tr'}\n";
			} else {
				my @hist = &reverseTimestamps(keys %{$db{$f}{$k}});
				my $flFound = 0;
				foreach my $l (@hist) {
					if (exists $db{$f}{$k}{$l}{'tr'}) {
						print F ";tr=$db{$f}{$k}{$l}{'tr'}\n";
						$flFound = 1;
						last;
					}
				}
				print F "${header};tr=\n" if !$flFound;
			}
			print F "${header}kp=$e{keep}\n" if exists($e{keep});
			print F "${header}; cm=$e{comment}\n" if exists($e{comment});
			print F "${header}\n";
		}
	}
	print F "\n; vim:ft=dosini:nowrap:tw=0\n";
	close F;
} # }}}

sub updateFromCurrent { # update from current results {{{
	my ($fn, $flForceImport) = @_;
	return if (!-r $fn);

	print STDERR "Processing $fn...\n";
	my ($news, $olds, $updated, $same) = (0,0,0,0);
	open F, "<$fn";
	my ($f, $id, $en, $tr, $cm, $kp, $ts);
	my $lineno = 0;
	$ts = $now;
	while (<F>) {
		my $l = $_;
		$lineno ++;
		$l =~ s/^\s*//;
		next if ($l =~ /^$/);		# blank
		next if ($l =~ /^[;#]/);	# comments
		if ($l =~ /^\[(.*)\]/) {
			$f = $1;
			if (!exists $db{$f}) {
				if($flForceImport) {
					# generate it
					$db{$1} = {};
				} else {
					print STDERR "Unknown [FILE]: stop at L$lineno: $l\n";
					exit(-1);
				}
			}
			$id = $ts = $en = $tr = $cm = $kp = undef;
		} elsif ($l =~ /([^=]*)=(.*)/) {
			my $k = $1;
			my $v = $2;
			if (!defined $f) {
				print STDERR "You must have [FILE] first: stop at L$lineno: $l\n";
				exit(-1);
			} elsif ($k eq 'id') { # new entry
				if (!exists $db{$f}{$v}) {
					if ($flForceImport) {
						$db{$f}{$v} = {};
						if ($v eq '') {
							print STDERR "Invalid id=$v: stop at L$lineno: $l\n";
							exit(-1);
						}
					} else {
						print STDERR "Unknown id=$v: stop at L$lineno: $l\n";
						exit(-1);
					}
				}
				$id = $v;
				$en = $tr = $cm = $kp = undef;
				my %hist = %{$db{$f}{$id}};
				my @hist = &reverseTimestamps(keys(%hist));
				$ts = $hist[0];
				$olds ++;
			} elsif (!defined $id) {
				print STDERR "You must have id=KEY first: stop at L$lineno: $l\n";
				exit(-1);
			} elsif ($k eq 'en') {
				$en = $v;
				if (!exists $db{$f}{$id}{$ts}{'en'}) {
					if ($flForceImport) {
						$db{$f}{$id}{$ts}{'en'} = $en;
					} else {
						print STDERR "[ERROR] en(original) does not exists. Stop at L$lineno: $l\n";
						exit(-1);
					}
				}
				if ($db{$f}{$id}{$ts}{'en'} ne $v) {
					print STDERR "[WARN] en(original) not match. Not sync? [$f:$id]\n";
				   print STDERR " Orig=[$db{$f}{$id}{$ts}{en}]\n Dest=[$v]\n";
					if (!$flForceImport) {
						print STDERR " stop at L$lineno: $l\n";
						exit(-1);
					} else {
						# force to upgrade.
						while (exists $db{$f}{$id}{$ts}) {
							$ts --;
						}
						$db{$f}{$id}{$ts} = $db{$f}{$id}{$now};
						$db{$f}{$id}{$now} = {};
						$db{$f}{$id}{$now}{en} = $v;
						$ts = $now;
					}
				}
			} elsif (!defined $en) {
				print STDERR "You must have en=MSG first: stop at L$lineno: $l\n";
				exit(-1);
			} elsif ($k eq 'tr') {
				$tr = $v;
				$db{$f}{$id}{$ts}{'tr'} = $v;
			} elsif ($k eq 'cm') {
				$cm = $v;
				$db{$f}{$id}{$ts}{'comment'} = $v;
				delete $db{$f}{$id}{$ts}{'comment'} if $v eq '';
			} elsif ($k eq 'kp') {
				$kp = $v;
				$db{$f}{$id}{$ts}{'keep'} = $v;
				delete $db{$f}{$id}{$ts}{'keep'} if $v eq '';
			} else {
				print STDERR "Unknown entry: L$lineno: $l\n";
			}
		}
	}
	close F;
	return ($news, $olds, $updated, $same);
}
# }}}

sub main { # {{{ main entry
	my $cmd = '-u';
	$cmd = shift @ARGV if (@ARGV > 0);
	print STDERR "[MozLCDB] Mozilla Locale Database v$progver\n";
	print STDERR "Contact Hung-Te Lin <piaip\@csie.ntu.edu.tw> if you have problem.\n";
	print STDERR "Project page and manual: http://moztw.org/tools/mozlcdb/\n\n";

	&readDb();

	my ($news, $olds, $updated, $same) = (0,0,0,0);

	if ($cmd eq '-u' || $cmd eq '-U') {
		# update from currentfn
		if (@ARGV == 0) {
			print STDERR "Update from '$currentfn'...\n";
			&updateFromCurrent($currentfn, ($cmd eq '-U') ? 1 : 0);
		} else {
			foreach (@ARGV) {
				print STDERR "Update from '$_'...\n";
				&updateFromCurrent($_, ($cmd eq '-U') ? 1 : 0);
			}
		}
		&writeDb();
		print STDERR "Done.\n";
	} elsif ($cmd eq '-i' || $cmd eq '-x' || $cmd eq '-X') {
		# -i: import
		# -x: extract
		my @roots = @ARGV;
		my $actionmsg = ($cmd eq '-i') ? 'Import from' : 'Export to';
		print STDERR "$actionmsg ROOT [" . join(',', @roots) . "]...\n";
		# loop of roots
		foreach my $root (@roots) { 
			my @filelist = &listdir($root);
			# remember to kill "$root/"!
			foreach my $fn (@filelist) {
				my @a;
				my $r = $root;
				my $nodepath = $fn;
				if (-d $r) {
					$r .= '/';
				}
				$nodepath = substr($nodepath, length($r));
				@a = ($cmd eq '-i' ? 
					&importFile($fn, $nodepath) : 
					&exportFile($fn, $nodepath,
						($cmd eq '-X') ? 1 : 0));
				$news += $a[0];
				$olds += $a[1];
				$updated += $a[2];
				$same += $a[3];
			}
		} # end of loop of roots
		my $unused = $olds - $updated - $same;
		print STDERR "--- Total: ";
		print STDERR " $news new entries, $updated updated. ($same unchanged, $unused unused)";
		print STDERR "\n";
		if ($cmd eq '-i' && ($news > 0 || $updated > 0)) {
			&writeDb();
			print STDERR "--- Writing current edit file\n";
			&printCurrent($currentfn, 0);
		}
		print STDERR "Done.\n";
	} elsif ($cmd eq '-e') {
		# regenerate currentfn
		print STDERR "Generating latest version of full table to '$currentfn'...\n";
		&printCurrent($currentfn, 1);
		print STDERR "Done.\n";
	} elsif ($cmd eq '-n' && @ARGV == 2) {
		my $root1 = $ARGV[0];
		my $root2 = $ARGV[1];
		my @filelist = &listdir($root1);
		foreach my $fn (@filelist) {
			my @a;
			my $r = $root1;
			my $nodepath = $fn;
			$r .= '/' if (-d $r);
			$nodepath = substr($nodepath, length($r));
			# parse file
			open F, "$root1/$nodepath";
			my @data1 = <F>;
			close F;
			next if (!-r "$root2/$nodepath");
			open F, "$root2/$nodepath";
			my @data2 = <F>;
			close F;
			print STDERR "[$root1:$root2 $nodepath]\n";
			my $set1;
			my $set2;
			my $refOrder1 = [];
			my $refOrder2 = [];
			if ($nodepath =~ /\.dtd$/) {
				$set1 = &parsemozdtd($refOrder1, @data1);
				$set2 = &parsemozdtd($refOrder2, @data2);
			} elsif ($nodepath =~ /\.properties$/) {
				$set1 = &parsemozproperties($refOrder1, @data1);
				$set2 = &parsemozproperties($refOrder2, @data2);
			} else { };
			for my $k (keys %{$set1}) {
				next if lc($k) =~ /accesskey$/;
				next if (!exists $set2->{$k});
				next if ($set1->{$k} eq $set2->{$k});

				if (!exists $db{$nodepath}{$k}) {
					$db{$nodepath}{$k} = {
						$now => {
							en => $set1->{$k},
							tr => $set2->{$k},
						},
						ts => "$now",
					}
				}
			}
		}
		# write database
		&writeDb();
		&printCurrent($currentfn, 0);
	} else {
		print <<"HERE";
usage: mozlcdb.pl [-uUixXen] [PATH] ...

[-u]   : (default) update editing table ($currentfn) to database
-U [files...]: import/update from editing table
-i ROOT: import files from ROOT(jar file or directory root)
-x ROOT: extract and update files in ROOT.
-X ROOT: extract and update files in ROOT, ignore errors.
-e     : generate latest version of full table from database
-n ROOT1 ROOT2: init with ROOT1 as en while ROOT2 as tr [CARE]

HERE
		exit(0);
	}
} # }}}

&main ();

# {{{ Utility functions and database I/O
sub reverseTimestamps {
	my @ts = @_;
	@ts = grep {/^[0-9][0-9]*$/} @ts;
	@ts = sort {$a <=> $b} @ts;
	@ts = reverse(@ts);
	return @ts;
}

sub listdir { #recursive dir file entries generation
	my ($root) = @_;
	opendir(DIR, $root) || die "can't opendir $root: $!";
	my @ents = readdir(DIR);
	my @ent2 = ();
	my $ient2 = 0;
	closedir DIR;
	foreach my $e (@ents) {
		next if ("$e" eq '.' || "$e" eq '..');
		$e = "$root/$e";
		if (-f $e) {
			$ent2[$ient2++] = $e;
			next;
		} elsif ( -d $e ) {
			my @ent3 = &listdir($e);
			$ent2[$ient2++] = $_ for (@ent3);
		}
	}
	return @ent2;
}

sub readDb {
	# Read database
	if (-f $glossaryfn) {
		require $glossaryfn;
		my $sysdb = &loadDatabase();
		%db = %{$sysdb->{DB}};
		%sys = %{$sysdb->{SYS}};
	}
}

sub writeDb {
	print STDERR "Backup database...";
	#backup first
	if (-f $glossaryfn) {
		open F, "<$glossaryfn";
		my @data = <F>;
		close F;
		open F, ">$glossaryfn.bak";
		print F @data;
		close F;
	}
	print STDERR "Done.\n";
	# Flush out database
	#print STDERR "Preparing database...";
	#my $s = Dumper(\%db, \%sys);
	print STDERR "Done.\n";
	print STDERR "Writing database...";
	open F, ">$glossaryfn";
	print F "#!/usr/bin/env perl\n";
	print F "# [MozLCDB] Database File\n";
	print F "sub loadDatabase {\n\n";
	print F Dumper(\%db, \%sys);
	#print F $s;
	print F <<HERE;
	my \$ret = {
		DB => \$VAR1,
		SYS => \$VAR2,
	};
	return \$ret;
}
1;
# vim:sw=2:ts=2
HERE
	close F;
	print STDERR "Done.\n";
}
# }}}

# {{{ dtd/properties parser
sub parsemozdtd {
	# only ENTITY in mozilla dtd for langpack.
	my ($refOrder, @xml) = @_;
	my (%definitions);

	my $namechar = '[#\x41-\x5A\x61-\x7A\xC0-\xD6\xD8-\xF6\xF8-\xFF0-9\xB7._:-]';
	my $name = '[\x41-\x5A\x61-\x7A\xC0-\xD6\xD8-\xF6\xF8-\xFF_:]' . $namechar . '*';
	my $xml = join(" ", @xml);

	$xml =~ s/\s\s*/ /gs;
	$xml =~ s{<!--.*?-->}{}gs;
	$xml =~ s{<\?.*?\?>}{}gs;

	while ($xml =~ s{<!ENTITY\s+(?:(%)\s*)?($name)\s*"(.*?)"\s*>}{}io) {
		my ($percent, $entity, $definition) = ($1,$2,$3);
		# ignore access keys
		#$percent = '&' unless $percent;
		#$definitions{"$percent$entity"} = $definition;
		$definitions{"$entity"} = $definition;
		push @{$refOrder}, $entity;
	}
	return \%definitions;
}

sub outputmozdtd {
	my ($refOrder, %ents) = @_;
	my $ks = keys(%ents);
	my $ks2 = @{$refOrder};
	if ($ks2 != $ks) {
		# usually when original file has 2 entities with same keyname
		# in one file, you'll see this.
		print STDERR "[ERROR] Suggested ordering is not equal to set size ($ks : $ks2).\nCheck the file to see if any 2 entities used same key name.\n";
		exit(-1);
	}
	my $s = "<!-- Generated by MozLCDB, http://moztw.org/tools/mozlcdb -->\n";
	foreach my $k (@{$refOrder}) {
		my $v = $ents{$k};
		$v =~ s/"/&quot;/g;
		$s .= "<!ENTITY $k \"$v\">\n";
	}
	return $s;
}

sub prop_escape_key {
	$_[0] = decode('utf-8', $_[0]);
    $_[0]=~s{([\\"' =:])}{
	"\\".($1) }ge;
    $_[0]=~s{([^\x20-\x7e])}{sprintf "\\u%04x", ord $1}ge;
    $_[0]=~s/^ /\\ /;
    $_[0]=~s/^([#!])/\\$1/;
    $_[0]=~s/(?<!\\)((?:\\\\)*) $/$1\\ /;
}

sub prop_escape_value {
	$_[0] = decode('utf-8', $_[0]);
    $_[0]=~s{([\\])}{
	"\\".($1) }ge;
    $_[0]=~s{([^\x20-\x7e])}{sprintf "\\u%04x", ord $1}ge;
    $_[0]=~s/^ /\\ /;
}

sub prop_unescape {
    $_[0]=~s/\\([\\"' =:#!])|\\u(000[aAdD])|\\u([\da-fA-F]{4})/
	defined $1 ? $1 : defined $2? '\n' : encode('utf-8', chr hex $2) /ge;
}

sub outputmozproperties {
	my ($refOrder, %ents) = @_;
	my $s = "# Generated by MozLCDB, http://moztw.org/tools/mozlcdb\n";
	my $ks = keys(%ents);
	if (@{$refOrder} != $ks) {
		print STDERR "[ERROR] Suggested ordering is not equal to set size.\n";
		exit(-1);
	}
	foreach my $k (@{$refOrder}) {
		my $v = $ents{$k};
		prop_escape_key($k);
		prop_escape_value($v);
		$s .= "$k=$v\n";
#		# convert v, old method
#		$v = decode('utf-8', $v);
#		$s .= "$k=";
#		my @v = split(//, $v);
#		foreach (@v) {
#			if (ord($_) > 0x80) {
#				$s .= sprintf("\\u%04X", ord($_));
#			} else {
#				$s .= $_;
#			}
#		}
#		$s .= "\n";
	}
	return $s;
}

sub parsemozproperties {
	#my ($flUnescapeValue, @s) = @_;
	my ($refOrder, @s) = @_;
	my %props = ();

	my @lines = ();
	my $lineno = 0;
	foreach my $line (@s) {
		$lineno ++;
		if (@lines > 0) {
			$line =~ s/\x0D*\x0A$//;
			$line =~ s/^\s+//;
		} else {
			next if($line =~ /^\s*(\#|\!|$)/);
			$line =~ s/\x0D*\x0A$//;
		}
		# handle continuation lines
		if ($line =~ /(\\+)$/ and length($1) & 1) {
			$line =~ s/\\$//;
			push @lines, $line;
			next;
		}
		# finish
		$line=join('', @lines, $line) if @lines > 0;
		@lines = ();

		my ($key, $value) = $line =~ /^
				  \s*
				  ((?:[^\s:=\\]|\\.)+)
				  \s*
				  [:=\s]
				  \s*
				  (.*)
				  $
				  /x
		  or die "invalid property line in L$lineno '$line'";
	
		&prop_unescape($key);
		&prop_unescape($value); # if $flUnescapeValue;
		$props{$key} = $value;
		push @{$refOrder}, $key;
	}
	return \%props;
}

# }}}

# vim:tabstop=4:sw=4:foldcolumn=2:foldmethod=marker
