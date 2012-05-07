import sys, os, os.path, re
import roslib

import j

def ros_autocomplete(self, event):
    return ['roscd', 'rosmake', 'rosservice', 'roslaunch', 'rosrun']

def roscd_autocomplete(self, event):
    return roslib.packages.list_pkgs()

def rosmake_autocomplete(self, event):
    return roslib.packages.list_pkgs()

def rosrun_autocomplete(self, event):
    m = re.match('rosrun\s+\S*$', event.line)
    if m:
        # typing package
        return roslib.packages.list_pkgs()
    m = re.match('rosrun\s+(?P<pkg>\S+)\s+\S*', event.line)
    if m:
        # typing executable name
        executables = []
        for subdir in ['bin', 'scripts']:
            executables += roslib.resources.list_package_resources(m.group('pkg'), False, subdir)
        return executables
    return []    

def roslaunch_autocomplete(self, event):
    m = re.match('roslaunch\s+\S*$', event.line)
    if m:
        # typing package
        return roslib.packages.list_pkgs()
    m = re.match('roslaunch\s+(?P<pkg>\S+)\s+\S*', event.line)
    if m:
        # typing launchfile name
        return roslib.resources.list_package_resources(m.group('pkg'), False, 'launch')
    return []

def rosservice_autocomplete(self, event):
    m = re.match('rosservice\s+\S*')
    if m:
        # typing command
        return ['args', 'call', 'find', 'info', 'list', 'type', 'uri']
    return []

def rosload_autocomplete(self, event):
    m = re.match('rosload\s+\S*$', event.line)
    if m:
        # typing package
        return roslib.packages.list_pkgs()

def roscd_func(self, pkg):
    ip = self.api
    ip.runlines('cd %s' % roslib.packages.get_pkg_dir(pkg))

def rosload_func(self, pkg_name):
    '''
    Import roslib, load the manifest for the given package, and import rospy.
    '''
    print 'Importing roslib'
    import roslib
    print 'Loading %s manifest' % pkg_name
    roslib.load_manifest(pkg_name)
    self.api.runlines(
        ['try:',
         '    import rospy',
         '    print "Loaded rospy"',
         'except ImportError:',
         '    print "Package does not use rospy"'])
    self.api.runlines(
        ['try:',
         '    import %s' % pkg_name,
         '    print "Imported %s python module"' % pkg_name,
         'except ImportError:',
         '    print "Package does have a python module"'])

def getros_func(self, arg):
    ip = self.api
    for varname in ['ROS_MASTER_URI', 'ROS_ROOT', 'ROBOT']:
        try:
            print '%s: %s' % ( varname, os.environ[varname] )
        except KeyError:
            print '%s not set' % varname
    print 'ROS_PACKAGE_PATH:'
    for pkg_dir in os.environ['ROS_PACKAGE_PATH'].split(':'):
        print '    %s' % pkg_dir
    print 'PATH:'
    for path_dir in os.environ['PATH'].split(':'):
        print '    %s' % path_dir            

def rossetsim(self, arg):
    os.environ['ROBOT'] = 'sim'

def rviz(self, arg):
    ip = self.api
    ip.runlines('rosrun rviz rviz')

def initialize(ip):
    print 'Setting up ROS environment'
    ip.expose_magic('getros', getros_func)
    ip.expose_magic('roscd', roscd_func)
    ip.expose_magic('rosload', rosload_func)
    ip.expose_magic('rossetsim', rossetsim)
    ip.expose_magic('rviz', rviz)
    ip.set_hook('complete_command', roscd_autocomplete, re_key='roscd')
    ip.set_hook('complete_command', rosmake_autocomplete, re_key='rosmake')
    ip.set_hook('complete_command', rosservice_autocomplete, re_key='rosservice')
    ip.set_hook('complete_command', roslaunch_autocomplete, re_key='roslaunch')
    ip.set_hook('complete_command', rosload_autocomplete, re_key='rosload')
