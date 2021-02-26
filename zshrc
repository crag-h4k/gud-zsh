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
SAVEHIST=4096

setopt append_history       # append history
setopt hist_reduce_blanks   # removes un-needed blank spaces and lines from history
setopt hist_verify          # verify before executing history command
setopt extended_history     # save time/date in zsh_history
setopt share_history        # share history between sessions

watch=all                   # watch all logins
logcheck=15                 # every 15 seconds
# vim keybindings
# bindkey -v

case "$OSTYPE" in
  darwin*)
    test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh";
    alias "lsblk"="diskutil list";
    alias "ssh-add -k"="ssh-add-key"
    alias "ssh-keychain-add"="ssh-add -k"
    alias "incog"="open -a /Applications/Google\ Chrome\ Canary.app --args --incognito"
    alias "brewski"="brew update && brew upgrade && brew cleanup; brew doctor"
    alias "dns-reset"="sudo killall -HUP mDNSResponder;sudo killall mDNSResponderHelper;sudo dscacheutil -flushcache"
    # wireless testing
    alias "scanarea"="sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -s"
    alias "currentapi"="sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport --getinfo"
    alias "setchannelto1"="sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport --channel=2"
    alias "setchannelto2"="sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport --channel=2"
    alias "setchannelto3"="sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport --channel=3"
    alias "setchannelto4"="sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport --channel=4"
    alias "setchannelto5"="sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport --channel=5"
    alias "setchannelto6"="sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport --channel=6"
    alias "setchannelto7"="sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport --channel=7"
    alias "setchannelto8"="sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport --channel=8"
    alias "setchannelto9"="sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport --channel=9"
    alias "setchannelto10"="sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport --channel=10"
    alias "setchannelto11"="sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport --channel=11"
    alias "setchannelto12"="sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport --channel=12"
    alias "setchannelto13"="sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport --channel=13"
  ;;
  linux*)
    ssh-add -A >/dev/null 2>&1;
    #
  ;;
esac

source $ZSH_BASE/aliases

for function in $ZSH_CUSTOM/functions/*; do
      source $function
  done

plugins=(git aws docker docker-compose osx ssh-agent zsh-autosuggestions zsh-syntax-highlighting zsh-completions)
#
source $ZSH/oh-my-zsh.sh
echo $LOCAL_IP;
