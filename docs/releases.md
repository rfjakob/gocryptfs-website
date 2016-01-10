gocryptfs Releases
==================

gocryptfs is released as

* source code using signed git tags, please `git clone https://github.com/rfjakob/gocryptfs.git`
* precompiled binaries with .asc gpg signatures, [download at github](https://github.com/rfjakob/gocryptfs/releases)

Signing Key
-----------

Binary and source releases are signed using the *gocryptfs signing key*, key ID 23A02740.

The public key can be downloaded [here](https://nuetzlich.net/gocryptfs-signing-key.pub).
To verify signatures, you have to import it into gpg:

	$ wget https://nuetzlich.net/gocryptfs-signing-key.pub
	$ gpg --import gocryptfs-signing-key.pub

Verify Git Tags
---------------

Just call `git tag` with the `-v` flag, for example:

	$ git tag -v v0.7
	[...]
	gocryptfs v0.7
	gpg: Signature made So 20 Dez 2015 20:29:19 CET using RSA key ID 23A02740
	gpg: Good signature [...]

Verify Binaries
---------------

Download both the `.tar.gz` and the `.asc` file, then run `gpg --verify gocryptfs_XYZ.asc`,
for example:

	$ gpg --verify gocryptfs_v0.7.1_debian8_amd64.tar.gz.asc
	gpg: assuming signed data in `gocryptfs_v0.7.1_debian8_amd64.tar.gz'
	gpg: Signature made Sa 09 Jan 2016 15:53:33 CET using RSA key ID 23A02740
	gpg: Good signature [...]


