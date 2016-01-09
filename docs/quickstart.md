Quickstart
==========

Download or Compile gocryptfs
-----------------------------

If you are running Fedora or a Debian-based Linux distribution like Ubuntu,
chances are that the precompiled binaries will work on your system.
Download the corresponding binary for your system from the
[github releases page](https://github.com/rfjakob/gocryptfs/releases) and
extract the archive into `~/bin`.

If you want or need to compile from source, see the [Compile](compile.md) page for
instructions.

Once you have gocrypts in `~/bin`, running

	$ ~/bin/gocryptfs -version

should print a version string like this:

	gocryptfs v0.x; on-disk format 2

Create and Mount Filesystem
---------------------------

	$ mkdir cipher plain
	$ ~/bin/gocryptfs -init cipher
	  [...]
	$ ~/bin/gocryptfs cipher plain
	  [...]

You should now have a working gocryptfs that is stored in `cipher` and mounted to `plain`.
You can verify it by creating a test file in the `plain` directory. This file will show
up encrypted in the `cipher` directory.

	$ touch plain/test.txt
	$ ls cipher
	  gocryptfs.conf  gocryptfs.diriv  ZSuIZVzYDy5-TbhWKY-ciA==
