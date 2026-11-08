all:
	hugo --cleanDestinationDir

.PHONY: serve
serve:
	hugo server

.PHONY: clean
clean:
	rm -Rf site

.PHONY: test
test:
	curl -sSf -o /dev/null https://nuetzlich.net/gocryptfs
	# These should redirect to the new names
	curl -sSf -o /dev/null https://nuetzlich.net/gocryptfs/security
	curl -sSf -o /dev/null https://nuetzlich.net/gocryptfs/reverse_mode
