Compile gocryptfs from Source
=============================

	go get -d github.com/rfjakob/gocryptfs
	cd $(go env GOPATH)/src/github.com/rfjakob/gocryptfs
	./build.bash

build.bash needs Go 1.7+ and the OpenSSL headers installed
(Debian: `apt install golang libssl-dev`, Fedora: `dnf install golang openssl-devel`).

If successful, `build.bash` copies the `gocryptfs` binary to `~/bin`.

Alternatively, you can compile a static binary without OpenSSL using:

	./build-without-openssl.bash

This is the recommended way to compile on MacOS, and also how the official
[binary releases](https://github.com/rfjakob/gocryptfs/releases) are compiled.

Note that having OpenSSL speeds up encryption on CPUs *without* AES-NI
by a factor of 4. Run `gocryptfs -speed` to check your CPU.

Test
----

In the gocryptfs source directory, run:

	./test.bash

The tests run about 1 minute and should produce the following output:

```
gocryptfs v1.4.3-9-g9f8d0d8 without_openssl; go-fuse v20170619-28-g19acbd2; 2018-02-03 go1.9.2
gocryptfs v1.4.3-9-g9f8d0d8; go-fuse v20170619-28-g19acbd2; 2018-02-03 go1.9.2
ok  	github.com/rfjakob/gocryptfs	0.003s
?   	github.com/rfjakob/gocryptfs/gocryptfs-xray	[no test files]
ok  	github.com/rfjakob/gocryptfs/internal/configfile	0.732s
ok  	github.com/rfjakob/gocryptfs/internal/contentenc	0.003s
ok  	github.com/rfjakob/gocryptfs/internal/cryptocore	0.227s
ok  	github.com/rfjakob/gocryptfs/internal/ctlsock	0.002s
?   	github.com/rfjakob/gocryptfs/internal/exitcodes	[no test files]
?   	github.com/rfjakob/gocryptfs/internal/fusefrontend	[no test files]
?   	github.com/rfjakob/gocryptfs/internal/fusefrontend_reverse	[no test files]
ok  	github.com/rfjakob/gocryptfs/internal/nametransform	0.003s
?   	github.com/rfjakob/gocryptfs/internal/nametransform/dirivcache	[no test files]
?   	github.com/rfjakob/gocryptfs/internal/openfiletable	[no test files]
ok  	github.com/rfjakob/gocryptfs/internal/pathiv	0.003s
ok  	github.com/rfjakob/gocryptfs/internal/prefer_openssl	0.003s
ok  	github.com/rfjakob/gocryptfs/internal/readpassword	0.048s
?   	github.com/rfjakob/gocryptfs/internal/serialize_reads	[no test files]
ok  	github.com/rfjakob/gocryptfs/internal/siv_aead	0.005s
ok  	github.com/rfjakob/gocryptfs/internal/speed	0.002s [no tests to run]
ok  	github.com/rfjakob/gocryptfs/internal/stupidgcm	1.639s
ok  	github.com/rfjakob/gocryptfs/internal/syscallcompat	0.027s
?   	github.com/rfjakob/gocryptfs/internal/tlog	[no test files]
ok  	github.com/rfjakob/gocryptfs/tests/cli	1.023s
ok  	github.com/rfjakob/gocryptfs/tests/defaults	0.839s
ok  	github.com/rfjakob/gocryptfs/tests/example_filesystems	4.076s
ok  	github.com/rfjakob/gocryptfs/tests/hkdf_sanity	0.137s
ok  	github.com/rfjakob/gocryptfs/tests/matrix	10.780s
ok  	github.com/rfjakob/gocryptfs/tests/plaintextnames	0.089s
ok  	github.com/rfjakob/gocryptfs/tests/reverse	0.854s
?   	github.com/rfjakob/gocryptfs/tests/test_helpers	[no test files]
```

You can run `./test.bash -v` to see the execution of individual tests. Note that
the tests also check error cases that produce error messages, and this is not
a test failure.
