import sys, os, os.path, re

def set_env(ip, ros_root, ros_master_uri = 'http://localhost:11311', package_paths = []):
    '''
    Setup the environment variables used by ROS programs. Dont need to
    do this if you set these environment variables somewhere else
    (e.g. .bashrc) before launching ipython.
    '''
    os.environ['ROS_ROOT'] = ros_root
    os.environ['PATH'] = '%s/bin:%s' % (ros_root, os.environ['PATH'])
    os.environ['ROS_PACKAGE_PATH'] = ':'.join(package_paths)
    os.environ['ROS_MASTER_URI'] = ros_master_uri

    roslib_pythonpath = os.path.join(ros_root, 'core/roslib/src')
    if 'PYTHONPATH' in os.environ:
        os.environ['PYTHONPATH'] = ':'.join([roslib_pythonpath, os.environ['PYTHONPATH']])
    else:
        os.environ['PYTHONPATH'] = roslib_pythonpath

    # since we're doing this after the ipython process has started, setting
    # the PYTHONPATH variable doesn't affect sys.path, and we have to manually
    # update sys.path
    sys.path.append(roslib_pythonpath)

    import roslib
    return [roslib_pythonpath]
