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

# setup asdf
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# disable homebrew analytics
export HOMEBREW_NO_ANALYTICS=1

# setup homebrew for shell (this command just exports paths)
# NOTE: on apple-silicon, the brew install path is different;
# uncomment the bottom line for apple-silicon macs
# eval "$(/usr/local/bin/brew shellenv)"
if [ -d /opt/homebrew/ ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -f /usr/local/bin/brew ]; then
    eval "$(/usr/local/bin/brew shellenv)"
fi

# enable completions for homebrew-managed packages
FPATH="$HOMEBREW_PREFIX/share/zsh/site-functions:${FPATH}"
autoload -Uz compinit
compinit

# tab-complete case insensitively
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# setup direnv for shell (adds shell directory hooks)
eval "$(direnv hook zsh)"

# load golang asdf
if [ -f "${ASDF_DATA_DIR:-$HOME/.asdf}/plugins/golang/set-env.zsh" ]; then
  . ${ASDF_DATA_DIR:-$HOME/.asdf}/plugins/golang/set-env.zsh
fi
