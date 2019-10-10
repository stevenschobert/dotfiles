PLATFORMSTR=$(uname -s)

# Path
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:vendor/bundle/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin

# Qmake
export PATH=$PATH:/usr/local/opt/qt@5.5/bin

# Heroku Toolbelt
export PATH=$PATH:/usr/local/heroku/bin

# Editor
export EDITOR="vim"

# Don't match patterns
unsetopt nomatch

# bundle open should use BBEdit
export BUNDLER_EDITOR=bbedit

if [[ "$PLATFORMSTR" == "Darwin" ]]; then
  # Android
  export PATH=$PATH:~/Library/Android/sdk/platform-tools:~/Library/Android/sdk/tools
fi

# go
export GOPATH="$HOME/Code/go"
export PATH=$PATH:"$HOME/Code/go/bin"

# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# node
. $HOME/.node/path_shim.sh

if [[ "$PLATFORMSTR" == "Linux" ]]; then
  # Source ssh-agent finder
  . ~/.ssh/find-agent.sh

  # Automatically pick the first ssh-agent
  ssh-find-agent -a || eval $(ssh-agent) > /dev/null
fi
