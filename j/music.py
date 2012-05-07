import os, os.path
from mutagen.easyid3 import EasyID3
from mutagen.oggvorbis import OggVorbis

audiolist = []

def read_metainfo(path):
    ext = path[-3:].lower()
    if ext == 'mp3':
        audio = EasyID3(path)
    elif ext == 'ogg':
        audio = OggVorbis(path)
    return audio

def delete_copies(songs, dirname, fnames):
    for fname in fnames:
        path = os.path.join(dirname, fname)
        try:
            audio = read_metainfo(path)
            song = (audio['artist'][0], audio['album'][0], audio['title'][0])
            # print song
            # print '%d songs so far' % len(songs)
            if song in songs:
                os.remove(path)
                print 'DUP:', song
            else:
                songs.add(song)
        except Exception, e:
            pass # print e


def handle_file(arg, dirname, fnames):
	global audiolist
	
	for fname in fnames:
		path = os.path.join(dirname, fname)
		ext = path[-3:].lower()
		try:
			if ext == 'mp3':
				audiolist.append(EasyID3(path))
				audiolist[-1]['title']
			elif ext == 'ogg':
				audiolist.append(OggVorbis(path))
				print 'SONG:', audiolist[-1]['title']
		except Exception, e:
			print path

if __name__ == '__main__':
	os.path.walk('/home/binney/Music', delete_copies, set())
