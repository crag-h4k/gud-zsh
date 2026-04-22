#!/bin/zsh
#
ZSH_DISABLE_COMPFIX=true
ZSH_THEME="gud"
# check for private variable file, create one if it doesn't exist
if [[ ! -a $HOME/.zsh_private ]]; then
    echo "Creating a private file at $HOME/.zsh_private";
    echo "# Put private alias or env variables in this file.\n" > $HOME/.zsh_private;
fi
#
source $HOME/.zsh_private

# History Settings
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=256000             # the number of items for the internal history list
export SAVESIZE=256000             # maximum number of items for the history file
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

plugins=(
    aws
    colored-man-pages
    colorize
    command-not-found
    fzf
    gpg-agent
    gh
    git
    jsontools
    terraform
    tmux
    zoxide
    zsh-completions
    zsh-autosuggestions
    zsh-syntax-highlighting
)

if command -v docker &>/dev/null; then
    plugins+=(docker docker-compose)
fi

case "$OSTYPE" in
  darwin*)
    test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh";
    # Don't need this
    # complete -o nospace -C /opt/homebrew/bin/terragrunt terragrunt
    plugins+=(macos brew)
  ;;
  linux*)
    plugins+=(ssh-agent)
    ssh-add -A >/dev/null 2>&1;
  ;;
esac
#
source $ZSH/oh-my-zsh.sh

# Custom functions AFTER OMZ so our definitions override any plugin-provided
# ones (e.g. workflow_helpers.zsh `ta` beats tmux plugin's `ta`).
for function in $ZSH_CUSTOM/functions/*.zsh; do
    source $function
done

# Login-shell banner: current primary LAN IP (fresh per shell) +
# public WAN IP (cached, see MYWANIP_TTL in custom/functions/mywanip.zsh).
[[ -o login ]] && print -P "%F{cyan}LAN:%f $(myip)   %F{cyan}WAN:%f $(mywanip)"

# Enable zsh history backups, see custom/functions/zsh_history_backup.zsh
export ZSH_HISTORY_BACKUP_DIR=$ZSH_BASE/zsh_history_backups
export ZSH_HISTORY_BACKUP_MIN_HOURS=6
zsh_history_backup

autoload -U +X bashcompinit && bashcompinit
