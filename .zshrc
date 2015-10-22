# Oh my zsh setup
ZSH=$HOME/.oh-my-zsh
ZSH_THEME=geoffgarside
plugins=(git atom bundler brew npm mix encode64 jsontools urltools wd)
source $ZSH/oh-my-zsh.sh

# Load files
for file (~/.zsh/*.zsh) source $file

# added by travis gem
[ -f /Users/stevenschobert/.travis/travis.sh ] && source /Users/stevenschobert/.travis/travis.sh
