import os, os.path, re

dropbox_copy_re = re.compile('.*conflicted copy.*')

def clean(directory='.'):
    for root, dirs, files in os.walk(os.path.expanduser(directory)):
        for filename in files:
            path = os.path.join(root, filename)
            if dropbox_copy_re.match(filename):
                os.remove(path)
                print path
