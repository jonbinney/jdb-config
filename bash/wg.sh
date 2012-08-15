function ws()
{
    cd $HOME/ws/"$1"
    export ROS_WS=$PWD
    source setup.sh
}

function usepr2()
{
    PR2_NAME=$1
    export ROS_MASTER_URI=http://$PR2_NAME:11311
}

alias pri="usepr2 pri"
alias prj="usepr2 prj"
alias prk="usepr2 prk"
alias prl="usepr2 prl"
alias prm="usepr2 prm"
alias prn="usepr2 prn"
alias pro="usepr2 pro"
alias prp="usepr2 prp"
alias prq="usepr2 prq"

function wgvpn()
{
    cd $HOME/.dropbox_data/Dropbox/Documents/willow/jbinney_openvpn/openvpn/jbinney-1
    sudo openvpn willow.conf
}

function fuerte()
{
    source /opt/ros/fuerte/setup.bash
}