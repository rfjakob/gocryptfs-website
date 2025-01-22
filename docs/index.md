gocryptfs - simple. secure. fast.
=================================

gocryptfs uses file-based encryption that is implemented as a mountable
FUSE filesystem.
Each file in gocryptfs is stored one corresponding encrypted file on
the hard disk. The
screenshot below shows a mounted gocryptfs filesystem (left) and the
encrypted files (right).

The encrypted files can be stored in any folder on your hard disk, a USB
stick or even inside the Dropbox folder. One advantage of file-based
encryption as opposed to disk encryption is that encrypted files can
be synchronised efficiently using standard tools like Dropbox or rsync.
Also, the size of the encrypted filesystem is dynamic and only limited
by the available disk space.

![](img/folders-side-by-side.gif)

This project was inspired by EncFS and strives to fix its security
issues while providing good performance,
see the [Comparison](comparison) page for benchmarks.

The [Cryptography](forward_mode_crypto.md) page details gocryptfs's
cryptographic design.
The highlights are: Scrypt password hashing, GCM encryption for all
file contents, EME wide-block encryption for file names with a per-directory
IV.

gocryptfs has reached version 1.0 on Jul 17, 2016. It has gone through
hours and hours of stress (fsstress, `tests/stress_tests`) and correctness
testing (xfstests, integrated test suite).
It is now considered ready for general consumption.

The old principle still applies: Important data should have a backup.
Also, keep a copy of your master key (printed on mount) in a safe place.
This allows you to access the data even if the gocryptfs.conf config
file is damaged or you lose the password.

Linux is fully supported. Beta-quality MacOS support is available, which
means things usually work fine, but you may hit the odd issue (please
file a ticket if you do!).

Third-party implementations exist for for

* Windows: [cppcryptfs](https://github.com/bailey27/cppcryptfs)
* Android: [DroidFS](https://github.com/hardcore-sushi/DroidFS)
* Python: [gocryptfs-inspect](https://github.com/slackner/gocryptfs-inspect)

gocryptfs is, and always will be, free software.

News
----

Latest release: [![Latest release](https://img.shields.io/github/release/rfjakob/gocryptfs.svg)](https://github.com/rfjakob/gocryptfs/releases)

2025-01-18<br>
Release [gocryptfs v2.5.0](https://github.com/rfjakob/gocryptfs/releases/tag/v2.5.0)
([changelog](https://github.com/rfjakob/gocryptfs#changelog))

2023-06-10<br>
Release [gocryptfs v2.4.0](https://github.com/rfjakob/gocryptfs/releases/tag/v2.4.0)
([changelog](https://github.com/rfjakob/gocryptfs#changelog))

2023-04-29<br>
Release [gocryptfs v2.3.2](https://github.com/rfjakob/gocryptfs/releases/tag/v2.3.2)
([changelog](https://github.com/rfjakob/gocryptfs#changelog))

2023-03-04<br>
Release [gocryptfs v2.3.1](https://github.com/rfjakob/gocryptfs/releases/tag/v2.3.1)
([changelog](https://github.com/rfjakob/gocryptfs#changelog))

2022-08-28<br>
Release [gocryptfs v2.3](https://github.com/rfjakob/gocryptfs/releases/tag/v2.3)
([changelog](https://github.com/rfjakob/gocryptfs#changelog))

2021-10-20<br>
Release [gocryptfs v2.2.1](https://github.com/rfjakob/gocryptfs/releases/tag/v2.2.1)
([changelog](https://github.com/rfjakob/gocryptfs#changelog))

2021-09-25<br>
Release [gocryptfs v2.2.0](https://github.com/rfjakob/gocryptfs/releases/tag/v2.2.0)
([changelog](https://github.com/rfjakob/gocryptfs#changelog))

2021-08-18<br>
Release [gocryptfs v2.1](https://github.com/rfjakob/gocryptfs/releases/tag/v2.1)
([changelog](https://github.com/rfjakob/gocryptfs#changelog))

2021-06-07<br>
Release [gocryptfs v2.0.1](https://github.com/rfjakob/gocryptfs/releases/tag/v2.0.1)
([changelog](https://github.com/rfjakob/gocryptfs#changelog))

2021-06-05<br>
Release [gocryptfs v2.0](https://github.com/rfjakob/gocryptfs/releases/tag/v2.0)
([changelog](https://github.com/rfjakob/gocryptfs#changelog))

2020-05-09<br>
Release [gocryptfs v1.8.0](https://github.com/rfjakob/gocryptfs/releases/tag/v1.8.0)
([changelog](https://github.com/rfjakob/gocryptfs#changelog))

2020-05-09<br>
Release [gocryptfs v1.8.0](https://github.com/rfjakob/gocryptfs/releases/tag/v1.8.0)
([changelog](https://github.com/rfjakob/gocryptfs#changelog))

2019-05-17<br>
Release [gocryptfs v1.7](https://github.com/rfjakob/gocryptfs/releases/tag/v1.7)
([changelog](https://github.com/rfjakob/gocryptfs#changelog))

2018-12-01<br>
gocryptfs is added to the offical Arch Linux repo
([commit](https://git.archlinux.org/svntogit/community.git/commit/trunk?h=packages/gocryptfs&id=1714dd305acbe2ada823f34fbaa390af11633086),
[package info](https://www.archlinux.org/packages/community/x86_64/gocryptfs/))

2018-08-18<br>
Release [gocryptfs v1.6](https://github.com/rfjakob/gocryptfs/releases/tag/v1.6)
([changelog](https://github.com/rfjakob/gocryptfs#changelog))

2019-07-29<br>
gocryptfs is added to Fedora 30 and rawhide:
[package info](https://src.fedoraproject.org/rpms/golang-github-rfjakob-gocryptfs)

2018-06-12<br>
Release [gocryptfs v1.5](https://github.com/rfjakob/gocryptfs/releases/tag/v1.5)
([changelog](https://github.com/rfjakob/gocryptfs#changelog))

2018-04-27<br>
Ubuntu 18.04 LTS is released, including gocryptfs v1.4.3:
[https://packages.ubuntu.com/bionic/gocryptfs](https://packages.ubuntu.com/bionic/gocryptfs)

2017-06-20<br>
Release [gocryptfs v1.4](https://github.com/rfjakob/gocryptfs/releases/tag/v1.4)
([changelog](https://github.com/rfjakob/gocryptfs#changelog))

2017-06-17<br>
Debian 9 "Stretch" is released, including gocryptfs v1.2:
[https://packages.debian.org/stretch/gocryptfs](https://packages.debian.org/stretch/gocryptfs)

2017-04-29<br>
Release [gocryptfs v1.3](https://github.com/rfjakob/gocryptfs/releases/tag/v1.3)
([changelog](https://github.com/rfjakob/gocryptfs#changelog))

2017-03-10<br>
Taylor Hornby of defuse.ca releases a cryptography design audit of gocryptfs:
[announcement](https://twitter.com/DefuseSec/status/840239275740405761),
[audit](https://defuse.ca/audits/gocryptfs.htm)

2016-12-04<br>
Release [gocryptfs v1.2](https://github.com/rfjakob/gocryptfs/releases/tag/v1.2)
([changelog](https://github.com/rfjakob/gocryptfs#changelog))

2016-10-30<br>
Added description of [Reverse Mode](reverse_mode) to the website

2016-10-19<br>
Release [gocryptfs v1.1](https://github.com/rfjakob/gocryptfs/releases/tag/v1.1)
([changelog](https://github.com/rfjakob/gocryptfs#changelog))

2016-07-17<br>
Release [gocryptfs v1.0](https://github.com/rfjakob/gocryptfs/releases/tag/v1.0)
([changelog](https://github.com/rfjakob/gocryptfs#changelog))
