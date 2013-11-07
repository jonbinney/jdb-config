############################################################
#
# Functions for working with robots
#
############################################################

function ur()
{
    ROBOT_HOSTNAME=$1
    export ROS_MASTER_URI=http://$ROBOT_HOSTNAME:11311
}
