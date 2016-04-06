# Path
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:vendor/bundle/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin

# Don't match patterns
unsetopt nomatch

# asdf
. $HOME/.asdf/asdf.sh

# node
. $HOME/.node/path_shim.sh

# Editor
export EDITOR=vim

# Heroku Toolbelt
export PATH=$PATH:/usr/local/heroku/bin

# Android
export PATH=$PATH:~/Library/Android/sdk/platform-tools:~/Library/Android/sdk/tools
