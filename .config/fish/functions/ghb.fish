function ghb
  set -f git_dir $(git rev-parse --show-toplevel)
  set -f url $(awk '/\[remote "origin"\]/{getline; print}' "$git_dir/.git/config" | sed -E "s/[[:space:]]*url[[:space:]]*\=[[:space:]]*(.*)[[:space:]]*/\1/" | sed -E "s/^git@(.*)\:/http:\/\/\1\//")
  open $url
end
