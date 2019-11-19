export ZSH_BASE=/Users/damorgan/.zsh:$PATH
export ZSH=$ZSH_BASE/oh-my-zsh:$PATH
export ZSH_CUSTOM=$ZSH_BASE/zsh_custom:$PATH
export PYTHONPATH=$PYTHONPATH:/home/damorgan/anaconda3/lib/python3.7/site-packages:$PATH
export PATH=/Users/damorgan/anaconda3/bin:$PATH

export PATH=/Users/damorgan/.local/bin:$PATH
#export PATH=$HOME/go/bin:$PATH
#export GOPATH=$HOME/go
export HISTTIMEFORMAT="%d/%m/%y %T"
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/opt/gettext/bin:$PATH
export PATH=/usr/local/opt:$PATH
# pyspark env
export PYSPARK_DRIVER_PYTHON="jupyter-lab"
export PYSPARK_PYTHON_OPTS="notebook"
export PYSPARK_PYTHON=python3

export KUBECONFIG=/Users/damorgan/Code/adobe-kubernetes-container-security-class/personal-kubeconfig.yaml
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters
#/usr/local/bin/pyspark
#export PATH=$HOME/.local/bin:$PATH
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
