# If you have Oh My ZSH installed, this script can be placed in $HOME/.oh-my-zsh/custom and marked as executable.  After
# you source your ~/.zshrc, you should be able to call this function from anywhere.
# #### here's the meat
#function set-aws-env() {
#    typeset -A AWS_SETTINGS=($(awk -F"=" "/\[$1\]/{ x = NR + 2; next }(NR <= x){ printf \"%s %s \", \$1, \$2 }" ~/.aws/credentials))
#    for k v in ${(kv)AWS_SETTINGS}
#    do
#        export ${k:u}=$v
#    done
#}
#
# An example of what the environment variables might look like after running the function:
# % set-aws-env default
# %  env | grep AWS
# AWS_ACCESS_KEY_ID=[whatever the access key id is for the specified environment]
# AWS_SECRET_ACCESS_KEY=[whatever the secret access key is for the specified environment]

# this is a short script to show file differences between branch.
# default test check against is test
#function gitdf(){
#    if [ $# -eq 0 ]; then
#        branch="test"
#        git diff --name-status $branch
#    elif [ $# -eq 2 ]; then
#        git diff --name-status $1 $2
#    else;
#        git diff --name-status $1
#    fi
#}
