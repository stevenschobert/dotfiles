# File System
function o() {
  if [[ "$1" != "" ]]; then
    TARGET="$1"
  else
    TARGET=.
  fi
  open $TARGET
}
alias showHiddenFiles="defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder"
alias hideHiddenFiles="defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder"

# Ruby
function rinstall_gem() {
  GEMSPEC=$(ls -l | grep \.gemspec | awk '{ print $9; exit }')
  echo "building $GEMSPEC"
  gem build "./$GEMSPEC"
  GEM=$(ls -l | grep \.gem | awk '{ print $9; exit }')
  echo "install $GEM"
  gem install "./$GEM"
}

function mtime() {
  echo '$stdout.sync = true; print Time.now.strftime("%Y%m%d%H%M%S")' | ruby
}

function hash() {
  echo "require 'SecureRandom'; \$stdout.sync = true; print SecureRandom.hex($1);" | ruby
}

# BBEdit
function e() {
  if [[ "$1" != "" ]]; then
    TARGET="$1"
  else
    TARGET=.
  fi
  bbedit $TARGET  
}

# Gitx
alias gx="gitx"

# docker
function dk_clean { docker rm `docker ps --no-trunc -a -q` }
function export_docker_env { echo $(docker-machine env default) > ~/.zsh/docker_env.zsh }
function export_localdocker { sudo sed -i -e 's/^[0-9\.]* localdocker$//g' /private/etc/hosts && echo "$(docker-machine ip 2>/dev/null) localdocker" | xargs -I % sudo sh -c "echo '%' >> /private/etc/hosts" }

# reset rails db
function resetdb_rails() { rake db:drop && rake db:create && rake db:migrate && rake db:seed; }

# gitignore fetch
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

# open git directory on github
function ghb() {
  URL=$(cat .git/config | grep github | sed -E 's/^.*(github\.com):(.*)(\.git)?/http:\/\/\1\/\2/')
  open $URL
}

# copy output of command without newlines
function cpc() { echo -n `$@` | pbcopy; }

# spin up a simple web server
alias simple_server="python -m SimpleHTTPServer"

# go
export GOPATH="$HOME/Documents/go"
export PATH=$PATH:"$HOME/Documents/go/bin"

# misc
alias tp="TexturePacker"
alias nw="/usr/local/bin/node-webkit.app/Contents/MacOS/node-webkit"
alias nw_legacy="/usr/local/bin/node-webkit-legacy.app/Contents/MacOS/node-webkit"
