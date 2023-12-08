function gbda
  set -f main_branch (git_main_branch)
  set -f dev_branch (git_develop_branch)
  git branch --no-color --merged | command grep -vE "^([+*]|\s*($main_branch|$dev_branch)\s*\$)" | command xargs git branch --delete 2>/dev/null
end
