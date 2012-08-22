#!/usr/bin/env python
import sys, os.path

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
    /bin/echo "Entering environment at /opt/ros/fuerte"
    $SHELL
    /bin/echo "Exiting build environment at /opt/ros/fuerte"
else
    exec "$@"
fi
''' % setup_filename
)
env_file.close()
