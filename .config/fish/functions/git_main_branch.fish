function git_main_branch
  GIT_OPTIONAL_LOCKS=0 git rev-parse --git-dir &>/dev/null
  if test $status -ne 0
    return
  end

  for ref in refs/{heads,remotes/{origin,upstream}}/{main,trunk,mainline,default,master}
    GIT_OPTIONAL_LOCKS=0 git show-ref -q --verify "$ref" &>/dev/null
    if test $status -eq 0
      set -f ref_els (string split '/' $ref)
      echo "$ref_els[-1]"
      return 0
    end
  end

  return 1
end
