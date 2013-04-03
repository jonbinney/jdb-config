#!/usr/bin/env python
import sys, os, os.path, stat

workspace_dir = sys.argv[1]

setup_filename = os.path.abspath(os.path.join(workspace_dir, 'setup.sh'))
env_filename = os.path.join(workspace_dir, 'env.sh')

env_file = open(env_filename, 'w+')
env_file.write(
'''
#!/bin/sh
. /etc/ros/distro/setup.sh
. %s

if [ $# -eq 0 ] ; then
    $SHELL
else
    exec "$@"
fi
''' % setup_filename
)
env_file.close()

os.chmod(env_filename, os.stat(env_filename).st_mode | stat.S_IXUSR)
