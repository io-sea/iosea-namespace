#!/bin/sh -x
mkdir results localrepo

# Architecture to be built, a related .cfg file must exist
ARCH=epel-7-x86_64

MOCK="mock --configdir $PWD/mock_cfg -r $ARCH --resultdir=$PWD/results"

# Init the mock environment
$MOCK --init

for i in libiosea-hash kvsal extstore kvsns; do
	SRPM=`find $i/ -name "*$i*.src.rpm"`
	$MOCK --no-clean rebuild $SRPM 
	BUILD_RPM=`find results/ -name "*$i*.rpm"`
	$MOCK install $BUILD_RPM
	mv results/*.rpm localrepo
	cd localrepo && createrepo . && cd ..
done

# CLEANUP
$MOCK --clean

