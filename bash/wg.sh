alias pri="usepr2 pri"
alias prj="usepr2 prj"
alias prk="usepr2 prk"
alias prl="usepr2 prl"
alias prm="usepr2 prm"
alias prn="usepr2 prn"
alias pro="usepr2 pro"
alias prp="usepr2 prp"
alias prq="usepr2 prq"

alias tfmon="rosrun tf tf_monitor"

function ws()
{
    cd $HOME/ws/"$1"
    export ROS_WS=$PWD
    if [ -f setup.bash ]; then
        echo "Sourcing setup.bash"
        source setup.bash
    fi;

    # create a ros environment loader
    echo "Creating env loader"
    make_env_loader.py $ROS_WS
    export ROS_ENV_LOADER=$ROS_WS/env.sh
}

function usepr2()
{
    PR2_NAME=$1
    export ROS_MASTER_URI=http://$PR2_NAME:11311
}

function wgvpn()
{
    cd $HOME/.dropbox_data/Dropbox/Documents/willow/jbinney_openvpn/openvpn/jbinney-1
    sudo openvpn willow.conf
}

function fuerte()
{
    source /opt/ros/fuerte/setup.bash
}

function groovy()
{
    source /opt/ros/groovy/setup.bash
}


function d()
{
    rosrun pr2_dashboard pr2_dashboard &>/dev/null&
}