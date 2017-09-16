all:
	git pull
	mkdocs build --clean 2>&1 | grep -v "Warning: Click detected the use of the unicode_literals"

.PHONY: clean
clean:
	rm -Rf site
