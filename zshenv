export ZSH_BASE=$HOME/.zsh
export ZSH_CUSTOM=$ZSH_BASE/custom
export ZSH=$ZSH_BASE/ohmyzsh
export PATH=$ZSH_BASE/bin:$PATH
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
export TERM=xterm-256color
export UPDATE_ZSH_DAYS=7
export HISTTIMEFORMAT="%d-%b-%y %*"
export ARCH="$(arch)"
#
case "$OSTYPE" in
    darwin*)
        export PATH=$HOME/.vpn:$PATH
        export HOMEBREW_PREFIX=/opt/homebrew
        export HOMEBREW_CELLAR=/opt/homebrew/Cellar
        export HOMEBREW_REPOSITORY=/opt/homebrew
        export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:$PATH
        export MANPATH=/opt/homebrew/share/man${MANPATH+:$MANPATH}:
        export INFOPATH=/opt/homebrew/share/info:${INFOPATH:-}
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
