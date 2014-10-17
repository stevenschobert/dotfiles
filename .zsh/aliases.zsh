# File System
alias o="open ."
alias showHiddenFiles="defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder"
alias hideHiddenFiles="defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder"

# bundler
alias bake="bundle exec rake"
alias bails="bundle exec rails"
alias boreman="bundle exec foreman"
alias buard="bundle exec guard"

# postgres
alias pg_start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pg_stop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"

# docker
function dk_clean {docker rm `docker ps --no-trunc -a -q` }
function export_boot2docker { echo $(boot2docker shellinit) > ~/.zsh/boot2docker.zsh }
function export_localdocker { sudo sed -i -e 's/^[0-9\.]* localdocker$//g' /private/etc/hosts && echo "$(boot2docker ip 2>/dev/null) localdocker" | xargs -I % sudo sh -c "echo '%' >> /private/etc/hosts" }

# spin up a simple web server
alias simple_server="python -m SimpleHTTPServer"

# katon
alias katon=/Users/stevenschobert/.nvm/v0.10.32/bin/katon

# misc
alias tp="TexturePacker"
alias nw="/usr/local/bin/node-webkit.app/Contents/MacOS/node-webkit"
