all: bundle
	$(MAKE) -C bundle

# Not built by default. Just here in case I need it on some machine later
vim: vim_src
	sudo apt-get install mercurial build-essential ncurses-dev
	cd vim_src/src && ./configure --with-features=huge --enable-pythoninterp --enable-rubyinterp --prefix=${HOME}/config/local
	cd vim_src/src && make
	cd vim_src/src && make install

# Checkout Vim source code
vim_src:
	hg clone https://vim.googlecode.com/hg/ vim_src
