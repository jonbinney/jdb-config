import subprocess

# within j
import ssh, install, dropbox, ros

def run(cmd):
    output, return_code = subprocess.Popen(cmd, stdout=subprocess.PIPE).communicate()
    return output
