function git_current_branch
  set -f ref $(GIT_OPTIONAL_LOCKS=0 git symbolic-ref --quiet HEAD 2> /dev/null)
  set -f ret $status
  if test $status != 0
    if test $status = 128
      return
    end
    set -f ref $(GIT_OPTIONAL_LOCKS=0 git rev-parse --short HEAD 2> /dev/null)
    if test $status != 0
      return
    end
  end
  
  echo $(string sub --start=12 "$ref")
end
