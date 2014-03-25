#!/bin/sh -e

VERSION=$2
TAR=../libxalan2-java_$VERSION.orig.tar.gz
DIR=libxalan2-java-$VERSION

mkdir $DIR
tar -x -v -z -f $TAR $DIR
dos2unix $DIR/build.xml
rm $TAR
GZIP=--best tar -c -z -f $TAR --exclude '*.jar' --exclude '*.class' $DIR
rm -r $DIR

# move to directory 'tarballs'
if [ -r .svn/deb-layout ]; then
  . .svn/deb-layout
  mv $TAR $origDir
  echo "moved $TAR to $origDir"
fi
