all:
	git pull
	mkdocs build --clean 2>&1 | grep -v "Warning: Click detected the use of the unicode_literals"
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
