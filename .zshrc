# Oh my zsh setup
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git sublime)
source $ZSH/oh-my-zsh.sh

# Load files
for file (~/.zsh/*.zsh) source $file
