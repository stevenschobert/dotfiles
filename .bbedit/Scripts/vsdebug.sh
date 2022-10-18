#!/bin/sh -e

filepath="$BB_DOC_PATH"
linenum="$BB_DOC_SELSTART_LINE"
docdir=$(dirname "$filepath")
gitdir=$(cd "$docdir" && git rev-parse --show-toplevel)

project_dir="$docdir"

if [ "$gitdir" != "$HOME" ]; then
  project_dir="$gitdir"
fi

path_to_open="$project_dir"

if [ -d "$project_dir/.vscode" ]; then
  workspace_file=$(find "$project_dir/.vscode" -type f -name "*.code-workspace" | head -n 1)
  if [ ! -z "$workspace_file" ]; then
    path_to_open="$workspace_file"
  fi
fi

file_to_jump="$filepath"

if [ ! -z "$linenum" ]; then
  file_to_jump="$file_to_jump:$linenum"
fi

$SHELL -c "code --goto $file_to_jump $path_to_open" &
