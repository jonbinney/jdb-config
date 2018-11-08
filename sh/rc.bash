export SH_LOCAL_DIR=$HOME/config/sh

# use vim keybindings for bash shell
set -o vi

function parse_git_branch_and_add_brackets {
      git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \[\1\]/'
}

PS1="\n\[\033[32m\][\w]\[\033[0m\]\n\[\033[1;36m\]\u@\[\033[32m\]\h\[\033[1;33m\]\$(parse_git_branch_and_add_brackets)-> \[\033[0m\]"

source ${SH_LOCAL_DIR}/rc.sh
