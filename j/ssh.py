import subprocess, os, os.path

def send_key(hostname, port=22):
    dsa_path = os.path.expanduser('~/.ssh/id_dsa.pub')
    rsa_path = os.path.expanduser('~/.ssh/id_rsa.pub')
    if os.path.exists(dsa_path):
        my_pub_key = open(dsa_path).read()
    else:
        my_pub_key = open(rsa_path).read()
    cmd = ['ssh', '-p%d' % port, hostname, 'echo', '"'+my_pub_key+'"', '>>',
                     '.ssh/authorized_keys']
    print cmd
    subprocess.call(cmd)

