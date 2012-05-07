import re, sys, os.path

def dir_filter(re_str, dirname, filenames):
    for fname in [dirname] + filenames:
        if re.match(re_str, fname):
            print fname

os.path.walk(sys.argv[1], dir_filter, sys.argv[2])
