PLATFORMSTR=$(uname -s)

# Path
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:vendor/bundle/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin

# Qmake
export PATH=$PATH:/usr/local/opt/qt@5.5/bin

# Postgres
if [[ -d "/Applications/Postgres.app"  ]]; then
  # Postgres.app
  export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
else
  # Libpq
  export PATH=/usr/local/opt/libpq/bin:$PATH
fi

# Heroku Toolbelt
export PATH=$PATH:/usr/local/heroku/bin

# Cargo
export PATH=$PATH:$HOME/.cargo/bin

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

# ruby
export ASDF_GEM_DEFAULT_PACKAGES_FILE=$HOME/.ruby/.default-gems

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
