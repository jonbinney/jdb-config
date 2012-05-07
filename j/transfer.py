import sys, os.path, commands, tempfile

# make a temp directory to do conversions in
tempdir = tempfile.mkdtemp()
print tempdir

playlist = [line.strip() for line in open(sys.argv[1]).readlines()]
for filepath in playlist:
    (head, filename) = os.path.split(filepath)
    (basename, ext) = os.path.splitext(filename)
    ext = ext.lower()
    if ext == '.mp3':
        cmd = 'cp "%s" "%s"' % (filepath, os.path.join(tempdir, filename))
    elif ext == '.ogg':
        cmd = 'oggdec -o - "%s" | lame -S - "%s"' % (
            filepath, os.path.join(tempdir, basename + '.mp3'))
    print cmd
    (status, output) = commands.getstatusoutput(cmd)
    print output
    
