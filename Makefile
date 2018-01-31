all:
	LC_ALL=C.UTF-8 LANG=C.UTF-8 mkdocs build --clean
	cp -af htaccess site/.htaccess

.PHONY: clean
clean:
	rm -Rf site

.PHONY: test
test:
	curl -sSf -o /dev/null https://nuetzlich.net/gocryptfs
	# These should redirect to the new names
	curl -sSf -o /dev/null https://nuetzlich.net/gocryptfs/security
	curl -sSf -o /dev/null https://nuetzlich.net/gocryptfs/reverse_mode
