############################################################
#
# Functions for working with robots
#
############################################################

alias pri="use_robot pri"
alias prj="use_robot prj"
alias prk="use_robot prk"
alias prl="use_robot prl"
alias prm="use_robot prm"
alias prn="use_robot prn"
alias pro="use_robot pro"
alias prp="use_robot prp"
alias prq="use_robot prq"

alias huey="use_robot huey"
alias dewey="use_robot dewey"
alias louie="use_robot louie"

alias may="use_robot may"
alias june="use_robot june"
alias april="use_robot april"

function use_robot()
{
    ROBOT_HOSTNAME=$1
    export ROS_MASTER_URI=http://$ROBOT_HOSTNAME:11311
}
