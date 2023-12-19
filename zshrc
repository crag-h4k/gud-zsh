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

# No beeps!
unsetopt LIST_BEEP
unsetopt HIST_BEEP
unsetopt BEEP

export HISTFILE=$HOME/.zsh_history
export HISTSIZE=10000000    # the number of items for the internal history list
export SAVESIZE=10000000    # maximum number of items for the history file
setopt EXTENDED_HISTORY     # save time/date in zsh_history
setopt INC_APPEND_HISTORY   # Write to the history file immediately, not when the shell exits.
setopt HIST_IGNORE_SPACE    # ignore commands that start with a space
setopt HIST_REDUCE_BLANKS   # removes un-needed blank spaces and lines from history
# setopt HIST_VERIFY          # verify before executing history command
setopt SHARE_HISTORY        # share history between sessions
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
#setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
# setopt BANG_HIST                 # Treat the '!' character specially during expansion.
# setopt HISTIGNORE=”*[Pp][Aa][Ss][Ss][Ww][Oo][Rr][Dd]*”
# turn on zmv
autoload zmv
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
    aws
    brew
    colored-man-pages
    colorize
    docker
    docker-compose
    gpg-agent
    git
    macos
    ssh-agent
    # hit ESC twice to have last command prepended with `sudo`
    # sudo
    terraform
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-completions
)
#
source $ZSH/oh-my-zsh.sh
echo $LOCAL_IP;
