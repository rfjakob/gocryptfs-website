[![Build Status](https://travis-ci.org/rfjakob/gocryptfs-website.svg?branch=master)](https://travis-ci.org/rfjakob/gocryptfs-website)

This repostitory contains the gocryptfs website that is available at
https://nuetzlich.net/gocryptfs .

It is generated using mkdocs. Install using

    pip3 install mkdocs==0.17.5

Note: mkdocs 1.0 [crashes](https://travis-ci.org/rfjakob/gocryptfs-website/builds/456463957)
with `Object of type 'Undefined' is not JSON serializable`.
