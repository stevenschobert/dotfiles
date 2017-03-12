PLATFORMSTR=$(uname -s)

# Path
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:vendor/bundle/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin

# Heroku Toolbelt
export PATH=$PATH:/usr/local/heroku/bin

# Editor
export EDITOR=vim

# Don't match patterns
unsetopt nomatch

if [[ "$PLATFORMSTR" == "Darwin" ]]; then
  # asdf
  . $HOME/.asdf/asdf.sh

  # node
  . $HOME/.node/path_shim.sh

  # Android
  export PATH=$PATH:~/Library/Android/sdk/platform-tools:~/Library/Android/sdk/tools
fi

if [[ "$PLATFORMSTR" == "Linux" ]]; then
  # Source ssh-agent finder
  . ~/.ssh/find-agent.sh

  # Automatically pick the first ssh-agent
  ssh-find-agent -a || eval $(ssh-agent) > /dev/null
fi
