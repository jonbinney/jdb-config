############################################################
#
# Convenience stuff for working with ROS
#
############################################################

# show node name in rosconsole output
export ROSCONSOLE_FORMAT='[${node}] [${time}]: ${message}'

alias tfmon="rosrun tf tf_monitor"
alias imview="rosrun rqt_image_view rqt_image_view"
alias reconf="rosrun rqt_reconfigure rqt_reconfigure"
alias console="rosrun rqt_console rqt_console"
alias romon="rosrun rqt_robot_monitor rqt_robot_monitor"
alias rviz="rosrun rviz rviz"
alias c="catkin_make"
alias ci="catkin_make install"
alias cr="catkin_make -DCMAKE_BUILD_TYPE=Release"
alias cri="catkin_make -DCMAKE_BUILD_TYPE=Release install"
alias cdi="catkin_make -DCMAKE_BUILD_TYPE=Debug install"
alias cclean="rm -rf build devel install"
alias br="bloom-release --rosdistro jade --track jade"

function radd()
{
    export ROS_PACKAGE_PATH=$PWD:$ROS_PACKAGE_PATH
}

function fuerte()
{
    source /opt/ros/fuerte/setup.bash
}

function groovy()
{
    source /opt/ros/groovy/setup.bash
}

function hydro()
{
    source /opt/ros/hydro/setup.bash
}

function indigo()
{
    source /opt/ros/indigo/setup.bash
}

function jade()
{
    source /opt/ros/indigo/setup.bash
}

function dev()
{
    if [ -e qtcreator-build ]
    then
      source ./qtcreator-build/devel/setup.bash
    elif [ -e src-build ]
    then
      source src-build/devel/setup.bash
    elif [ -e devel_isolated/setup.bash ]
    then
      source devel_isolated/setup.bash
    else
      source ./devel/setup.bash
    fi
}

