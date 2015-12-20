gocryptfs Quickstart
====================

You need to have the Go runtime and the OpenSSL headers installed to
compile gocryptfs.

On Fedora,

	$ sudo dnf install golang openssl-devel

On Debian and Ubuntu,

	$ sudo apt-get install golang libssl-dev

Also, GOPATH must be set. Usually it is simply set to the home directory:

	$ export GOPATH=$HOME

Download
-------

	$ go get -d github.com/rfjakob/gocryptfs

Compile
-------

	$ ~/src/github.com/rfjakob/gocryptfs/build.bash
	$ mkdir -p ~/bin && cp ~/src/github.com/rfjakob/gocryptfs/gocryptfs ~/bin

Create and Mount Filesystem
---------------------------

	$ mkdir cipher plain
	$ ~/bin/gocryptfs -init cipher
	  [...]
	$ ~/bin/gocryptfs cipher plain
	  [...]
	$ echo test > plain/test.txt
	$ ls cipher
	  gocryptfs.conf  gocryptfs.diriv  ZSuIZVzYDy5-TbhWKY-ciA==

