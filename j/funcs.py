import time, re, os, subprocess

def get_battery_state():
    bat_state_str = open('/proc/acpi/battery/BAT0/state').read()
    return dict(re.findall('(.+):\s+(.+)', bat_state_str))

def convert_phonevids(path):
    for (dirname, subdirs, filenames) in os.walk(path):
        for filename in filenames:
            if filename[-4:].lower() == '.3gp':
                outfile = filename[:-4] + '.avi'
                to_xvid(filename, outfile)

def to_xvid(infile, outfile):
    args = ['mencoder', infile, '-ovc', 'xvid', '-xvidencopts',
            'bitrate=1200', '-oac', 'mp3lame', '-o', outfile]
    subprocess.call(args)

