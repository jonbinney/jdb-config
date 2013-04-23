function ssh_()
{
    # change window color
    /usr/bin/dbus-send --session /net/sf/roxterm/Options net.sf.roxterm.Options.SetColourScheme string:$ROXTERM_ID string:Remote
    
    # set terminal title
    echo -ne "\033]0;$@\007"
    
    # do the actually ssh
    /usr/bin/ssh "$@"
    
    # set terminal title back to local
    echo -ne "\033]0;local\007"
    
    # revert the termnial color
    /usr/bin/dbus-send --session /net/sf/roxterm/Options net.sf.roxterm.Options.SetColourScheme string:$ROXTERM_ID string:Tango
}

function wgvpn()
{
    cd $DROPBOX_DIR/Documents/willow/jbinney_openvpn/openvpn/jbinney-1
    sudo openvpn willow.conf
}
