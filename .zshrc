# Oh my zsh setup
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.zsh/custom

# Theme from https://github.com/oskarkrawczyk/honukai-iterm-zsh
ZSH_THEME=honukai

plugins=(
  brew
  bundler
  encode64
  git
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
