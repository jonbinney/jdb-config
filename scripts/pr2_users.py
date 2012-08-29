#!/usr/bin/env python
import os, re, subprocess

user_re = re.compile(r'Active User: (.+)', re.MULTILINE)
acquired_re = re.compile(r'Acquired: (.*)$', re.MULTILINE)

pr2_list = ['pri', 'prj', 'prk', 'prl', 'prm', 'prn', 'pro', 'prq']

for pr2_name in pr2_list:
    try:
        output = subprocess.check_output(['ssh', pr2_name, 'robot', 'users'])
    except:
        print 'Unable to check %s' % pr2_name
        continue

    m = user_re.search(output)
    user = m.groups()[0]
    if user == 'None':
        acquired = ''
    else:
        m = acquired_re.search(output)
        acquired = m.groups()[0]
    print '%s: %s, %s' % (pr2_name, user, acquired)
