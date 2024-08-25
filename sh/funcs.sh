set_title() {
    CMD="gs_set_title"
    # Help menu
    if [ "$1" == "-h" ] || [ "$1" == "-?" ]; then
        echo "Set the title of your currently-opened terminal tab."
        echo "Usage:   $CMD any title you want"
        echo "   OR:   $CMD \"any title you want\""
        echo "   OR (to make a dynamic title which relies on variables or functions):"
        echo "         $CMD '\$(some_cmd)'"
        echo "     OR  $CMD '\${SOME_VARIABLE}'"
        echo "Examples:"
        echo "         1. static title"
        echo "           $CMD my new title"
        echo "         2. dynamic title"
        echo "           $CMD 'Current Directory is \"\$PWD\"'"
        echo "       OR  $CMD 'Date and time of last cmd is \"\$(date)\"'"
        return $EXIT_SUCCESS
    fi

    TITLE="$@"
    # Set the PS1 title escape sequence; see "Customizing the terminal window title" here:
    # https://wiki.archlinux.org/index.php/Bash/Prompt_customization#Customizing_the_terminal_window_title
    ESCAPED_TITLE="\[\e]2;${TITLE}\a\]"

    # Delete any existing title strings, if any, in the current PS1 variable. See my Q here:
    # https://askubuntu.com/questions/1310665/how-to-replace-terminal-title-using-sed-in-ps1-prompt-string
    PS1_NO_TITLE="$(echo "$PS1" | sed 's|\\\[\\e\]2;.*\\a\\\]||g')"
    PS1="${PS1_NO_TITLE}${ESCAPED_TITLE}"
}

