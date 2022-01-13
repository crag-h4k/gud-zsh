#!/bin/zsh
#
ZSH_DISABLE_COMPFIX=true
ZSH_THEME="gud"
# check for private variable file, create one if it doesn't exist
if [[ ! -a $HOME/.zsh-private ]]; then
    echo "Creating a private file at $HOME/.zsh-private";
    echo "# Put private alias or env variables in this file.\n" > $HOME/.zsh-private;
fi
#
source $HOME/.zsh-private

unsetopt BEEP
unsetopt LIST_BEEP
unsetopt HIST_BEEP

HISTFILE=$HOME/.zsh_history
HISTSIZE=4096
SAVEHIST=8192
setopt APPEND_HISTORY       # append history
setopt EXTENDED_HISTORY     # save time/date in zsh_history
setopt HIST_FIND_NO_DUPS    # dedup hist file
setopt HIST_REDUCE_BLANKS   # removes un-needed blank spaces and lines from history
setopt HIST_VERIFY          # verify before executing history command
setopt SHARE_HISTORY        # share history between sessions
# setopt INC_APPEND_HISTORY # conflicts with share_history

watch=all                   # watch all logins
logcheck=10                 # every 15 seconds
# vim keybindings
# bindkey -v

case "$OSTYPE" in
  darwin*)
    test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh";
  ;;
  linux*)
    ssh-add -A >/dev/null 2>&1;
  ;;
esac

source $ZSH_BASE/aliases

for function in $ZSH_CUSTOM/functions/*; do
      source $function
  done

plugins=(
    git
    aws
    docker
    docker-compose
    macos
    ssh-agent
    zsh-autosuggestions
    zsh-syntax-highlighting 
    zsh-completions
)
#
source $ZSH/oh-my-zsh.sh
echo $LOCAL_IP;
