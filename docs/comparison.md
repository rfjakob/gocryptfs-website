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

<!--
The comparison table is too wide in markdown syntax to be edited sanely,
which is why I converted it to html.
Still, I recommend to edit it via a graphical editor like
http://www.tablesgenerator.com/html_tables .
-->

<table>
  <tr>
    <th></th>
    <th>gocryptfs</th>
    <th>encfs</th>
    <th>ecryptfs</th>
    <th>cryptomator</th>
    <th>securefs</th>
    <th>CryFS</th>
  </tr>
  <tr>
    <td>First release</td>
    <td>2015 [1]</td>
    <td>2003 [2]</td>
    <td>2006 [3]</td>
    <td>2014 [4]</td>
    <td>2015 [10]</td>
    <td>2015</td>
  </tr>
  <tr>
    <td>Language</td>
    <td>Go</td>
    <td>C++</td>
    <td>C</td>
    <td>Java</td>
    <td>C++</td>
    <td>C++</td>
  </tr>
  <tr>
    <td>License</td>
    <td>MIT</td>
    <td>LGPL/GPL [5]</td>
    <td>GPL</td>
    <td>MIT</td>
    <td>MIT</td>
    <td>LGPL</td>
  </tr>
  <tr>
    <td>Development hotspot</td>
    <td>Austria</td>
    <td>USA</td>
    <td>UK (Canonical Ltd)</td>
    <td>Germany</td>
    <td>China</td>
    <td>Germany</td>
  </tr>
  <tr>
    <td>Lifecycle</td>
    <td>Active</td>
    <td>Maintainance</td>
    <td>Active  [9]</td>
    <td>Active</td>
    <td>Active</td>
    <td>Active</td>
  </tr>
  <tr>
    <td>File interface</td>
    <td>FUSE</td>
    <td>FUSE</td>
    <td>in-kernel filesystem</td>
    <td>WebDAV</td>
    <td>FUSE</td>
    <td>FUSE</td>
  </tr>
  <tr>
    <td>Platforms</td>
    <td>Linux, 3rd-party Windows port [11], OSX in progress [7]</td>
    <td>Linux, OSX, 3rd-party Windows port</td>
    <td>Linux only</td>
    <td>Linux, OSX, Windows</td>
    <td>Linux, OSX</td>
    <td>Linux</td>
  </tr>
  <tr>
    <td>User interface</td>
    <td>CLI; 3rd-party GUI: [SiriKali](https://mhogomchungu.github.io/sirikali/)</td>
    <td>CLI; 3rd-party GUI</td>
    <td>Integrated in login process</td>
    <td>GUI only; CLI planned [8]</td>
    <td>CLI</td>
    <td>CLI, 3rd-party GUI</td>
  </tr>
  <tr>
    <td>Lines of Code {1}</td>
    <td>6,343</td>
    <td>9,320</td>
    <td>7,662 {2}</td>
    <td>9,921</td>
    <td>4,704 {3}</td>
    <td>30,036 {4}</td>
  </tr>
  <tr>
    <td>Reverse Mode</td>
    <td>yes (since v1.1)</td>
    <td>yes</td>
    <td>no</td>
    <td>no</td>
    <td>no</td>
    <td>no</td>
  </tr>
</table>

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
| File size obfuscation | no        | no                      | no                      | yes (4 KB increments) | no [3]                 | no       | yes (chunked storage) |

References:
[[1]](https://github.com/vgough/encfs/issues/9)
[[2]](https://github.com/cryptomator/cryptomator/issues/128#issuecomment-168942517)
[[3]](https://github.com/cryptomator/cryptomator/releases/tag/1.2.0)

File Names
----------

|                          |       gocryptfs       |    encfs default     |    encfs paranoia    | ecryptfs | cryptomator |     securefs    |    CryFS     |
| ------------------------ | --------------------- | -------------------- | -------------------- | -------- | ----------- | --------------- | ------------ |
| Encryption               | EME [4]               | CBC                  | CBC                  | CBC      | SIV         | GCM (B+ dir DB) | GCM (dir DB) |
| Prefix leak              | no (EME)              | no (HMAC used as IV) | no (HMAC used as IV) | yes [2]  | no (SIV)    | no (GCM)        | no (GCM)     |
| Identical names leak     | no (per-directory IV) | no (path chaining)   | no (path chaining)   | yes [1]  | no [3]      | no (GCM)        | no (GCM)     |
| Maximum name length [5]  | 255 (since v0.9) {2}  | 175                  | 175                  | 143      | 1025        | 255             | 1025         |
| Directory flattening {1} | no                    | no                   | no                   | no       | yes         | yes             | yes          |

References:
[[1]](https://gist.github.com/rfjakob/a04364c55b3ee231078d)
[[2]](https://gist.github.com/rfjakob/61a17bf3c7eb9932d791)
[[3]](https://github.com/cryptomator/cryptomator/commit/3b178030c7a6001c1d070ee181aaae71f760d33f)
[[4]](https://github.com/rfjakob/eme)
[[5]](https://github.com/rfjakob/gocryptfs/blob/master/tests/maxlen.bash)

Notes:  
{1} Is the directory tree flattened in the encrypted storage? This
    obfuscates the directory structure but can cause problems when
    synchronising via Dropbox and similar.  
{2} 255 since gocryptfs v0.9, 175 in v0.8 and earlier

Performance
-----------

All tests are run on tmpfs rule out any influence of the hard disk.
The CPU is an Intel Pentium G630 with 2 x 2.7GHz that does NOT have AES instructions.

|                          | gocryptfs | encfs default | encfs paranoia |  ecryptfs |  cryptomator  | securefs {5} |CryFS {6} |
| ------------------------ | --------- | ------------- | -------------- | --------- | ------------- | ------------ | -------- |
| Streaming write          | 103 MiB/s | 104 MiB/s     | 56 MiB/s       | 130 MiB/s | 55 MiB/s      | 96 MiB/s     | 78 MiB/s |
| Extract linux-3.0.tar.gz | 22 s      | 20 s          | 23 s           | 8.4 s     | 468 s {1} {2} | 21 s         | 40 s     |
| ls -lR linux-3.0         | 1.7 s     | 2.8 s         | 2.8 s          | 0.5 s     | 127 s {3}     | 5.3 s        | 16.8 s   |
| Delete linux-3.0         | 4.3 s     | 3.9 s         | 4.1 s          | 0.5 s     | 376 s {3}     | 4.5 s        | 20.4 s   |

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
{5} Tested against securefs v0.5.2  
{6} Tested against CryFS v0.9.5  

Disk Space Efficiency
---------------------

(all file sizes in apparent bytes unless specified otherwise)

|                           | gocryptfs | encfs default | encfs paranoia |  ecryptfs |      cryptomator {1}      | securefs {2} |   CryFS   |
| ------------------------- | --------- | ------------- | -------------- | --------- | ------------------------- | ------------ | --------- |
| Empty file                | 0         | 0             | 0              | 8,192     | 88                        | 112          | 32,768    |
| 1 byte file               | 51        | 9             | 17             | 12,288    | 137                       | 161          | 32,768    |
| 1,000,000 bytes file      | 1,007,858 | 1,000,008     | 1,007,888      | 1,011,712 | 1,001,576                 | 1,011,872    | 1,048,576 |
| linux-3.0 source tree {3} | 498 MiB   | 485 MiB       | 488 MiB        | 784 MiB   | 498 MiB                   | (not tested) | 1470 MiB  |

Notes:  
{1} cryptomator dropped the use of a random padding in v1.2.0 due to performance concerns.  
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

