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

# setup direnv for shell (adds shell directory hooks)
eval "$(direnv hook zsh)"

# load golang asdf
if [ -f "${ASDF_DATA_DIR:-$HOME/.asdf}/plugins/golang/set-env.zsh" ]; then
  . ${ASDF_DATA_DIR:-$HOME/.asdf}/plugins/golang/set-env.zsh
fi

# custom path for Haxe (non asdf)
export HAXE_VERSION="${HAXE_VERSION:-4.3.7}"
export PATH="$PATH:/usr/local/haxe_${HAXE_VERSION}"

# VSCode shortcut
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

