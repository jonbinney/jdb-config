all: vim you_complete_me command_t

you_complete_me:
	cd bundle/YouCompleteMe && ./install.sh --clang-completer

command_t:
	cd bundle/command-t/ruby/command-t && ruby extconf.rb && make && cd -

# Build Vim from source, since YouCompleteMe needs a new version of Vim
vim: vim_src
	sudo apt-get install mercurial build-essential ncurses-dev
	cd vim_src/src && ./configure --with-features=huge --enable-pythoninterp --enable-rubyinterp --prefix=${HOME}/config/local
	cd vim_src/src && make
	cd vim_src/src && make install

# Checkout Vim source code
vim_src:
	hg clone https://vim.googlecode.com/hg/ vim_src


.phony: all
