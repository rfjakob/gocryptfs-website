all: .venv
	. .venv/bin/activate && LC_ALL=C.UTF-8 LANG=C.UTF-8 mkdocs build --clean --quiet
	cp -af htaccess site/.htaccess

.venv:
	python3 -m venv .venv
	. .venv/bin/activate && pip3 install mkdocs==1.6.1

.PHONY: clean
clean:
	rm -Rf site .venv

.PHONY: test
test:
	curl -sSf -o /dev/null https://nuetzlich.net/gocryptfs
	# These should redirect to the new names
	curl -sSf -o /dev/null https://nuetzlich.net/gocryptfs/security
	curl -sSf -o /dev/null https://nuetzlich.net/gocryptfs/reverse_mode
