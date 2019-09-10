#!/usr/bin/env bash
THIS_DIR=$(dirname "$0")
DIRS_TO_COPY=(
  "Packages"
)
SUBLIMETEXT_PATH="$HOME/Library/Application Support/Sublime Text 3"

for dir in "${DIRS_TO_COPY[@]}"
do
  rm -rf "$SUBLIMETEXT_PATH/$dir"
  cp -r "$THIS_DIR/$dir" "$SUBLIMETEXT_PATH/$dir"
done
