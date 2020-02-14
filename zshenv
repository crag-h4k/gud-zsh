export PATH=$HOME/.local/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/sbin:$PATH
#
export UPDATE_ZSH_DAYS=7
export HISTTIMEFORMAT="%d-%b-%y %*"
export LOCAL_IP="$(/sbin/ifconfig -a | grep -E 'inet.*netmask' | grep -v '127.0.0.1' | awk '{print $2}')";

case "$OSTYPE" in
  darwin*)
    export PATH=$HOME/anaconda3/bin:$PATH
    export PATH=/usr/local/sbin:$PATH
    export PATH=/usr/local/opt:$PATH
    export PATH=/usr/local/opt/gettext/bin:$PATH
  ;;
  linux*)
    #
  ;;
esac
