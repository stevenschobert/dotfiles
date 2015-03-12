# Oh my zsh setup
ZSH=$HOME/.oh-my-zsh
plugins=(git sublime bundler brew npm mix encode64 jsontools urltools wd)
source $ZSH/oh-my-zsh.sh

# Theme: https://github.com/sindresorhus/pure
# Colors: https://github.com/chriskempson/tomorrow-theme/blob/627cbb8da3dd0090cc8315ac05677c40f1a460b5/OS%20X%20Terminal/Tomorrow%20Night.terminal

# Load files
for file (~/.zsh/*.zsh) source $file
