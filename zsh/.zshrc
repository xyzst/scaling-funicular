# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/cest-la-vie/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# homebrew
export PATH=/usr/local/bin:$PATH

# nvm
export NVM_DIR="$HOME/.nvm"
source $NVM_DIR/nvm.sh

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

source /Users/cest-la-vie/fsociety/zsh-autosuggestions/zsh-autosuggestions.zsh
source /Users/cest-la-vie/fsociety/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

SPACESHIP_TIME_SHOW=true
