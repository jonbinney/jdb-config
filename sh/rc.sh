alias t="unset TMUX && tmux"
alias tm="tmux -L tmux_mega -f $HOME/config/tmux/tmux_mega.conf"

alias rebash="source $HOME/.bashrc"
alias emacs='emacs -nw'

alias cdd="cd .."
alias cddd="cd ../.."
alias cdddd="cd ../../.."
alias cddddd="cd ../../../.."
alias cdddddd="cd ../../../../.."

export EDITOR=vim

# Hack to make java fonts look better
#
#   http://anadoxin.org/blog/blog/20140908/fixing-ugly-java-fonts/
#
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on"

# if this variable isn't set properly, tmux won't use 256 colors
[ -z "$TMUX" ] && export TERM=xterm-256color

# useful functions (should move these into more specific files)
source ${SH_LOCAL_DIR}/funcs.sh

# general ROS stuff
source ${SH_LOCAL_DIR}/ros.sh

# workspace management stuff
source ${SH_LOCAL_DIR}/ws.sh

# robot specific stuff
source ${SH_LOCAL_DIR}/robots.sh

# handy git stuff
source ${SH_LOCAL_DIR}/git.sh

