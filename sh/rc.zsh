export SH_LOCAL_DIR=$HOME/config/sh

# Use vi keybindings
bindkey -v

# vi mode doesn't bind reverse seach by default
bindkey "^R" history-incremental-search-backward

source ${SH_LOCAL_DIR}/rc.sh

# Bind "." to reload zshrc
function . {
    if [[ $# -eq 0 ]]; then
        builtin . ~/.zshrc
    else
        builtin . "$@"
    fi
}

# oh-my-zsh settings. It needs the $ZSH variable to be set to the location where it was cloned (by
# our ansible role.)
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="avit" # Has a nice color scheme and multiline-prompt with git info.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

