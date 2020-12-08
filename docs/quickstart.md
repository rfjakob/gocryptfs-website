Quickstart
==========

Download or Compile gocryptfs
-----------------------------

Precompiled binaries that work on **all** x86_64 Linux systems are
available for download from the
[github releases page](https://github.com/rfjakob/gocryptfs/releases).

On Debian, gocryptfs is available as
[a deb package](https://packages.debian.org/search?keywords=gocryptfs&searchon=names&suite=all&section=all):

    $ apt install gocryptfs

On Mac OS X, gocryptfs is available as a
[Homebrew formula](https://github.com/Homebrew/homebrew-core/blob/master/Formula/gocryptfs.rb):

    $ brew install gocryptfs

On Fedora, gocryptfs is available as
[an rpm package](https://src.fedoraproject.org/rpms/golang-github-rfjakob-gocryptfs):

    $ sudo dnf install gocryptfs

gocryptfs is available in many other distributions in the following
versions:

[![Packaging status](https://repology.org/badge/vertical-allrepos/gocryptfs.svg?columns=4)](https://repology.org/project/gocryptfs/versions)

[![Packaging status](https://repology.org/badge/vertical-allrepos/go:github-rfjakob-gocryptfs.svg?columns=5&header=Packaging Status II)](https://repology.org/project/go:github-rfjakob-gocryptfs/versions)


If you want to compile from source, see the [Compile](compile.md) page for
instructions.

Once you have gocrypts installed, running

	$ gocryptfs -version

should print a version string like this:

    gocryptfs v1.4.3; go-fuse v20170619-28-g19acbd2; 2018-02-01 go1.9.2

Create and Mount Filesystem
---------------------------

	$ mkdir cipher plain
	$ gocryptfs -init cipher
	  [...]
	$ gocryptfs cipher plain
	  [...]

You should now have a working gocryptfs that is stored in `cipher` and mounted to `plain`.
You can verify it by creating a test file in the `plain` directory. This file will show
up encrypted in the `cipher` directory.

	$ touch plain/test.txt
	$ ls cipher
	  gocryptfs.conf  gocryptfs.diriv  ZSuIZVzYDy5-TbhWKY-ciA==
