# Path
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:vendor/bundle/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin

# Elixir
export PATH=$PATH:$(find /usr/local/Cellar/elixir -type d -name bin | awk 'END{print}')

# Rbenv
#export RBENV_ROOT=/usr/local/var/rbenv
export PATH=$PATH:$HOME/.rbenv/bin
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Heroku Toolbelt
export PATH=$PATH:/usr/local/heroku/bin

# Android
export ANDROID_HOME=/Applications/Android\ Studio.app/sdk/
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform_tools

# NVM
[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh

