#!/usr/bin/env sh
. "$HOME/.node/path_shim.sh"
BASEDIR=$(dirname "$0")
/usr/local/bin/node "$BASEDIR/.js_beautify.js"
