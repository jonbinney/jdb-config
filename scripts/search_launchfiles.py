#!/usr/bin/env python
import sys, os, re
import xml.etree.ElementTree
import roslib

var_re = re.compile(r'\$\((\w+)\s+(\w+)\)')
def expand_vars_cb(m):
    '''Takes a match and returns the replacement string.'''
    var_type = m.groups()[0]
    var_arg = m.groups()[1]
    if var_type == 'find':
        pkg_name = var_arg
        repl = roslib.packages.get_pkg_dir(pkg_name)
    elif var_type == 'env':
        repl = os.environ[var_arg]
    else:
        print 'unknown variable type:', m.groups()
        return ''
    return repl


def expand_vars(s):
    return var_re.sub(expand_vars_cb, s)
    

def search_launchfiles(launchfile, depth=0, search_re=None):
    launchfile_str = open(launchfile).read()
    if search_re and search_re.search(launchfile_str):
        print '!' + ' '*depth*8, launchfile
    else:
        print ' ' + ' '*depth*8, launchfile

    root = xml.etree.ElementTree.fromstring(launchfile_str)
    for el in root.findall('include'):
        if 'file' not in el.attrib:
            print 'Element has no file attribute!'
            continue
        child_launchfile = expand_vars(el.attrib['file'])
        search_launchfiles(child_launchfile, depth+1, search_re)
        

# parse command line args
toplevel_launchfile = sys.argv[1]
if len(sys.argv) > 2:
    search_re = re.compile(sys.argv[2])
else:
    search_re = None

# do a recursive search
search_launchfiles(toplevel_launchfile, search_re=search_re)

