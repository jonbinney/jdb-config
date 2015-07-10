.phony: all
all: you_complete_me command_t nerdtree

you_complete_me:
	rm -rf YouCompleteMe && git clone --recursive https://github.com/Valloric/YouCompleteMe.git && cd YouCompleteMe && ./install.sh --clang-completer && cd -

command_t:
	rm -rf command-t && git clone https://github.com/wincent/command-t.git && cd command-t/ruby/command-t && ruby extconf.rb && make && cd -

# Just need to download nerd tree. Doesn't have anything to build.
nerdtree:
	rm -rf nerdtree && git clone https://github.com/scrooloose/nerdtree.git


