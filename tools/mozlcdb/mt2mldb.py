#!/usr/bin/env python
# vim:foldmethod=marker:foldenable:foldlevel=0:foldtext=getline(v\:foldstart+1):
#
# Author: "Hung-Te Lin" <piaip@csie.ntu.edu.tw>
#
""" Convert 'Mozilla Translator' glossary file to MLDB format """

import os

def keyequ(g, name, val) : # {{{
    """ keyequ(g, name, val):  return g[name] == val """
    if g.has_key(name) and g[name] == val : return 1
    return 0
# }}}
def cutdot(name) : # {{{
    """ cutdot(name):  cut one level of dot domain from name """
    return name[:name.rfind(".")]
# }}}
def taildot(name) : # {{{
    """ taildot(name):  return the last level of dot domain from name """
    return name[name.rfind(".")+1:]
# }}}
def read_glossary(filename, g) : # {{{
    """ read_glossary(filename, g): read original file data"""
    glos = open(filename, "r")
    print "Reading data from '"+filename+"'..."
    for s in glos.readlines() :
	if s[0] == '#' : continue
	s = s[:-1]
	# s format: 0.0.0.type = value
	t = s.split("=", 1)
	# t = ['0.0.0.type', 'value']
	ets = cutdot(t[0]) 	# 0.0.0
	ete = taildot(t[0])	# type
	et = {}
	if g.has_key(ets) : et = g[ets]
	et[ete] = t[1]	# [type]=value
	g[ets] = et
    glos.close()
    # read ok
    print "Total %d entries read." % (len(g))
# }}}
def write_glossary(filename, g) : # {{{
    """ write_glossary(filename, g): write out"""
    print "Writting out to '" + filename + "'..."
    a=open(filename, "w")
    for k in g.keys() : # k: { "type": "value" }
	for k2 in g[k].keys() :
	    a.write("%s.%s=%s\n" % (k, k2, g[k][k2]))
    a.close()
# }}}
def unquote(s) :
	s = s.replace("\\:", ":")
	s = s.replace("\\=", "=")
	s = s.replace("\\!", "!")
	s = s.replace("\\#", "#")
	s = s.replace("\\r", " ")
	s = s.replace("\\n", " ")
	s = s.replace("\\t", "	")
	s = s.replace("\\ ", " ")
	return s

def write_mldb(filename, g) : # {{{
    """ write_glossary(filename, g): write out"""
    # my locale target?
    mylocale = 'zh-TW'
    print "Writting out to '" + filename + "'..."
    a=open(filename, "w")
    gk = g.keys()
    gk.sort()
    lastfn = ""
    for k in gk : # k: { "type": "value" }
		if not g[k].has_key('note') :
			continue
		# lookup k from [n.n.n] -> [name.name.name]
		kn = ""
		realk = ""
		ik = 0
		for ks in k.split("."):
			ik = ik + 1
			kn = kn + ks;
			if ik == 1 :
				# ignore product
				None
			else :
				if g[kn].has_key("name") :
					# has name. append it.
					if g[kn]["name"] != "MT_default" :
						realk = realk + g[kn]["name"];
						if not g[kn + ".0"].has_key("note") :
							realk = realk + "/";
			kn = kn + ".";
		if not (realk.endswith(".dtd") or realk.endswith(".properties")) :
			continue
		if lastfn != realk :
			# different name
			lastfn = realk
			a.write("\n")
			a.write("[" + realk + "]\n")
			print "[" + realk + "]"
		if g[k]["key"].endswith(".accesskey") :
			continue
		# now , flush out the data.
		a.write("id=" + g[k]["key"] + "\n")
		a.write("en=" + unquote(g[k]["text"]) + "\n")
		trk = ""
		if g[k].has_key('count') :
			for li in range(int(g[k]["count"])) :
				nn = "%s.%d" % (k,li)
				if g[nn]["name"] == mylocale :
					trk = nn

		if trk != "" :
			tr = unquote(g[trk]["text"])
			a.write("tr=" + tr + "\n")

		kp = unquote(g[k]["keep"])
		if(kp == 'true') :
			a.write("kp=1\n")
		cm = unquote(g[k]["note"])
		if cm != '' :
			a.write("cm=" + cm + "\n")
		a.write("\n")
		#for k2 in g[k].keys() :
		#	a.write("%s.%s=%s\n" % (k, k2, g[k][k2]))
    a.close()
# }}}

if __name__ == "__main__" :
    # main start
    g = {}
    read_glossary("glossary.txt", g)
    write_mldb("mldb.out", g)
