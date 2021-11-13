PLATFORMSTR=$(uname -s)

# Path
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:vendor/bundle/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin

# Qmake
export PATH=$PATH:/usr/local/opt/qt@5.5/bin

# Libpq/Postgres Utils
export PATH=/usr/local/opt/libpq/bin:$PATH

# Heroku Toolbelt
export PATH=$PATH:/usr/local/heroku/bin

# Editor
export EDITOR="vim"

# Perforce
export P4CONFIG=.p4c

# Don't match patterns
unsetopt nomatch

# bundle open should use BBEdit
export BUNDLER_EDITOR=bbedit

if [[ "$PLATFORMSTR" == "Darwin" ]]; then
  # Android
  export PATH=$PATH:~/Library/Android/sdk/platform-tools:~/Library/Android/sdk/tools
fi

# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# node
export ASDF_NPM_DEFAULT_PACKAGES_FILE=$HOME/.node/.default-npm-packages

# java
. ~/.asdf/plugins/java/set-java-home.zsh

# groovy
export ASDF_GROOVY_DISABLE_JAVA_HOME_EXPORT=true

# python
export ASDF_PYTHON_DEFAULT_PACKAGES_FILE=$HOME/.python/.default-python-packages

if [[ "$PLATFORMSTR" == "Linux" ]]; then
  # Source ssh-agent finder
  . ~/.ssh/find-agent.sh

  # Automatically pick the first ssh-agent
  ssh-find-agent -a || eval $(ssh-agent) > /dev/null
fi
