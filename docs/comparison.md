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
* [securefs](https://github.com/netheril96/securefs), a cross-platform project implemented in C++. 
  Older versions stored directories in user-space B-trees
  ([filesystem format 1,2,3](https://github.com/netheril96/securefs/blob/2596467d63631aab264cf7a63de38fd69b2fda78/docs/design.md#full-format-format-version-123)).
  The new default since v0.7.0
  ([filesystem format 4](https://github.com/netheril96/securefs/blob/2596467d63631aab264cf7a63de38fd69b2fda78/docs/design.md#lite-format-format-version-4))
  uses normal directory entries.
* [CryFS](https://www.cryfs.org/), result of a master thesis at the KIT University that uses
  chunked storage to obfuscate file sizes.

If you spot an error or want to see a project added, please
[file a ticket](https://github.com/rfjakob/gocryptfs-website)!

Overview
--------

<!--
The comparison table is too wide in markdown syntax to be edited sanely,
which is why I converted it to html.
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
<!-- gocryptfs --><td>2015 (<a href="https://github.com/rfjakob/gocryptfs/releases/tag/v0.1">ref</a>) </td>
<!-- encfs     --><td>2003 (<a href="https://github.com/vgough/encfs/blob/439c90e040cc04c036ee0791d830779a6d6bf10e/ChangeLog#L1501">ref</a>) </td>
<!-- ecryptfs  --><td>2006 (<a href="https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=237fead619984cc48818fe12ee0ceada3f55b012">ref</a>) </td>
<!-- cryptomtr --><td>2014 (<a href="https://github.com/cryptomator/cryptomator/releases/tag/v0.1.0">ref</a>) </td>
<!-- securefs  --><td>2015 (<a href="https://github.com/netheril96/securefs/releases/tag/v0.10">ref</a>) </td>
<!-- cryfs     --><td>2015 (<a href="https://github.com/cryfs/cryfs/releases/tag/0.8.0_cryfs">ref</a>) </td>
  </tr>
  <tr>
    <td>Language</td>
<!-- gocryptfs --><td>Go</td>
<!-- encfs     --><td>C++</td>
<!-- ecryptfs  --><td>C</td>
<!-- cryptomtr --><td>Java</td>
<!-- securefs  --><td>C++</td>
<!-- cryfs     --><td>C++</td>
  </tr>
  <tr>
    <td>License</td>
<!-- gocryptfs --><td>MIT (<a href="https://github.com/rfjakob/gocryptfs/blob/830cbb7218d61467c011fd5e9d4751e1529677e4/LICENSE">ref</a>) </td>
<!-- encfs     --><td>LGPLv3 / GPLv3 (<a href="https://github.com/vgough/encfs/blob/439c90e040cc04c036ee0791d830779a6d6bf10e/COPYING">ref</a>) </td>
<!-- ecryptfs  --><td>GPLv2</td>
<!-- cryptomtr --><td>GPLv3 (<a href="https://github.com/cryptomator/cryptomator/blob/f84bb4710fb6aec54649de524f5f1be42632459d/LICENSE.txt">ref</a>) </td>
<!-- securefs  --><td>MIT (<a href="https://github.com/netheril96/securefs/blob/2596467d63631aab264cf7a63de38fd69b2fda78/LICENSE.md">ref</a>) </td>
<!-- cryfs     --><td>LGPLv3 (<a href="https://github.com/cryfs/cryfs/blob/d96342463088490bc418c7e9df24eb5eef00d90b/LICENSE">ref</a>) </td>
  </tr>
  <tr>
    <td>Development hotspot</td>
<!-- gocryptfs --><td>Austria</td>
<!-- encfs     --><td>USA</td>
<!-- ecryptfs  --><td>USA (RedHat)</td>
<!-- cryptomtr --><td>Germany</td>
<!-- securefs  --><td>China</td>
<!-- cryfs     --><td>Germany</td>
  </tr>
  <tr>
    <td>Lifecycle</td>
<!-- gocryptfs --><td>Active</td>
<!-- encfs     --><td>Maintainance</td>
<!-- ecryptfs  --><td>Active (<a href="https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/log/fs/ecryptfs">ref</a>) </td>
<!-- cryptomtr --><td>Active</td>
<!-- securefs  --><td>Active</td>
<!-- cryfs     --><td>Active</td>
  </tr>
  <tr>
    <td>File interface</td>
<!-- gocryptfs --><td>FUSE</td>
<!-- encfs     --><td>FUSE</td>
<!-- ecryptfs  --><td>in-kernel filesystem</td>
<!-- cryptomtr --><td>WebDAV</td>
<!-- securefs  --><td>FUSE</td>
<!-- cryfs     --><td>FUSE</td>
  </tr>
  <tr>
    <td>Platforms</td>
<!-- gocryptfs --><td>Linux, MacOS, 3rd-party Windows port <a href="https://github.com/bailey27/cppcryptfs">cppcryptfs</a></td>
<!-- encfs     --><td>Linux, MacOS, 3rd-party Windows port</td>
<!-- ecryptfs  --><td>Linux</td>
<!-- cryptomtr --><td>Linux, MacOS, Windows</td>
<!-- securefs  --><td>Linux, MacOS, Windows</td>
<!-- cryfs     --><td>Linux</td>
  </tr>
  <tr>
    <td>User interface</td>
<!-- gocryptfs --><td>CLI, 3rd-party GUI <a href="https://mhogomchungu.github.io/sirikali/">SiriKali</a></td>
<!-- encfs     --><td>CLI, 3rd-party GUI</td>
<!-- ecryptfs  --><td>Integrated in login process</td>
<!-- cryptomtr --><td>GUI, 3rd-party CLI (<a href="https://github.com/cryptomator/cli">ref</a>) </td>
<!-- securefs  --><td>CLI, 3rd-party GUI</td>
<!-- cryfs     --><td>CLI, 3rd-party GUI</td>
  </tr>
  <tr>
    <td>Reverse Mode</td>
<!-- gocryptfs --><td>yes (since v1.1)</td>
<!-- encfs     --><td>yes</td>
<!-- ecryptfs  --><td>no</td>
<!-- cryptomtr --><td>no</td>
<!-- securefs  --><td>no</td>
<!-- cryfs     --><td>no</td>
  </tr>
</table>

General Security
----------------

|                         | gocryptfs | encfs default | encfs paranoia |               ecryptfs               | cryptomator | securefs |  CryFS  |
| ----------------------- | --------- | ------------- | -------------- | ------------------------------------ | ----------- | -------- | ------- |
| Documentation available | Yes [1]   | Yes [2]       | Yes [2]        | No [4]                               | Yes [3]     | Yes [5]  | Yes [6] |
| Password hashing        | scrypt    | PBKDF2        | PBKDF2         | (none, implemented in external tool) | scrypt      | PBKDF2   | scrypt  |


References:
[[1]](forward_mode_crypto.md)
[[2]](https://github.com/vgough/encfs/blob/439c90e040cc04c036ee0791d830779a6d6bf10e/DESIGN.md)
[[3]](https://cryptomator.org/architecture/)
[[5]](https://github.com/netheril96/securefs/blob/2596467d63631aab264cf7a63de38fd69b2fda78/docs/design.md#lite-format-format-version-4)
[[6]](https://www.cryfs.org/howitworks)  
[[4]](http://ecryptfs.org/documentation.html) actually, there is a lot of ecryptfs documentation, but none of
it seems to describe the used crypto.

File Contents
-------------

|                       | gocryptfs |      encfs default      |      encfs paranoia     |        ecryptfs       |      cryptomator       |      securefs      |         CryFS         |
| --------------------- | --------- | ----------------------- | ----------------------- | --------------------- | ---------------------- | ------------------ | --------------------- |
| Tested version        | v1.4.1    | v1.9.2                  | v1.9.2                  | v4.12.5               | v1.3.1 RPM             | v0.7.3-30-g2596467 | 0.9.7-15-g3d52f6a8    |
|                       |           |                         |                         |                       |                        |                    |                       |
| Encryption            | GCM       | CBC; last block CFB [1] | CBC; last block CFB [1] | CBC                   | CTR with random IV [2] | GCM                | GCM                   |
| Integrity             | GCM       | none                    | HMAC                    | none                  | HMAC                   | GCM                | GCM                   |
| File size obfuscation | no        | no                      | no                      | yes (4 KB increments) | no [3]                 | no                 | yes (chunked storage) |

References:
[[1]](https://github.com/vgough/encfs/issues/9)
[[2]](https://github.com/cryptomator/cryptomator/issues/128#issuecomment-168942517)
[[3]](https://github.com/cryptomator/cryptomator/releases/tag/1.2.0)

File Names
----------

|                          |       gocryptfs       |    encfs default     |    encfs paranoia    | ecryptfs | cryptomator  |      securefs      |       CryFS        |
| ------------------------ | --------------------- | -------------------- | -------------------- | -------- | ------------ | ------------------ | ------------------ |
| Tested version           | v1.4.1                | v1.9.2               | v1.9.2               | v4.12.5  | v1.3.1 RPM   | v0.7.3-30-g2596467 | 0.9.7-15-g3d52f6a8 |
|                          |                       |                      |                      |          |              |                    |                    |
| Encryption               | EME [4]               | CBC                  | CBC                  | CBC      | AES-SIV      | AES-SIV            | GCM (dir DB)       |
| Prefix leak              | no (EME)              | no (HMAC used as IV) | no (HMAC used as IV) | yes [2]  | no (AES-SIV) | no (AES-SIV)       | no (GCM)           |
| Identical names leak     | no (per-directory IV) | no (path chaining)   | no (path chaining)   | yes [1]  | no [3] {3}   | yes [6]            | no (GCM)           |
| Maximum name length [5]  | 255 (since v0.9) {2}  | 175                  | 175                  | 143      | 1025         | 143                | 1024               |
| Directory flattening {1} | no                    | no                   | no                   | no       | yes          | yes                | yes                |

References:
[[1]](https://gist.github.com/rfjakob/a04364c55b3ee231078d)
[[2]](https://gist.github.com/rfjakob/61a17bf3c7eb9932d791)
[[3]](https://github.com/cryptomator/cryptomator/commit/3b178030c7a6001c1d070ee181aaae71f760d33f)
[[4]](https://github.com/rfjakob/eme)
[[5]](https://github.com/rfjakob/gocryptfs/blob/master/tests/maxlen.bash)
[[6]](https://gist.github.com/rfjakob/5ff1591db263d85684ac03fc47009b35)

Notes:  
{1} Is the directory tree flattened in the encrypted storage? This
    obfuscates the directory structure but can cause problems when
    synchronising via Dropbox and similar.  
{2} 255 since gocryptfs v0.9, 175 in v0.8 and earlier  
{3} cryptomator dropped the use of a random padding in v1.2.0 due to performance concerns.  

Performance
-----------

All tests are run on tmpfs rule out any influence of the hard disk.
The CPU is an Intel Pentium G630 with 2 x 2.7GHz that does NOT have AES instructions.
The exact command lines for running the tests are defined in
[canonical-benchmarks.bash](https://github.com/rfjakob/gocryptfs/blob/f0e29d9b90b63d5fbe4164161ecb0e1035bb4af4/tests/canonical-benchmarks.bash).

|                          | gocryptfs | encfs default | encfs paranoia |  ecryptfs |  cryptomator  |      securefs      |        CryFS        |
| ------------------------ | --------- | ------------- | -------------- | --------- | ------------- | ------------------ | ------------------- |
| Tested version           | v1.4.1    | v1.9.2        | v1.9.2         | v4.12.5   | v1.3.1 RPM    | v0.7.3-30-g2596467 | v0.9.7-12-gd9634246 |
|                          |           |               |                |           |               |                    |                     |
| Streaming write          | 258 MiB/s | 100 MiB/s     | 51 MiB/s       | 133 MiB/s | 15 MiB/s {3}  | 132 MiB/s          | 69 MiB/s            |
| Streaming read           | 289 MiB/s | 185 MiB/s     | 105 MiB/s      | 165 MiB/s | 29 MiB/s {3}  | 155 MiB/s          | 99 MiB/s            |
| Extract linux-3.0.tar.gz | 16 s      | 19 s          | 23 s           | 7.2 s     | 564 s {1} {2} | 14 s               | 41 s                |
| md5sum linux-3.0         | 7.5 s     | 8.2 s         | 10 s           | 4.8 s     | 360 s {2}     | 7.7 s              | 42 s                |
| ls -lR linux-3.0         | 1.3 s     | 2.9 s         | 2.9 s          | 0.8 s     | 27 s {2}      | 1.2 s              | 17 s                |
| Delete linux-3.0         | 3.0 s     | 4.2 s         | 4.4 s          | 0.7 s     | 145 s {2}     | 2.2 s              | 21 s                |

Notes:  
{1} All file acesses to cryptomator go through the WebDAV protocol, which is less performance-oriented than FUSE.  
However, an optimized WebDAV client may be able to significantly speed up small-file workloads.<br>
{2} Tested using using wdfs, where I got the fastest results: <http://noedler.de/projekte/wdfs/>.
davfs2 is very slow, fusedav does not compile on current Fedora.<br>
{3} Testing using the built-in WebDAV support in Gnome Files v3.24.2.1, as the write-back
caching of wdfs makes exact measurements impractical.

Disk Space Efficiency
---------------------

|                           |    ext4   | gocryptfs | encfs default | encfs paranoia |  ecryptfs | cryptomator |      securefs     |       CryFS        |
| ------------------------- | --------- | --------- | ------------- | -------------- | --------- | ----------- | ----------------- | ------------------ |
| Tested version            | v4.12.5   | v1.4.1    | v1.9.2        | v1.9.2         | v4.12.5   | TBD         | 0.7.3-30-g2596467 | 0.9.7-15-g3d52f6a8 |
|                           |           |           |               |                |           |             |                   |                    |
| Empty file {1}            | 0         | 0         | 0             | 0              | 8,192     | 88          | 16                | 32,768             |
| 1 byte file {1}           | 1         | 51        | 9             | 17             | 12,288    | 137         | 45                | 32,768             |
| 1,000,000 bytes file {1}  | 1,000,000 | 1,007,858 | 1,000,008     | 1,007,888      | 1,011,712 | 1,001,576   | 1,006,876         | 1,048,576 {4}      |
| linux-3.0 source tree {5} |           |           |               |                |           |             |                   |                    |
| ...disk usage {2}         | 494 MiB   | 512 MiB   | 495 MiB       | 498 MiB        | 784 MiB   | 498 MiB     | 498               | 1485 MiB           |
| ...sum of file sizes {3}  | 411 MiB   | 416 MiB   | 412 MiB       | 415 MiB        | 784 MiB   | TBD         | 416               | 1485 MiB           |

Notes:  
{1} `ls -l` on the encrypted file<br>
{2} `du -sm` on the ciphertext dir, backing filesystem ext4.<br>
{3} `du -sm --apparent-size`.<br>
{4} Counting all 32 chunks ([ref](https://gist.github.com/rfjakob/bdd0ef2bd8f0e94b09ad14f85cd6daec))<br>
{5} Extracted [linux-3.0.tar.gz](https://cdn.kernel.org/pub/linux/kernel/v3.0/linux-3.0.tar.gz)<br>

Filesystem Features
-------------------

Note: To keep the work of maintaining this table under control, I have only
tested selected projects with respect to filesystem features.
Please file a pull request if you can test the other projects!

The backing filesystem is assumed to be ext4.

|                      | ext4 | gocryptfs | encfs default | encfs paranoia | ecryptfs | CryFS |
| -------------------- | ---- | --------- | ------------- | -------------- | -------- | ----- |
| hard links           | yes  | yes       | yes           | no             | yes      | no    |
| extended attributes  | yes  | yes       | no            | no             | ?        | ?     |
| fallocate            | yes  | yes       | no            | no             | no       | no    |
| fallocate KEEP_SIZE  | yes  | yes       | no            | no             | no       | no    |
| fallocate PUNCH_HOLE | yes  | no        | no            | no             | no       | no    |

