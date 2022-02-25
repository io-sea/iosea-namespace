#!/bin/sh
set -o xtrace

CURDIR=$(dirname "$(readlink -m "$0")")
TOPDIR=$(git rev-parse --show-toplevel)
HOOKDIR=$TOPDIR/.git/hooks
MODULEDIR=$TOPDIR/.git/modules

MODULES="libiosea-hash libm0common kvsal extstore kvsns-base"

#####MODULES="libiosea-hash libm0common kvsal GRH extstore kvsns-base"

# Link checkpatch script configuration file to top level working
# directory.
ln -sf ./src/scripts/checkpatch.conf "$TOPDIR/.checkpatch.conf"

###cp -f "$CURDIR/main/pre-commit" "$HOOKDIR"
###chmod +x  "$HOOKDIR/pre-commit"

cp -f "$CURDIR/main/commit-msg" "$HOOKDIR"
chmod +x "$HOOKDIR/commit-msg"

for m in $MODULES; do
	cp -f "$CURDIR/modules/pre-commit" "$MODULEDIR"/$m/hooks
	chmod +x "$MODULEDIR/$m/hooks/pre-commit"

	cp -f "$CURDIR/modules/commit-msg" "$MODULEDIR"/$m/hooks
	chmod +x "$MODULEDIR/$m/hooks/commit-msg"
done

