# File System
alias o="open ."
alias showHiddenFiles="defaults write com.apple.Finder AppleShowAllFiles YES && killall Finder"
alias hideHiddenFiles="defaults write com.apple.Finder AppleShowAllFiles NO && killall Finder"

# bundler
alias bake="bundle exec rake"
alias bails="bundle exec rails"
alias boreman="bundle exec foreman"
alias buard="bundle exec guard"

# postgres
alias pg_start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pg_stop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"

# misc
alias tp="TexturePacker"
