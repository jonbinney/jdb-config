import os, os.path, subprocess
import roslib

def jvc(cmd):
    if cmd == 'status':
        status()
    else:
        print 'ERROR: Unknown command %s' % cmd

def status():
    orig_dir = os.getcwd()
    for pkg_name in ['ppas', 'cont']:
        pkg_dir = roslib.packages.get_pkg_dir(pkg_name)
        print '==== %s' % pkg_dir
        os.chdir(pkg_dir)
        subprocess.call(['git', 'status'])
    os.chdir(orig_dir)

def initialize(ip):
    print 'Setting up version control'
    ip.expose_magic('jvc', jvc)
