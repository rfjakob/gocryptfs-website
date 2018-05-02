gocryptfs Releases
==================

gocryptfs is released as

* source code using signed git tags, please `git clone https://github.com/rfjakob/gocryptfs.git`
* precompiled binaries with .asc gpg signatures, [download at github](https://github.com/rfjakob/gocryptfs/releases)

Signing Key
-----------

Binary and source releases are signed using the *gocryptfs signing key*, key ID
`895F5BC123A02740` (gpg 1.x users only see the second half: `23A02740`).

The public key can be downloaded [here](https://nuetzlich.net/gocryptfs-signing-key.pub).
To verify signatures, you have to import it into gpg:

	$ wget https://nuetzlich.net/gocryptfs-signing-key.pub
	$ gpg --import gocryptfs-signing-key.pub

Verify Git Tags
---------------

Just call `git tag` with the `-v` flag, for example:

```
$ git tag -v v1.4.4

object 9c86daf499dca8a69b058ec56803d06fbba4fdab
type commit
tag v1.4.4
tagger Jakob Unterwurzacher <jakobunt@gmail.com> 1521412204 +0100

gocryptfs v1.4.4
gpg: Signature made Sun Mar 18 23:30:10 2018 CET
gpg:                using RSA key 895F5BC123A02740
gpg: Good signature from "Jakob Unterwurzacher (gocryptfs signing key) <jakobunt@gmail.com>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: FFF3 E014 44FE D7C3 16A3  545A 895F 5BC1 23A0 2740
```

Verify Binaries
---------------

Download both the `.tar.gz` and the `.asc` file, then run `gpg --verify gocryptfs_XYZ.asc`,
for example:
```
$ gpg --verify gocryptfs_v1.4.4_linux-static_amd64.tar.gz.asc

gpg: assuming signed data in 'gocryptfs_v1.4.4_linux-static_amd64.tar.gz'
gpg: Signature made Sun Mar 18 23:32:47 2018 CET
gpg:                using RSA key 895F5BC123A02740
gpg: Good signature from "Jakob Unterwurzacher (gocryptfs signing key) <jakobunt@gmail.com>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: FFF3 E014 44FE D7C3 16A3  545A 895F 5BC1 23A0 2740
```
