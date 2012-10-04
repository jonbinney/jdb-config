import os, os.path, re, shutil, time

def link_in_home(from_file, to_file):
    try:
        from_file = os.path.join(home_dir, from_file)
        to_file = os.path.join(home_dir, to_file)
        os.symlink(from_file, to_file)
    except OSError:
        print to_file, 'cannot be replaced'

def insert_text_in_file(filename, text, comment_char):
    try:
        f_str = open(filename, 'rw').read()
        if not re.search(r'JDB', f_str):
            print 'Adding custom text to %s' % filename
            shutil.copy(filename, filename + '.bak_%f' % time.time())
            f = open(filename, 'a')
            print >> f, ''
            print >> f, comment_char * 78
            print >> f, '# Added by my setup script - JDB'
            print >> f, text
            print >> f, comment_char * 78
            f.close()
    except:
        print 'Unable to add custom text to %s' % filename

if __name__ == '__main__':
    home_dir = os.path.expanduser('~')
    
    # make symlinks in home directory to config files
    link_in_home('Config/emacs/.emacs', '.emacs')
    link_in_home('Config/ssh/config', '.ssh/config')
    link_in_home('Config/screen/.screenrc', '.screenrc')
    link_in_home('Config/vim/.vimrc', '.vimrc')
    link_in_home('Config/vim', '.vim')
    link_in_home('Config/tmux/tmux.conf', '.tmux.conf')
    link_in_home('Config/roxterm', '.config/roxterm.sourceforge.net')

    # have ipython call my stuff on startup
    #  needs to be updated for new ipython config structure...
    #ipythonrc_filename = os.path.join(home_dir, '.ipython/ipythonrc')
    #text = 'execfile %s' % os.path.join(home_dir, 'Config/ipython/startup')
    #insert_text_in_file(ipythonrc_filename, text, '#')

    # have bash call my stuff on startup
    bashrc_filename = os.path.join(home_dir, '.bashrc')
    text = 'source %s' % os.path.join(home_dir, 'Config/bash/bashrc')
    insert_text_in_file(bashrc_filename, text, '#')
    

