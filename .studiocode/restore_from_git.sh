#!/usr/bin/env bash
THIS_DIR=$(dirname "$0")
USER_PATHS_TO_COPY=(
  "settings.json"
)
STUDIOCODE_LIBRARY_PATH="$HOME/Library/Application Support/Code"
STUDIOCODE_DOTFOLDER_PATH="$HOME/.vscode"

for path_to_copy in "${USER_PATHS_TO_COPY[@]}"
do
  mkdir -p "$STUDIOCODE_LIBRARY_PATH/User"
  rm -rf "$STUDIOCODE_LIBRARY_PATH/User/$path_to_copy"
  cp -r "$THIS_DIR/User/$path_to_copy" "$STUDIOCODE_LIBRARY_PATH/User/$path_to_copy"
done
