Compile gocryptfs from Source
=============================

You need to have the Go runtime and the OpenSSL headers installed to
compile gocryptfs.

On Fedora,

	$ sudo dnf install golang openssl-devel

On Debian and Ubuntu,

	$ sudo apt-get install golang libssl-dev

Also, GOPATH must be set. Usually it is simply set to the home directory:

	$ export GOPATH=~

Download Source Code
--------------------

	$ go get -d github.com/rfjakob/gocryptfs

Compile
-------

	$ ~/src/github.com/rfjakob/gocryptfs/build.bash

If successful, build.bash will copy the gocryptfs binary to ~/bin.

Test
----

	$ ~/src/github.com/rfjakob/gocryptfs/test.bash

The tests run about 1 minute and should produce the following output:

	ok  	github.com/rfjakob/gocryptfs/cryptfs	1.174s
	gocryptfs v0.7-15-gf01f599; on-disk format 2
	ok  	github.com/rfjakob/gocryptfs/integration_tests	12.409s

You can run "test.bash -v" to see the execution of individual tests. Note that
the tests also check error cases that produce error messages.
