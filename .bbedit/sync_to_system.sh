#!/usr/bin/env bash
THIS_DIR=$(dirname "$0")
DIRS_TO_COPY=("Text Filters" "Color Schemes" "Language Modules" "Setup" "Scripts" "Text Filters")
BBEDIT_PATH="$HOME/Library/Application Support/BBEdit"

for dir in "${DIRS_TO_COPY[@]}"
do
  rm -rf "$BBEDIT_PATH/$dir"
  cp -r "$THIS_DIR/$dir" "$BBEDIT_PATH/$dir"
done
