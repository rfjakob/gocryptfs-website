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
* [securefs](https://github.com/netheril96/securefs), a cross-platform project implemented in C++
* [CryFS](https://www.cryfs.org/), result of a master thesis at the KIT University that uses
  chunked storage

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
    <th>gocryptfs <br> v1.4.1</th>
    <th>encfs <br> v1.9.2</th>
    <th>ecryptfs <br> v4.13</th>
    <th>cryptomator <br> v1.3.1</th>
    <th>securefs <br> v0.7.3</th>
    <th>CryFS <br> v0.9.7</th>
  </tr>
  <tr>
    <td>First release</td>
    <td>2015 (<a href="https://github.com/rfjakob/gocryptfs/releases/tag/v0.1">ref</a>) </td>
    <td>2003 (<a href="https://github.com/vgough/encfs/blob/439c90e040cc04c036ee0791d830779a6d6bf10e/ChangeLog#L1501">ref</a>) </td>
    <td>2006 (<a href="https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=237fead619984cc48818fe12ee0ceada3f55b012">ref</a>) </td>
    <td>2014 (<a href="https://github.com/cryptomator/cryptomator/releases/tag/v0.1.0">ref</a>) </td>
    <td>2015 (<a href="https://github.com/netheril96/securefs/releases/tag/v0.10">ref</a>) </td>
    <td>2015 (<a href="https://github.com/cryfs/cryfs/releases/tag/0.8.0_cryfs">ref</a>) </td>
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
    <td>MIT (<a href="https://github.com/rfjakob/gocryptfs/blob/830cbb7218d61467c011fd5e9d4751e1529677e4/LICENSE">ref</a>) </td>
    <td>LGPLv3 / GPLv3 (<a href="https://github.com/vgough/encfs/blob/439c90e040cc04c036ee0791d830779a6d6bf10e/COPYING">ref</a>) </td>
    <td>GPLv2</td>
    <td>GPLv3 (<a href="https://github.com/cryptomator/cryptomator/blob/f84bb4710fb6aec54649de524f5f1be42632459d/LICENSE.txt">ref</a>) </td>
    <td>MIT (<a href="https://github.com/netheril96/securefs/blob/2596467d63631aab264cf7a63de38fd69b2fda78/LICENSE.md">ref</a>) </td>
    <td>LGPLv3 (<a href="https://github.com/cryfs/cryfs/blob/d96342463088490bc418c7e9df24eb5eef00d90b/LICENSE">ref</a>) </td>
  </tr>
  <tr>
    <td>Development hotspot</td>
    <td>Austria</td>
    <td>USA</td>
    <td>USA (RedHat)</td>
    <td>Germany</td>
    <td>China</td>
    <td>Germany</td>
  </tr>
  <tr>
    <td>Lifecycle</td>
    <td>Active</td>
    <td>Maintainance</td>
    <td>Active (<a href="https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/log/fs/ecryptfs">ref</a>) </td>
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
    <td>Linux, MacOS, 3rd-party Windows port <a href="https://github.com/bailey27/cppcryptfs">cppcryptfs</a></td>
    <td>Linux, MacOS, 3rd-party Windows port</td>
    <td>Linux</td>
    <td>Linux, MacOS, Windows</td>
    <td>Linux, MacOS, Windows</td>
    <td>Linux</td>
  </tr>
  <tr>
    <td>User interface</td>
    <td>CLI, 3rd-party GUI <a href="https://mhogomchungu.github.io/sirikali/">SiriKali</a></td>
    <td>CLI, 3rd-party GUI</td>
    <td>Integrated in login process</td>
    <td>GUI, 3rd-party CLI (<a href="https://github.com/cryptomator/cli">ref</a>) </td>
    <td>CLI, 3rd-party GUI</td>
    <td>CLI, 3rd-party GUI</td>
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

