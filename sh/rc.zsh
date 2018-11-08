export SH_LOCAL_DIR=$HOME/config/sh

# Use vi keybindings
bindkey -v

# vi mode doesn't bind reverse seach by default
bindkey "^R" history-incremental-search-backward

source ${SH_LOCAL_DIR}/rc.sh
