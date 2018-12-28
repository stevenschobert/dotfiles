#!/bin/sh -e

docdir=$(dirname "$BB_DOC_PATH")
gitdir=$(cd "$docdir" && git rev-parse --show-toplevel)

$SHELL -c "gitx --git-dir=\"$gitdir\"" &
