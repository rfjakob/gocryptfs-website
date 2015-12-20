gocryptfs Releases
==================

Releases done by adding an signed git tag to a commit. All releases
are [available at github](https://github.com/rfjakob/gocryptfs/releases).

All releases from v0.4 onward are signed using the *gocryptfs signing key*,

	Primary key fingerprint: FFF3 E014 44FE D7C3 16A3  545A 895F 5BC1 23A0 2740

The public key can be downloaded
[here](https://nuetzlich.net/gocryptfs-signing-key.pub).

To verify the signed tags, you have to import the public key into your
gpg keyring:

	$ wget https://nuetzlich.net/gocryptfs-signing-key.pub
	$ gpg --import gocryptfs-signing-key.pub

Then, you can verify tags using `git tag -v`:

	$ git tag -v v0.7
	  [...]
	  gocryptfs v0.7
	  gpg: Signature made So 20 Dez 2015 20:29:19 CET using RSA key ID 23A02740
	  gpg: Good signature [...]

Note that the `key ID` is simply the last eight digits of the key fingerprint, `23A0 2740`.
