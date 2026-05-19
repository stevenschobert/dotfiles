PROMPT="%B%F{blue}#%f%b \
%F{cyan}%n%f \
%F{white}at%f \
%F{green}%M%f \
%F{white}in%f \
%B%F{yellow}%~%f%b \
%F{white}[%*]%f \
%(0?..%F{red}[%?]%f)
%B%F{red}→ %f%b"

# do not enter commands into history if they are repeats of last one
setopt HIST_IGNORE_DUPS

# derived from oh-my-zsh git plugin
function git_current_branch() {
  local ref
  ref=$(git symbolic-ref --quiet HEAD 2> /dev/null)
  local ret=$?
  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return  # no git repo.
    ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  fi
  echo ${ref#refs/heads/}
}

alias g="git"
alias gst="git status"
alias gb="git branch"
alias gco="git checkout"
alias ggpush='git push origin "$(git_current_branch)"'
alias gx="gitx"
alias l="ls -lah --color"
alias e="bbedit"
alias o="open"
alias simple_server="python3 -m http.server"
alias ghidra="/usr/local/ghidra/ghidraRun"

# enable completions for homebrew-managed packages
FPATH="$HOMEBREW_PREFIX/share/zsh/site-functions:${FPATH}"
autoload -Uz compinit
compinit

# tab-complete case insensitively
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

