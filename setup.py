import os, os.path, re, shutil, time

def link_in_home(from_file, to_file):
    try:
        from_file = os.path.join(home_dir, from_file)
        to_file = os.path.join(home_dir, to_file)
        os.symlink(from_file, to_file)
    except OSError:
        print to_file, 'cannot be replaced'
	
home_dir = os.path.expanduser('~')

# make symlinks in home directory to config files
link_in_home('Config/emacs/.emacs', '.emacs')
link_in_home('Config/ssh/config', '.ssh/config')
link_in_home('Config/screen/.screenrc', '.screenrc')
link_in_home('Config/vim/.vimrc', '.vimrc')
link_in_home('Config/vim', '.vim')

# make .ipython/ipythonrc run my startup code
ipythonrc_filename = os.path.join(home_dir, '.ipython/ipythonrc')
f_str = open(ipythonrc_filename, 'rw').read()
if not re.search(r'JDB', f_str):
    print 'Adding custom startup script to ipythonrc file'
    shutil.copy(os.path.join(home_dir, '.ipython/ipythonrc'),
            os.path.join(home_dir, '.ipython/ipythonrc.bak.%f' % time.time()))
    f = open(os.path.join(home_dir, '.ipython/ipythonrc'), 'a')
    print >> f, '########################################'
    print >> f, '# Added by my setup script - JDB'
    print >> f, 'execfile %s' % os.path.join(home_dir, 'Config/ipython/startup')
    print >> f, '########################################'
    f.close()

