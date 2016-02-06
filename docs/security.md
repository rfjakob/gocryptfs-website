gocryptfs Security
==================

gocryptfs builts upon well-known cryptographic primitives: scrypt for
key derivation, AES-GCM for file content encryption and, as a world's
first for encrypted filesystems, EME for file name encryption.

Master Key Storage
------------------

The master key is used to perform content and file name encryption.
It is stored in `gocryptfs.conf`, encrypted with AES-256-GCM using the
Key Encryption Key (KEK). The KEK is generated from the user password
using `scrypt`.

When mounting a filesystem, the user is prompted for the password and
the master key is decrypted:

![](img/master-key.svg)

File Contents
-------------

All file contents are encrypted using AES-256-GCM (Galois/Counter Mode).

Files are segmented into 4KB blocks. Each block gets a fresh random
128 bit IV each time it is modified. A 128-bit authentication tag (GHASH)
protects each block from modifications.

Each file has a header containing a random 128-bit file ID. The
file ID and the block number are mixed into the GHASH as
*additional authenticated data*. The prevents blocks from being copied
between or within files.

![](img/file-content-encryption.svg)

To support sparse files, all-zero blocks are accepted and passed through
unchanged.

File Names
----------

Every directory gets a 128-bit directory IV that is stored in each
directory as `gocryptfs.diriv`.

File names are encrypted using AES-256-EME (ECB-Mix-ECB wide-block encryption,
see https://github.com/rfjakob/eme for details) with the directory IV
as initialization vector. EME fixes the prefix leak that occours with CBC
encryption.

![](img/file-name-encryption.svg)

The Base64 encoding limits the usable filename length to 176 characters.
