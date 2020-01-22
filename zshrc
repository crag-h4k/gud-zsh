#!/bin/zsh
#
export ZSH_BASE=$HOME/.zsh
export ZSH=$ZSH_BASE/oh-my-zsh
export ZSH_CUSTOM=$ZSH_BASE/custom
#
ZSH_THEME="gud"
ZSH_DISABLE_COMPFIX=true
#
source $ZSH/oh-my-zsh.sh
source $ZSH_BASE/functions
source $ZSH_BASE/aliases
# check for private variable file, create one if it doesn't exist
if [[ ! -a $HOME/.zsh-private ]]; then
    echo "Creating a private file at $HOME/.zsh-private";
    echo "# Put private alias or env variables in this file.\n" > $HOME/.zsh-private;
fi
source $HOME/.zsh-private

unsetopt BEEP
unsetopt LIST_BEEP
unsetopt HIST_BEEP

HISTFILE=$HOME/.zsh_history
HISTSIZE=2048
SAVEHIST=2048

setopt append_history       # append history
setopt hist_reduce_blanks   # removes un-needed blank spaces and lines from history
setopt hist_verify          # verify before executing history command
setopt extended_history     # save time/date in zsh_history
setopt share_history        # share history between sessions

watch=all                   # watch all logins
logcheck=15                 # every 15 seconds
# vim keybindings
# bindkey -v

plugins=( 
    git
    aws
    kubectl
    docker
    osx
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-completions
)

case "$OSTYPE" in
  darwin*)
    test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh";
    ssh-add -A >/dev/null 2>&1;
  ;;
  linux*)
    #
  ;;
esac
#
echo $LOCAL_IP;
source $ZSH/oh-my-zsh.sh
