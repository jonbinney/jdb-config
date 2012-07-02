function ws()
{
    cd $HOME/ws/"$1"
    source setup.sh
}

function usepr2()
{
    PR2_NAME=$1
    export ROS_MASTER_URI=http://$PR2_NAME:11311
}

