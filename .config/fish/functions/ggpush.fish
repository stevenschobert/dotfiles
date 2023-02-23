function ggpush --wraps='git push origin' --description 'alias ggpush=git push origin git_current_branch'
  git push origin "$(git_current_branch)"
end
