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

function bkup() {
  cp "$1" "$1.bkup"
}

function len() {
  printf '%d\n' ${#1}
}

function json_validate() {
  node -e "\
    const path = require('path'); \
    const fs = require('fs'); \
    var input = '$1'; \
    if (path.extname(input) === '.json') { \
      input = fs.readFileSync(input, 'utf-8'); \
    } \
    try { \
      JSON.parse(input);\
      process.exit(0); \
    } catch (err) { \
      console.error(err.message); \
      process.exit(1); \
    }"
}

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
  echo "require 'SecureRandom'; \$stdout.sync = true; print SecureRandom.hex($1 / 2);" | ruby
}

# BBEdit
function e() {
  if [[ "$1" != "" ]]; then
    TARGET="$1"
  else
    TARGET=.
  fi
  bbedit $TARGET
  # subl $TARGET
}

# Git
function glr { git rev-parse --short HEAD } # get short version of last commit ref

# Ctags
alias ctags="`brew --prefix`/bin/ctags"

# Ember
alias em="ember"

# Kubernetes
alias kb="kubectl"

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
  GITDIR=$(git rev-parse --show-toplevel)
  URL=$(awk '/\[remote "origin"\]/{getline; print}' "$GITDIR/.git/config" | sed -E "s/[[:space:]]*url[[:space:]]*\=[[:space:]]*(.*)[[:space:]]*/\1/" | sed -E "s/^git@(.*)\:/http:\/\/\1\//")
  open $URL
}

# logbook
# https://routley.io/tech/2017/11/23/logbook.html
function lb() {
  vim ~/Dropbox/logbook/$(date '+%Y-%m-%d').md
}

# copy output of command without newlines
function cpc() { echo -n `$@` | pbcopy; }

# spin up a simple web server
function simple_server() {
  # python -m SimpleHTTPServer $@; # For python 2
  python -m http.server $@; # For python 3
}

# misc
alias nw="/usr/local/bin/node-webkit.app/Contents/MacOS/node-webkit"
alias nw_legacy="/usr/local/bin/node-webkit-legacy.app/Contents/MacOS/node-webkit"
