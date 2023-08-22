#!/bin/sh -e

docdir=$(dirname "$BB_DOC_PATH")

gitdir=$(cd "$docdir" && git rev-parse --show-toplevel)

projdir="$docdir"
if [ "$gitdir" != "$HOME" ]; then
  projdir="$gitdir"
fi

runfile="$projdir/run.sh"
if test -f "$runfile"; then
  (cd "$projdir" && sh "$runfile")
fi
