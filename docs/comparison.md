Other Projects
==============

There are several open-source file encryption solutions for Linux available. In contrast
to disk-encryption software that operate on whole disks (TrueCrypt, dm-crypt etc), file
encryption operates on individual files that can be backed up or synchronised easily.

This page compares:

* [gocryptfs](https://nuetzlich.net/gocryptfs/) (this project), aspiring successor of EncFS
* [EncFS](https://github.com/vgough/encfs), mature with known security issues
* [eCryptFS](http://ecryptfs.org/), integrated into the Linux kernel
* [Cryptomator](https://cryptomator.org/), strong cross-platform support through Java and WebDAV
* [securefs](https://github.com/netheril96/securefs), a new C++ project that implementes directories as user-space B+ trees
* [CryFS](https://www.cryfs.org/), result of a master thesis at the KIT University that uses
  chunked storage. The tested version is `0.9.5-1-g5442662`.

If you spot an error or want to see a project added, please
[file a ticket](https://github.com/rfjakob/gocryptfs-website)!

Overview
--------

|                     |                                 gocryptfs                                 |               encfs                |           ecryptfs          |        cryptomator        |  securefs  |       CryFS        |
| ------------------- | ------------------------------------------------------------------------- | ---------------------------------- | --------------------------- | ------------------------- | ---------- | ------------------ |
| First release       | 2015 [1]                                                                  | 2003 [2]                           | 2006 [3]                    | 2014 [4]                  | 2015 [10]  | 2015               |
| Language            | Go                                                                        | C++                                | C                           | Java                      | C++        | C++                |
| License             | MIT                                                                       | LGPL/GPL [5]                       | GPL                         | MIT                       | MIT        | LGPL               |
| Development hotspot | Austria                                                                   | USA                                | UK (Canonical Ltd)          | Germany                   | China      | Germany            |
| Lifecycle           | Active                                                                    | Maintainance                       | Active  [9]                 | Active                    | Active     | Active             |
| File interface      | FUSE                                                                      | FUSE                               | in-kernel filesystem        | WebDAV                    | FUSE       | FUSE               |
| Platforms           | Linux, 3rd-party Windows port [11], OSX in progress [7]                   | Linux, OSX, 3rd-party Windows port | Linux only                  | Linux, OSX, Windows       | Linux, OSX | Linux              |
| User interface      | CLI; 3rd-party GUI: [cryfs-gui](http://mhogomchungu.github.io/cryfs-gui/) | CLI; 3rd-party GUI                 | Integrated in login process | GUI only; CLI planned [8] | CLI        | CLI, 3rd-party GUI |
| Lines of Code {1}   | 5,109                                                                     | 9,320                              | 7,662 {2}                   | 9,921                     | 4,704 {3}  | 30,036 {4}         |
| Reverse Mode        | no [12]                                                                   | yes                                | no                          | no                        | no         | no                 |

References:
[[1]](https://github.com/rfjakob/gocryptfs/releases/tag/v0.1)
[[2]](https://github.com/vgough/encfs/blob/master/ChangeLog#L1442)
[[3]](https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=237fead619984cc48818fe12ee0ceada3f55b012)
[[4]](https://github.com/cryptomator/cryptomator/releases/tag/v0.1.0)
[[5]](https://github.com/vgough/encfs/blob/master/COPYING)
[[6]](https://github.com/cryptomator/cryptomator/tree/master/LICENSES)
[[7]](https://github.com/rfjakob/gocryptfs/issues/15)
[[8]](https://github.com/cryptomator/cryptomator/issues/43)
[[9]](https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/log/fs/ecryptfs)
[[10]](https://github.com/netheril96/securefs/releases/tag/v0.10)
[[11]](https://github.com/bailey27/cppcryptfs)
[[12]](https://github.com/rfjakob/gocryptfs/issues/19)

Notes:  
{1} All computed using `cloc`  
{2} Counting only `fs/ecryptfs/`  
{3} The securefs `source/` directory contains embedded libraries. The count is produced using
"cloc btree_dir.h commands.h exceptions.h file_table.h files.h logger.h operations.h streams.h
utils.h xattr_compat.h btree_dir.cpp commands.cpp file_table.cpp files.cpp logger.cpp
operations.cpp streams.cpp utils.cpp"
and contains the files actually comprising securefs as
[stated by the author](https://github.com/netheril96/securefs/issues/2#issuecomment-170349572).  
{4} `cloc . --exclude-dir=vendor`

General Security
----------------

|                         | gocryptfs | encfs default | encfs paranoia |               ecryptfs               | cryptomator | securefs |  CryFS  |
| ----------------------- | --------- | ------------- | -------------- | ------------------------------------ | ----------- | -------- | ------- |
| Documentation available | Yes [1]   | Yes [2]       | Yes [2]        | No [4]                               | Yes [3]     | Yes [5]  | Yes [6] |
| Password hashing        | scrypt    | PBKDF2        | PBKDF2         | (none, implemented in external tool) | scrypt      | PBKDF2   | scrypt  |


References:
[[1]](security.md)
[[2]](https://github.com/vgough/encfs/blob/master/DESIGN.md)
[[3]](https://cryptomator.org/#security)
[[5]](https://github.com/netheril96/securefs/blob/master/docs/design.md)
[[6]](https://www.cryfs.org/howitworks)  
[[4]](http://ecryptfs.org/documentation.html) actually, there is a lot of ecryptfs documentation, but none of
it seems to describe the used crypto.

File Contents
-------------

|                       | gocryptfs |      encfs default      |      encfs paranoia     |        ecryptfs       |      cryptomator       | securefs |         CryFS         |
| --------------------- | --------- | ----------------------- | ----------------------- | --------------------- | ---------------------- | -------- | --------------------- |
| Encryption            | GCM       | CBC; last block CFB [1] | CBC; last block CFB [1] | CBC                   | CTR with random IV [2] | GCM      | GCM                   |
| Integrity             | GCM       | none                    | HMAC                    | none                  | HMAC                   | GCM      | GCM                   |
| File size obfuscation | no        | no                      | no                      | yes (4 KB increments) | yes (random padding)   | no       | yes (chunked storage) |

References:
[[1]](https://github.com/vgough/encfs/issues/9)
[[2]](https://github.com/cryptomator/cryptomator/issues/128#issuecomment-168942517)

File Names
----------

|                          |       gocryptfs       |    encfs default     |    encfs paranoia    | ecryptfs | cryptomator |     securefs    |    CryFS     |
| ------------------------ | --------------------- | -------------------- | -------------------- | -------- | ----------- | --------------- | ------------ |
| Encryption               | EME [4]               | CBC                  | CBC                  | CBC      | SIV         | GCM (B+ dir DB) | GCM (dir DB) |
| Prefix leak              | no (EME)              | no (HMAC used as IV) | no (HMAC used as IV) | yes [2]  | no (SIV)    | no (GCM)        | no (GCM)     |
| Identical names leak     | no (per-directory IV) | no (path chaining)   | no (path chaining)   | yes [1]  | yes [3]     | no (GCM)        | no (GCM)     |
| Maximum name length [5]  | 256 {2}               | 176                  | 176                  | 144      | 1026        | 256             | 1025         |
| Directory flattening {1} | no                    | no                   | no                   | no       | yes         | yes             | yes          |

References:
[[1]](https://gist.github.com/rfjakob/a04364c55b3ee231078d)
[[2]](https://gist.github.com/rfjakob/61a17bf3c7eb9932d791)
[[3]](https://github.com/cryptomator/cryptomator/issues/128)
[[4]](https://github.com/rfjakob/eme)
[[5]](https://github.com/rfjakob/gocryptfs/blob/master/tests/maxlen.bash)

Notes:  
{1} Is the directory tree flattened in the encrypted storage? This
    obfuscates the directory structure but can cause problems when
    synchronising via Dropbox and similar.  
{2} 256 since gocryptfs v0.9, 176 in v0.8 and earlier

Performance
-----------

All tests are run on tmpfs rule out any influence of the hard disk.
The CPU is an Intel Pentium G630 with 2 x 2.7GHz that does NOT have AES instructions.

|                          | gocryptfs | encfs default | encfs paranoia |  ecryptfs |  cryptomator  | securefs |  CryFS   |
| ------------------------ | --------- | ------------- | -------------- | --------- | ------------- | -------- | -------- |
| Streaming write          | 103 MiB/s | 104 MiB/s     | 56 MiB/s       | 130 MiB/s | 55 MiB/s      | 60 MiB/s | 78 MiB/s |
| Extract linux-3.0.tar.gz | 22 s      | 20 s          | 23 s           | 8.4 s     | 468 s {1} {2} | 25 s     | 40 s     |
| ls -lR linux-3.0         | 1.7 s     | 2.8 s         | 2.8 s          | 0.5 s     | 127 s {3}     | 4.2 s    | 16.8 s   |
| Delete linux-3.0         | 4.3 s     | 3.9 s         | 4.1 s          | 0.5 s     | 376 s {3}     | 5.3 s    | 20.4 s   |

Repeating (a subset of) the tests on an Samsung 840 EVO SSD shows that ecryptfs falls behind in metadata reads
because its complex file headers causes extra disk accesses {4}.

|                          | gocryptfs | encfs paranoia |  ecryptfs |
| ------------------------ | --------- | -------------- | --------- |
| Streaming write          | 65 MiB/s  | 50 MiB/s       | 116 MiB/s |
| Extract linux-3.0.tar.gz | 26 s      | 24 s           | 8.7 s     |
| ls -lR linux-3.0         | 2.5 s     | 3.2 s          | 8.6 s     |
| Delete linux-3.0         | 5.3 s     | 4.7 s          | 8.8 s     |

Notes:  
{1} All file acesses to cryptomator go through the WebDAV protocol, which is less performance-oriented than FUSE.  
However, an optimized WebDAV client may be able to significantly speed up small-file workloads.  
{2} Tested with the dave cli WebDAV client, which gave better speed than gvfs (Gnome built-in) and davfs2  
{3} Tested with gvfs in the `/run/user/.../gvfs/dav:...` mount  
{4} Caches are cleared between each test using `echo 3 > /proc/sys/vm/drop_caches`

Disk Space Efficiency
---------------------

(all file sizes in apparent bytes unless specified otherwise)

|                           | gocryptfs | encfs default | encfs paranoia |  ecryptfs |      cryptomator {1}      | securefs {2} |   CryFS   |
| ------------------------- | --------- | ------------- | -------------- | --------- | ------------------------- | ------------ | --------- |
| Empty file                | 0         | 0             | 0              | 8,192     | 104 - 4,231               | 112          | 32,768    |
| 1 byte file               | 51        | 9             | 17             | 12,288    | 104 - 4,231               | 161          | 32,768    |
| 1,000,000 bytes file      | 1,007,858 | 1,000,008     | 1,007,888      | 1,011,712 | 1,001,096 - 1,101,192 [1] | 1,011,872    | 1,048,576 |
| linux-3.0 source tree {3} | 498 MiB   | 485 MiB       | 488 MiB        | 784 MiB   | (not tested)              | (not tested) | 1470 MiB  |

Notes:  
{1} cryptomator adds a random padding which is why the resulting size is non-deterministic.  
{2} securefs stores data and crypto metadata (nonces + GHASH) in separate files. The sum of both is shown here.  
{3} Measured using "du -sm" on the encrypted directory. The backing filesystem is tmpfs.

References:
[[1]](https://github.com/cryptomator/cryptomator/issues/128#issuecomment-169056079)

Filesystem Features
-------------------

Note: To keep the work of maintaining this table under control, I have only
tested selected projects with respect to filesystem features.
Please file a pull request if you can test the other projects!

The backing filesystem is assumed to be ext4.

|                      | ext4 | gocryptfs | encfs default | encfs paranoia | ecryptfs | CryFS |
| -------------------- | ---- | --------- | ------------- | -------------- | -------- | ----- |
| hard links           | yes  | yes       | yes           | no             | yes      | no    |
| fallocate            | yes  | yes       | no            | no             | no       | no    |
| fallocate KEEP_SIZE  | yes  | yes       | no            | no             | no       | no    |
| fallocate PUNCH_HOLE | yes  | no        | no            | no             | no       | no    |
