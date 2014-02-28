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
function dk_clean {docker rm `docker ps -notrunc -a -q` }

# spin up a simple web server
alias simple_server="python -m SimpleHTTPServer"

# saucelabs connect (requires auth, see auth.sample)
function localsauce { cd /usr/local/lib/saucelabs/sauce-connect && java -jar Sauce-Connect.jar $SAUCE_USERNAME $SAUCE_API_KEY; }

# misc
alias tp="TexturePacker"
alias nw="/Applications/node-webkit.app/Contents/MacOS/node-webkit"
