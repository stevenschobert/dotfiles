# Always launch tmux first if available
# if command -v tmux>/dev/null; then
#   [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux new-session -A -s _main
# fi

# Oh my zsh setup
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.zsh/custom

# Theme from https://github.com/oskarkrawczyk/honukai-iterm-zsh
ZSH_THEME=honukai

plugins=(
  brew
  bundler
  colored-man-pages
  docker-compose
  encode64
  git
  go
  heroku
  jsontools
  mix
  npm
  urltools
  wd
)
source $ZSH/oh-my-zsh.sh

# Load files
for file (~/.zsh/*.zsh) source $file

# added by travis gem
[ -f /Users/stevenschobert/.travis/travis.sh ] && source /Users/stevenschobert/.travis/travis.sh
