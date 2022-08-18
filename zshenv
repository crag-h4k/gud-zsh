export ZSH_BASE=$HOME/.zsh
export ZSH_CUSTOM=$ZSH_BASE/custom
export ZSH=$ZSH_BASE/ohmyzsh
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.private-bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/sbin:$PATH
export LANG="en_US.UTF-8"
#
export UPDATE_ZSH_DAYS=7
export HISTTIMEFORMAT="%d-%b-%y %*"
export LOCAL_IP="$(/sbin/ifconfig -a | grep -E 'inet.*netmask' | grep -v '127.0.0.1' | awk '{print $2}')";
#
case "$OSTYPE" in
  darwin*)
    export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
    export PATH=$HOME/anaconda3/bin:$PATH
    export PATH=/usr/local/sbin:$PATH
    export PATH=/usr/local/opt:$PATH
    export PATH=/usr/local/opt/gettext/bin:$PATH
    export PATH=/usr/local/opt/bison/bin:$PATH
    export PATH=$HOME/.vpn:$PATH
    export PATH=$HOME/.private_bin:$PATH
    export PATH=/Library/TeX/texbin:$PATH
    export SPARK_HOME=$HOME/spark_3-1-2 
    # python virtualenvwrapper
    export WORKON_HOME=$HOME/.virtualenvs
    export PROJECT_HOME=$HOME/Devel
    source $HOME/anaconda3/bin/virtualenvwrapper.sh
    #export PYSPARK_DRIVER_PYTHON=jupyter
    jdk () {
        version=$1
        export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
        java -version
        } 
    #export PYSPARK_DRIVER_PYTHON_OPTS='notebook'
  ;;
  linux*)
    export PATH=/snap/bin:$PATH
    export PATH=/opt/bin:$PATH
    export PYTHONPATH=${PYTHONPATH}:/opt/code/libs
    #
  ;;
esac
