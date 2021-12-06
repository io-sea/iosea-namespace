#!/bin/sh -x

DDIR=/tmp/toto

rm -fr $DDIR 
mkdir -p $DDIR 

for i in libiosea-hash  libm0common; do 
	cd $i
	rm -fr b
	mkdir -p b
	cd b
	cmake ..
	make srpm
	cd ../..
done

for i in kvsal extstore kvsns-base ; do 
	cd $i
	rm -fr b
	mkdir -p b
	cd b
	cmake -DEXT_BUILD=$DDIR ..
	make srpm
	cd ../..
done
