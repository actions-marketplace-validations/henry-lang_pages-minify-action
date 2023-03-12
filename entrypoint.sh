#!/bin/sh -l

npm i minify@7.0.0 -g
apt-get update
apt-get -y install moreutils
cd dist # assuming site build is in dist
find . -type f \( -iname \*.html -o -iname \*.js -o -iname \*.css \) | while read fname
    do
    minify ${fname} | sponge ${fname}
    done
