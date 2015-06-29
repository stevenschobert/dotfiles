# Path
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:vendor/bundle/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin

# Editor
export EDITOR=vim

# Rbenv
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Heroku Toolbelt
export PATH=$PATH:/usr/local/heroku/bin

# Android
export ANDROID_HOME=/Applications/Android\ Studio.app/sdk/
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform_tools

# Boot2Docker
export DOCKER_CERT_PATH=/Users/stevenschobert/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

# NVM
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
