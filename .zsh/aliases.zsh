# File System
alias o="open ."
alias showHiddenFiles="defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder"
alias hideHiddenFiles="defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder"

# BBEdit
function e() { bbedit $@ }

# Gitx
alias gx="gitx"

# docker
function dk_clean {docker rm `docker ps --no-trunc -a -q` }
function export_boot2docker { echo $(boot2docker shellinit) > ~/.zsh/boot2docker.zsh }
function export_localdocker { sudo sed -i -e 's/^[0-9\.]* localdocker$//g' /private/etc/hosts && echo "$(boot2docker ip 2>/dev/null) localdocker" | xargs -I % sudo sh -c "echo '%' >> /private/etc/hosts" }

# reset rails db
function resetdb_rails() { rake db:drop && rake db:create && rake db:migrate && rake db:seed; }

# gitignore fetch
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

# open emacs in gui
function emacs() { /Applications/Emacs.app/Contents/MacOS/Emacs "$@" ;}

# spin up a simple web server
alias simple_server="python -m SimpleHTTPServer"

# katon
alias katon=/Users/stevenschobert/.nvm/v0.10.32/bin/katon

# go
export GOPATH="$HOME/Documents/go"
export PATH=$PATH:"$HOME/Documents/go/bin"

# misc
alias tp="TexturePacker"
alias nw="/usr/local/bin/node-webkit.app/Contents/MacOS/node-webkit"
alias nw_legacy="/usr/local/bin/node-webkit-legacy.app/Contents/MacOS/node-webkit"
