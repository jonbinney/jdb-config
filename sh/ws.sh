############################################################
#
# Functions for handling multiple workspaces
#
############################################################

function create_ws()
{
    cd $HOME/ws/"$1"
    export ROS_WS=$PWD
    export ROS_WORKSPACE=$ROS_WS
    if [ -f setup.bash ]; then
        echo "Sourcing setup.bash"
        source setup.bash
    fi;

    # create a ros environment loader
    echo "Creating env loader"
    make_env_loader.py $ROS_WS
    export ROS_ENV_LOADER=$ROS_WS/env.sh
}

