all: apt_packages
	$(MAKE) -C vim

apt_packages:
	sudo apt-get install `cat apt/packages`


install: all
	python setup.py

