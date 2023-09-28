#!/bin/sh -e

filepath="$BB_DOC_PATH"

file_to_jump="$filepath"

$SHELL -c "open -a /Applications/MacVim.app \"$file_to_jump\"" &
