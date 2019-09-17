#!/usr/bin/env bash
THIS_DIR=$(dirname "$0")
DIRS_TO_COPY=(
  "Packages"
)
SUBLIMETEXT_PATH="$HOME/Library/Application Support/Sublime Text 3"

for dir in "${DIRS_TO_COPY[@]}"
do
  rm -rf "$THIS_DIR/$dir"
  cp -r "$SUBLIMETEXT_PATH/$dir" "$THIS_DIR/$dir"
  find "$THIS_DIR/$dir" -iname "package control*" -exec rm -rf {} \;
  find "$THIS_DIR/$dir" -iname "*.crt" -exec rm -rf {} \;
done
