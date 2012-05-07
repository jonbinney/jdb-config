import subprocess

dev_packages = [
    'build-essential',
    'ipython',
    'python-tk',
    'python-scipy',
    'python-matplotlib',
    'mayavi2',
    'scons',
    'emacs',
    'vim',
    'mercurial',
    'git',
    'python-mode',
    'inkscape',
    'subversion',
    'openssh-server',
    'cmake',
    'swig',
    'python-setuptools',
    'python-mutagen'
    ]

tex_packages = [
    'texlive',
    'texlive-publishers',
    'texlive-fonts-recommended',
    'texlive-latex-recommended',
    'texlive-latex-extra',
    'texlive-extra-utils',
    'texlive-science',
    'rubber',
    'lyx']

other_packages = [
    'firefox',
    'pidgin',
    'vlc',
    'k3b',
    'freemind'
    ]

all_packages = dev_packages + tex_packages + other_packages

def install():
    print '=============Installing============'
    print all_packages
    print '==================================='
    print ''
    
    subprocess.call(['sudo', 'apt-get', 'install'] + all_packages)
