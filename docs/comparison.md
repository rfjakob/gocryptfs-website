Other Projects
==============

There are several open-source file encryption solutions available.
This page tries to help to find the right one for your use case:

* [gocryptfs](https://nuetzlich.net/gocryptfs/) (this project), aspiring successor of EncFS
* [EncFS](https://github.com/vgough/encfs), mature with known security issues
* [eCryptFS](http://ecryptfs.org/), integrated into the Linux kernel
* [Cryptomator](https://cryptomator.org/), strong cross-platform support through Java and WebDAV

If you spot an error or want to see a project added, please
[file a ticket](https://github.com/rfjakob/gocryptfs-website)!

Overview
--------

|                     |        gocryptfs        |                encfs                 |           ecryptfs          |     cryptomator     |
| ------------------- | ----------------------- | ------------------------------------ | --------------------------- | ------------------- |
| First release       | 2015 [1]                | 2003 [2]                             | 2006 [3]                    | 2014 [4]            |
| Language            | Go                      | C++                                  | C                           | Java                |
| License             | MIT                     | LGPL/GPL [5]                         | GPL                         | Apache/BSD/MIT [6]  |
| Development hotspot | Austria                 | USA                                  | UK (Canonical Ltd)          | Germany             |
| File interface      | FUSE                    | FUSE                                 | in-kernel filesystem        | WebDAV              |
| Platforms           | Linux (OSX planned [7]) | Linux, OSX; third-party Windows port | Linux only                  | Linux, OSX, Windows |
| User interface      | Command line only       | Command line; third-party graphical  | Integrated in login process | Graphical only      |


References:
[[1]](https://github.com/rfjakob/gocryptfs/releases/tag/v0.1)
[[2]](https://github.com/vgough/encfs/blob/master/ChangeLog#L1442)
[[3]](https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=237fead619984cc48818fe12ee0ceada3f55b012)
[[4]](https://github.com/cryptomator/cryptomator/releases/tag/v0.1.0)
[[5]](https://github.com/vgough/encfs/blob/master/COPYING)
[[6]](https://github.com/cryptomator/cryptomator/tree/master/LICENSES)
[[7]](https://github.com/rfjakob/gocryptfs/issues/15)


General Security
----------------

|                         | gocryptfs | encfs default | encfs paranoia |               ecryptfs               | cryptomator |
| ----------------------- | --------- | ------------- | -------------- | ------------------------------------ | ----------- |
| Documentation available | Yes [1]   | Yes [2]       | Yes [2]        | No [4]                               | Yes [3]     |
| Password hashing        | scrypt    | PBKDF2        | PBKDF2         | (none, implemented in external tool) | scrypt      |


References:
[[1]](security.md)
[[2]](https://github.com/vgough/encfs/blob/master/DESIGN.md)
[[3]](https://cryptomator.org/#security)
[[4]](http://ecryptfs.org/documentation.html) actually, there is a lot of ecryptfs documentation, but none of
it seems to describe the used crypto.



File Contents
-------------

|                       | gocryptfs |        encfs default        |        encfs paranoia       |        ecryptfs       |     cryptomator      |
| --------------------- | --------- | --------------------------- | --------------------------- | --------------------- | -------------------- |
| Encryption            | GCM       | CBC; CFB for last block [1] | CBC; CFB for last block [1] | CBC                   | CTR with random IV   |
| Integrity             | GCM       | none                        | HMAC                        | none                  | HMAC                 |
| File size obfuscation | no        | no                          | no                          | yes (4 KB increments) | yes (random padding) |

References:
[[1]](https://github.com/vgough/encfs/issues/9)

File Names
----------

|                      |       gocryptfs       |    encfs default     |    encfs paranoia    | ecryptfs | cryptomator |
| -------------------- | --------------------- | -------------------- | -------------------- | -------- | ----------- |
| Encryption           | EME                   | CBC                  | CBC                  | CBC      | SIV         |
| Prefix leak          | no (EME)              | no (HMAC used as IV) | no (HMAC used as IV) | yes [2]  | no (SIV)    |
| Identical names leak | no (per-directory IV) | no (path chaining)   | no (path chaining)   | yes [1]  | yes [3]     |

References:
[[1]](https://gist.github.com/rfjakob/a04364c55b3ee231078d)
[[2]](https://gist.github.com/rfjakob/61a17bf3c7eb9932d791)
[[3]](https://github.com/cryptomator/cryptomator/issues/128)

Performance
-----------

All tests are run on tmpfs rule out any influence of the hard disk.
The CPU is an Intel Pentium G630 with 2 x 2.7GHz.

|                          | gocryptfs | encfs default | encfs paranoia | ecryptfs |  cryptomator  |
| ------------------------ | --------- | ------------- | -------------- | -------- | ------------- |
| Streaming write          | 84 MB/s   | 104 MB/s      | 56 MB/s        | 130 MB/s | 55 MB/s       |
| Extract linux-3.0.tar.gz | 48 s [4]  | 20 s          | 23 s           | 8.4 s    | 468 s [1] [2] |
| ls -lR linux-3.0         | 1.9 s     | 2.8 s         | 2.8 s          | 0.5 s    | 127 s [3]     |
| Delete linux-3.0         | 4.5 s     | 3.9 s         | 4.1 s          | 0.5 s    | 376 s [3]     |


Notes:

[1] All file acesses to cryptomator go through the WebDAV protocol, which is less performance-oriented than FUSE.
However, an optimized WebDAV client may be able to significantly speed up small-file workloads.

[2] Tested with the dave cli WebDAV client, which gave better speed than gvfs (Gnome built-in) and davfs2

[3] Tested with gvfs in the `/run/user/.../gvfs/dav:...` mount

[4] See [gocryptfs ticket#16](https://github.com/rfjakob/gocryptfs/issues/16)


Disk Space Efficiency
---------------------

(all file sizes in bytes)

|                      | gocryptfs | encfs default | encfs paranoia | ecryptfs |    cryptomator    |
| -------------------- | --------- | ------------- | -------------- | -------- | ----------------- |
| Empty file           |         0 |             0 |              0 |     8192 | 104 - 4231        |
| 1 byte file          |        51 |             9 |             17 |    12288 | 104 - 4231        |
| 1,000,000 bytes file |   1007858 |       1000008 |        1007888 |  1011712 | 1001161 - 1100936 |
|                      |           |               |                |          |                   |

Note: cryptomator adds a random padding which is why the resulting size is non-deterministic.
