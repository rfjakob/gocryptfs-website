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

<table>
	<thead>
		<tr>
			<td></td>
			<td>gocryptfs</td>
			<td>encfs</td>
			<td>ecryptfs</td>
			<td>cryptomator</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>First release</td>
			<td><a href="https://github.com/rfjakob/gocryptfs/releases/tag/v0.1">2015</a></td>
			<td><a href="https://github.com/vgough/encfs/blob/master/ChangeLog#L1442">2003</a></td>
			<td><a href="https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=237fead619984cc48818fe12ee0ceada3f55b012">2006</a></td>
			<td><a href="https://github.com/cryptomator/cryptomator/releases/tag/v0.1.0">2014</a></td>
		</tr>
		<tr>
			<td>Language</td>
			<td>Go</td>
			<td>C++</td>
			<td>C</td>
			<td>Java</td>
		</tr>
		<tr>
			<td>License</td>
			<td>MIT</td>
			<td><a href="https://github.com/vgough/encfs/blob/master/COPYING">LGPL/GPL</a></td>
			<td>GPL</td>
			<td><a href="https://github.com/cryptomator/cryptomator/tree/master/LICENSES">Apache/BSD/MIT</a></td>
		</tr>
		<tr>
			<td>File interface</td>
			<td>FUSE</td>
			<td>FUSE</td>
			<td>in-kernel filesystem</td>
			<td>WebDAV</td>
		</tr>
		<tr>
			<td>Platform support</td>
			<td>Linux (help wanted for Mac OS X port)</td>
			<td>Linux, Mac OS X</td>
			<td>Linux only</td>
			<td>Linux, Mac OS X, Windows</td>
		</tr>
	</tbody>
</table>


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
[[4]](http://ecryptfs.org/documentation.html) actually, there is a lot of documentation, but none of
it seems to describe the used crypto.



File Contents
-------------

|            | gocryptfs |     encfs default     |     encfs paranoia    | ecryptfs |    cryptomator     |
| ---------- | --------- | --------------------- | --------------------- | -------- | ------------------ |
| Encryption | GCM       | CBC, CFB (last block) | CBC, CFB (last block) | CBC      | CTR with random IV |
| Integrity  | GCM       | none                  | HMAC                  | none     | HMAC               |


File Names
----------

|                      |       gocryptfs       |    encfs default     |    encfs paranoia    | ecryptfs | cryptomator |
| -------------------- | --------------------- | -------------------- | -------------------- | -------- | ----------- |
| Encryption           | EME                   | CBC                  | CBC                  | CBC      | SIV         |
| Prefix leak          | no (EME)              | no (HMAC used as IV) | no (HMAC used as IV) | yes [2]  | no (SIV)    |
| Identical names leak | no (per-directory IV) | no (path chaining)   | no (path chaining)   | yes [1]  | yes [3]     |
|                      |                       |                      |                      |          |             |

References:
[[1]](https://gist.github.com/rfjakob/a04364c55b3ee231078d)
[[2]](https://gist.github.com/rfjakob/61a17bf3c7eb9932d791)
[[3]](https://github.com/cryptomator/cryptomator/issues/128)