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

# History Settings
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=256000000          # the number of items for the internal history list
export SAVESIZE=256000000          # maximum number of items for the history file
# No beeps!
unsetopt LIST_BEEP
unsetopt HIST_BEEP
unsetopt BEEP
# Session and cmdline handling
setopt HIST_IGNORE_SPACE           # ignore commands that start with a space
setopt HIST_REDUCE_BLANKS          # removes un-needed blank spaces and lines from history
setopt SHARE_HISTORY               # share history between sessions, append to history from all sessions
setopt HIST_VERIFY                 # show command with history expansion to user before running it
setopt HIST_IGNORE_DUPS            # remove consecutive dups
setopt HIST_ALLOW_CLOBBER          # Add ‘|’ to output redirections in the history. This allows history references to clobber files even when CLOBBER is unset.
setopt HIST_NO_STORE               # Don't store history commands
# setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
# setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
logcheck=10                        # every 15 seconds
watch=all                          # watch all logins
# vim keybindings
# bindkey -v
# turn on zmv
autoload zmv


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
    terraform
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-completions
)
#
source $ZSH/oh-my-zsh.sh
echo $LOCAL_IP;
# Enable zsh history backups, see custom/functions/zhist_backup
export ZSH_HISTORY_BACKUP_DIR=$ZSH_BASE/zsh_history_backups
export ZSH_HISTORY_BACKUP_MAX_DAYS=30
zsh_history_backup &> $ZSH_HISTORY_BACKUP_DIR/zsh_history_backup.log

autoload -U +X bashcompinit && bashcompinit
case "$OSTYPE" in
  darwin*)
    test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh";
    complete -o nospace -C /opt/homebrew/bin/terragrunt terragrunt
  ;;
  linux*)
    ssh-add -A >/dev/null 2>&1;
  ;;
esac
