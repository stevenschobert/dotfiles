function git_develop_branch
  GIT_OPTIONAL_LOCKS=0 git rev-parse --git-dir &>/dev/null
  if test $status -ne 0
    return
  end

  for branch in dev devel develop development
    GIT_OPTIONAL_LOCKS=0 git show-ref -q --verify "refs/heads/$branch" &>/dev/null
    if test $status -eq 0
      echo "$branch"
      return 0
    end
  end

  return 1
end
