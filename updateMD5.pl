#!/usr/bin/env perl
#
# update MD5 fingerprint
# usage: put a title="MD5:" entry in any html.
#
# Author: Hung-Te Lin <piaip@csie.ntu.edu.tw>
#

my $chkroot = 'dls';

foreach(@ARGV) {
	print STDERR "MD5 update: $_\n";
	open INF, "<$_";
	my @src = <INF>;
	close INF;

	open OUTF, ">$_";
	foreach (@src) {
		if ($_ =~ /MD5:\s*([a-zA-Z]{0,32})(.*)href=['"]\/?($chkroot[^'"]*)['"]/i) {
			if (-r $3) {
				open EMD5, "/sbin/md5 -q '$3'|";
				my @md5 = <EMD5>;
				close EMD5;
				my $md5 = join('', @md5);
				$md5 =~ s/\s//g;
				$_ =~ s/MD5:\s*([a-zA-Z]{0,32})/MD5: $md5/;
			}
		}
		print OUTF $_;
	}
	close OUTF;
}
