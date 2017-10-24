Threat Model
============

The threat model describes common scenarios and
the security that gocryptfs provides for each.

The scenarios are ordered according to the strength
of the adversary, weakest to strongest.

A: Single snapshot of the ciphertext
------------------------------------

The adversary gets a complete copy of the ciphertext directory
at a single point in time. Examples are losing a USB stick or
getting your computer stolen.

Unless you use a very weak password, it is unlikely that any
file or file name can be decrypted by the adversary, no matter
how much data you have stored. However, it may be possible to
determine if you have a certain directory stored - see below.

### File size fingerprinting

The plaintext file size of each file can be directly
calculated from the ciphertext file size. In other words,
the adversary has full information about all file sizes.

Using the file size information, the adversary can try to
identify directories of files *that he already knows*.

For example, the adversary could download all available
music albums from public bittorrent trackers and build a
database of all file sizes in all directories. This
allows him to determine with reasonably good confidence
if one of these music albums is in your ciphertext.

In summary, gocryptfs does not protect the information
that you have a certain directory of files, if that directory
of files is already known to the adversary.

B: Permanent read-write access to the ciphertext
------------------------------------------------

The adversary sees all changes to the ciphertext in real time.
He can also modify the chiphertext at will.

This scenario applies if you synchronize your ciphertext directory
to a cloud service, and the adversary controls the cloud service's
servers.

### Tracking changes

The adversary sees what parts of each encrypted file changes with
4 kiB granularity.

### Modifying files

The adversary can replace 4 kiB blocks of a file with earlier
versions of the block (blocks are tied to the file header and
to the offset).

Due to sparse file support, he can also zero out 4 kiB blocks.

He can truncate files to 4 kiB boundaries.

File ID Poisoning, as described in section 2.2 of the security
audit, does no longer work since gocryptfs v1.3.

### Renaming files

As the file content is not tied to the file name in any way,
the adversary can rename an encrypted file name to another valid
encrypted file name. This effectively means that he can swap files.

gocryptfs has explicitely chosen not to tie the file content to
the file name to provide fast and atomic renames.

### Directory IV Poisoning

Further Reading
---------------

* Gocryptfs Security Audit<br>
  <https://defuse.ca/audits/gocryptfs.htm>
* EXT4 Encryption - Harder, Better, Faster, Stronger<br>
  <http://kernsec.org/files/lss2014/Halcrow_EXT4_Encryption.pdf>

