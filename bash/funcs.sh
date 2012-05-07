function ssh_()
{
     /usr/bin/dbus-send --session /net/sf/roxterm/Options net.sf.roxterm.Options.SetColourScheme string:$ROXTERM_ID string:Remote
     /usr/bin/ssh "$@"
     /usr/bin/dbus-send --session /net/sf/roxterm/Options net.sf.roxterm.Options.SetColourScheme string:$ROXTERM_ID string:Tango
}

