#!/bin/bash

opam switch 4.01.0+bin-doc
eval `opam config -env`
opam update
opam upgrade 

cd ~/rwo-docs


for PACKAGE in $( cat package_list ); do

VERSION=$(opam info -f version $PACKAGE)

echo $PACKAGE$VERSION

if [ ! -d $PACKAGE.$VERSION ]; then

mkdir ${PACKAGE}.${VERSION}_src 

find ~/.opam/4.01.0+bin-doc/build/$PACKAGE.$VERSION/_build/lib -name '*.cm[td]*' | xargs -I {} cp {} ~/rwo-docs/${PACKAGE}.${VERSION}_src

 ~/opam-doc/opam-doc -p $PACKAGE.$VERSION $(find ${PACKAGE}.${VERSION}_src/ -name *.cm[dt]*)

echo "done"; 

fi
done  
 

