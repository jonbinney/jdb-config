import os, os.path, re, shutil, time

config_dir = os.path.split(os.path.realpath(__file__))[0]

def link_in_home(from_file, to_file):
    from_file = os.path.join(config_dir, from_file)
    to_file = os.path.join(home_dir, to_file)

    try:
        # delete any existing file
        if os.path.lexists(to_file):
            os.unlink(to_file)

        os.symlink(from_file, to_file)
    except OSError as e:
        print to_file, 'cannot be replaced'
        print e
    print 'Linked %s to %s' % (from_file, to_file)

def insert_text_in_file(filename, text, comment_char):
    try:
        f_str = open(filename, 'rw').read()
        if not re.search(r'JDB', f_str):
            print 'Adding custom text to %s' % filename
            shutil.copy(filename, filename + '.bak_%f' % time.time())
            f = open(filename, 'a')
            print >> f, ''
            print >> f, comment_char * 78
            print >> f, '%s Added by my setup script - JDB' % comment_char
            print >> f, text
            print >> f, comment_char * 78
            f.close()
    except:
        print 'Unable to add custom text to %s' % filename

if __name__ == '__main__':
    home_dir = os.path.expanduser('~')
    print 'Home dir: %s' % home_dir
    print 'Config dir: %s' % config_dir
    
    # make symlinks in home directory to config files
    link_in_home('emacs/.emacs', '.emacs')
    link_in_home('ssh/config', '.ssh/config')
    link_in_home('screen/.screenrc', '.screenrc')
    link_in_home('vim/.vimrc', '.vimrc')
    link_in_home('vim', '.vim')
    link_in_home('x/.Xmodmap', '.Xmodmap')
    link_in_home('tmux/tmux.conf', '.tmux.conf')

    # have ipython call my stuff on startup
    #  needs to be updated for new ipython config structure...
    #ipythonrc_filename = os.path.join(home_dir, '.ipython/ipythonrc')
    #text = 'execfile %s' % os.path.join(home_dir, 'config/ipython/startup')
    #insert_text_in_file(ipythonrc_filename, text, '#')

    # have bash call my stuff on startup
    bashrc_filename = os.path.join(home_dir, '.bashrc')
    text = 'source %s' % os.path.join(home_dir, 'config/bash/bashrc')
    insert_text_in_file(bashrc_filename, text, '#')
    

