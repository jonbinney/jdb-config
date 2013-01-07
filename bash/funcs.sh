function ssh_()
{
     /usr/bin/dbus-send --session /net/sf/roxterm/Options net.sf.roxterm.Options.SetColourScheme string:$ROXTERM_ID string:Remote
     /usr/bin/ssh "$@"
     /usr/bin/dbus-send --session /net/sf/roxterm/Options net.sf.roxterm.Options.SetColourScheme string:$ROXTERM_ID string:Tango
}

function wgvpn()
{
    cd $DROPBOX_DIR/Documents/willow/jbinney_openvpn/openvpn/jbinney-1
    sudo openvpn willow.conf
}
