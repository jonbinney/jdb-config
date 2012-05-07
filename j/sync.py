#!/usr/bin/env python
import subprocess, os, os.path

class ProjectSet:
    '''
    A collection of projects that can be managed as a set
    '''
    def __init__(self, projects):
        self.projects = projects # list of Project() objects

    def status_graph(self):
        '''
        Graph combining the status of all of the projects.  Clicking
        on a project should bring up more detailed info.  The file
        list should be one expandable item, and files can be
        added/removed from the repo or deleted here. Would be cool to
        have it be in animated star trek/ironman type display style.
        '''

class Project:
    def __init__(self, name, local_wds, remote_wds):
        self.name = name
        self.local_wds = local_wds
        self.remote_wds = remote_wds

    def status_graph(self):
        '''
        Show the graph representing the current synchronization state
        of all of the working directories for this project, with wds
        grouped by the host which they are on. plot a line between
        each node, blue near a node that is synchronized on this
        connection, or red to one that is not. nodes that cannot be
        contacted over the network are shown in grey, as are their
        part of each edge that they are on
        '''

class WorkingDirectory:
    def __init__(self, host, directory):
        self.host = host
        self.directory = directory

    def call(self, cmd):
        if self.host == localhost:
            subprocess.call(cmd)
        else:
            subprocess.call(['ssh', self.host] + cmd)

    def pull(self, remote_wd):
        # pull changes from remote
        return self.call(
            ['hg', '-R', self.directory, 'pull',
             'ssh://%s/%s' % (remote_host, remote_directory)])

    def push(self, remote_wd):
        # push local changes to remote
        return self.call(
            ['hg', '-R', self.directory, 'pull',
             'ssh://%s/%s' % (remote_host, remote_directory)])

    def update(self):
        # update local working directory
        return self.call(['hg', '-R', self.directory, 'update'])

    def commit(self, msg='...'):
        # commit local changes
        return self.call(['hg', '-R', self.directory, 'ci', '-m', msg])

    def log(self):
        return self.call(['hg', '-R', self.directory, 'log'])

    def sync(self, msg=msg, remote_wd):
        # commit remote changes before synchronizing
        remote_wd.commit()
        
        self.pull(remote)        
        self.update()
        self.merge()
        self.commit(msg)
        self.push(remote)

def sync():
    base_dir = '/home/binney'
    
    for directory in ['j', 'records', 'research', 'proj/ray_tree', 'emacs']:
        print 'Syncing [%s]' % directory
        os.chdir(os.path.join(base_dir, directory))
        subprocess.call(['pwd'])

        # commit remote changes
        subprocess.call(
            ['ssh', 'lab',
             'hg', 'ci', '-R', directory, '-m', 'sync'])
        
        # pull changes
        subprocess.call(
            ['hg', 'pull', '-e', 'ssh -p2424',
             'ssh://binney@cerberus.usc.edu/%s' % directory])
        
        # update local copy
        subprocess.call(['hg', 'update'])

        # merge changes
        subprocess.call(['hg', 'merge'])        
        
        # commit local changes
        subprocess.call(['hg', 'ci', '-m', 'sync'])
        
        # push local changes to server
        subprocess.call(
            ['hg', 'push', '-e', 'ssh -p2424',
             'ssh://binney@cerberus.usc.edu/%s' % directory])
