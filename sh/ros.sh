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

if test -n "$ZSH_VERSION"; then
    CURRENT_SHELL_SUFFIX=zsh
else
    CURRENT_SHELL_SUFFIX=bash
fi

function radd()
{
    export ROS_PACKAGE_PATH=$PWD:$ROS_PACKAGE_PATH
}

function fuerte()
{
    source /opt/ros/fuerte/setup.${CURRENT_SHELL_SUFFIX}
}

function groovy()
{
    source /opt/ros/groovy/setup.${CURRENT_SHELL_SUFFIX}
}

function hydro()
{
    source /opt/ros/hydro/setup.${CURRENT_SHELL_SUFFIX}
}

function indigo()
{
    source /opt/ros/indigo/setup.${CURRENT_SHELL_SUFFIX}
}

function jade()
{
    source /opt/ros/indigo/setup.${CURRENT_SHELL_SUFFIX}
}

function kinetic()
{
    source /opt/ros/kinetic/setup.${CURRENT_SHELL_SUFFIX}
}

function lunar()
{
    source /opt/ros/lunar/setup.${CURRENT_SHELL_SUFFIX}
}

function melodic()
{
    source /opt/ros/melodic/setup.${CURRENT_SHELL_SUFFIX}
}

function noetic()
{
    source /opt/ros/noetic/setup.${CURRENT_SHELL_SUFFIX}
}

# Switch to a workspace and source the setup.bash
function cws()
{
    cd ~/ws/$1
    if [ -e src/iron_ox ]
    then
      . src/iron_ox/setup.${CURRENT_SHELL_SUFFIX}
    fi

    dev

    if [ -e devel ]
    then
      . devel/setup.${CURRENT_SHELL_SUFFIX}
    else
      . src/cmake-build-debug/devel/setup.${CURRENT_SHELL_SUFFIX}
    fi
}

# Switch to a worspace and open CLion
function clws()
{
    cws $1
    clion ~/ws/$1/src &
}

function dev()
{
    if [ -e devel ]
    then
      source ./devel/setup.${CURRENT_SHELL_SUFFIX}
    elif [ -e src/cmake-build-debug ]
    then
      source ./src/cmake-build-debug/devel/setup.${CURRENT_SHELL_SUFFIX}
    elif [ -e qtcreator-build ]
    then
      source ./qtcreator-build/devel/setup.${CURRENT_SHELL_SUFFIX}
    elif [ -e src-build ]
    then
      source src-build/devel/setup.${CURRENT_SHELL_SUFFIX}
    elif [ -e devel_isolated/setup.${CURRENT_SHELL_SUFFIX} ]
    then
      source devel_isolated/setup.${CURRENT_SHELL_SUFFIX}
    else
        echo "Could not find a setup file to source"
    fi
}

