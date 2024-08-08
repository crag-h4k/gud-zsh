export ZSH_BASE=$HOME/.zsh
export ZSH_CUSTOM=$ZSH_BASE/custom
export ZSH=$ZSH_BASE/ohmyzsh
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.private-bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/sbin:$PATH
# Max and Mojo Environment
export MAX_PATH=$HOME/.modular/pkg/packages.modular.com_max
export MODULAR_HOME=$HOME/.modular
export PATH=$MAX_PATH/bin:$PATH

export LANG="en_US.UTF-8"
export GPG_TTY=$(tty)
#
export UPDATE_ZSH_DAYS=7
export HISTTIMEFORMAT="%d-%b-%y %*"
export LOCAL_IP="$(/sbin/ifconfig -a | grep -E 'inet.*netmask' | grep -v '127.0.0.1' | awk '{print $2}')";
export ARCH="$(arch)"
#
case "$OSTYPE" in
    darwin*)
        export PATH=$HOME/.vpn:$PATH
        export PATH=$HOME/.private_bin:$PATH
        export PATH=$HOME/.cargo/bin:$PATH
        export OLLAMA_ORIGINS="app://obsidian.md*"
        # export PATH=/opt/homebrew/opt/openjdk/bin:$PATH
        # export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"
        case "$ARCH" in
            arm64*)
                alias "act"="act --container-architecture linux/amd64"
                ;;
            86*)
                export PATH=/usr/local/sbin:$PATH
                export PATH=/usr/local/opt:$PATH
                export PATH=/usr/local/opt/gettext/bin:$PATH
                export PATH=/usr/local/opt/bison/bin:$PATH
                export PATH=/usr/local/opt/llvm/bin:$PATH
                ;;
        esac
        eval $(/opt/homebrew/bin/brew shellenv)
        ;;
    linux*)
        export CONDA_PATH=/opt/miniconda3
        export PATH=/snap/bin:$PATH
        export PATH=/opt/bin:$PATH
        export PATH=/opt/miniconda3/bin:$PATH
        export PATH=/usr/local/go/bin:$PATH
        export PYTHONPATH=/opt/code/libs:${PYTHONPATH}
        export PYTHONPATH=${PYTHONPATH}:$CONDA_PATH
        ;;
esac
