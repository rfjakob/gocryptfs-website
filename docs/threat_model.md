Threat Model
============

The threat model describes common scenarios and
the security that gocryptfs provides for each.

Quoting the [[gocryptfs-audit]](#gocryptfs-audit):

> We suggest writing down an explicit threat model
> and updating the website to better communicate the
> security guarantees that gocryptfs provides. This way,
> users are less likely to rely on it in ways which
> would make them vulnerable.

The scenarios are ordered according to the strength
of the adversary, weakest to strongest. The adversaries
are the same as those described in
[[gocryptfs-audit]](#gocryptfs-audit). For more details
you are advised to read the audit as well as this
document.

Eve: Single snapshot of the ciphertext
--------------------------------------

Eve gets a complete copy of the ciphertext directory
at a single point in time. Examples are losing a USB stick or
getting your computer stolen. Because you don't get the
stolen USB stick handed back to you, this is effectively
a read-only attack.

Unless you use a very weak password, it is unlikely that any
file or file name can be decrypted by the adversary, no matter
how much data you have stored. However, it may be possible to
determine if you have a certain directory stored - see below.

### File size fingerprinting

The plaintext file size of each file can be directly
calculated from the ciphertext file size. In other words,
Eve has full information about all file sizes.

Using the file size information, Eve can try to
identify directories of files *that she already knows*.

For example, Eve could download all available
music albums from public bittorrent trackers and build a
database of all file sizes in all directories. This
allows her to determine with reasonably good confidence
if one of these music albums is in your ciphertext.

In summary, gocryptfs does not protect the information
that you have a certain directory of files, if that directory
of files is already known to the adversary.

### Possible GCM / EME interaction

*Same Key Used for Both GCM and EME Modes* as described in
section 2.4 in [[gocryptfs-audit]](#gocryptfs-audit) no
longer applies since gocryptfs v1.3.

Dragon: Permanent read-write access to the ciphertext
-----------------------------------------------------

Dragon (called "Dropbox" in the security audit)
has read-write access to the whole ciphertext
and sees all changes in real time.

This scenario applies if you synchronize your ciphertext directory
to a cloud service, and Dragon has the cloud service's
servers under his control.

### Tracking changed blocks

Dragon sees what parts of each encrypted file are written
to with 4 kiB granularity. Because each written block gets
a random IV, Dragon does not get any information
about what has changed (or if anything has changed at all)
within a 4 kiB block.

This can be a problem if the location of writes is in itself
sensitive.

### Modifying files

Dragon can replace 4 kiB blocks of a file with earlier
versions of the block. Blocks are tied to the file header and
to the offset. They cannot be copied between different files
or to a different offset in the file.

Due to sparse file support, Dragon can also zero out 4 kiB blocks.

Dragon can truncate files to 4 kiB boundaries.

Other modifications to files will be caught upon reading the
file, returning an I/O error to the application and logging
a "corrupt block" message to syslog.

*File ID Poisoning*, as described in section 2.2 of
[[gocryptfs-audit]](#gocryptfs-audit), no longer works since
gocryptfs v1.3.

### Deleting files

Dragon can delete files at will.

### Renaming files

As the file content is not tied to the file name in any way,
Dragon can rename an encrypted file name to another valid
encrypted file name. This effectively means that he can swap files.

gocryptfs has explicitly chosen not to tie the file content to
the file name to provide fast and reliable renames (renames are 
atomic in gocryptfs).

This can be threat when combined with social engineering:
Asking the user to send an uninteresting file and replacing it
with a sensitive one just before the user sends it out. You
can protect yourself against this attack by copying a file
you want to send outside the cloud-synced directory, checking
that you got the right file, and only then sending it.

### Directory IV Poisoning

In gocryptfs, each directory gets a `gocryptfs.diriv`
file on directory creation. This file contains the random DirIV
for file name encryption for this directory. It makes sure
identical file names generate different ciphertext in each
directory.

However when a directory is created, Dragon can immediately
replace the `gocryptfs.diriv` file with a copy from another
directory. When the DirIV is identical, identical file names
generated identical ciphertext, so Dragon can see if a file
name exists in both directories.

Mallory: Read-write access to full ciphertext and a single plaintext folder
---------------------------------------------------------------------------

Mallory can read and write the whole ciphertext and additionally is
granted read-write access to a single folder in a mounted gocryptfs
filesystem. This can happen if Mallory is the administrator of the
NFS or SMB file server you store the ciphertext on, and you additionally
export a "public" subdirectory of the mounted (decrypted) gocryptfs filesystem
to Mallory.

This scenario leads to a complete break of confidentiality as Mallory
can move all ciphertext folders to the "public" directory and copy the
plaintext from there. It is recommended to avoid this scenario by never
exporting any part of a mounted gocryptfs filesystem.

References
---------------

#### [gocryptfs-audit]
*Gocryptfs Security Audit*<br>
Taylor Hornby - Defuse Security, 6 Mar 2017<br>
<https://defuse.ca/audits/gocryptfs.htm>
