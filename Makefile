all: apt_packages
	$(MAKE) -C vim

apt_packages:
	sudo apt-get install `cat apt/dev_packages`


install: all
	python setup.py

