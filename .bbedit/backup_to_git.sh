#!/usr/bin/env bash
THIS_DIR=$(dirname "$0")
DIRS_TO_COPY=(
  "Attachment Scripts"
  "Clippings"
  "Color Schemes"
  "Custom Keywords"
  "Language Modules"
  "Menu Scripts"
  "Scripts"
  "Setup"
  "Text Filters"
)
BBEDIT_PATH="$HOME/Dropbox/Application Support/BBEdit"

for dir in "${DIRS_TO_COPY[@]}"
do
  rm -rf "$THIS_DIR/$dir"
  cp -r "$BBEDIT_PATH/$dir" "$THIS_DIR/$dir"
done
