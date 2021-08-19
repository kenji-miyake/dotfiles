# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac

# Original .bashrc
source /etc/skel/.bashrc

# Add user's private bin to PATH
export PATH="$HOME/.local/bin:$PATH"

# ROS
if [ -d "/opt/ros" ]; then
    test "$ROS_DISTRO" = "" && export ROS_DISTRO=galactic
    if [ "$ROS_DISTRO" = "rolling" ]; then
        source /opt/ros/rolling/setup.bash
    elif [ "$ROS_DISTRO" = "galactic" ]; then
        source /opt/ros/galactic/setup.bash
    elif [ "$ROS_DISTRO" = "noetic" ]; then
        source /opt/ros/noetic/setup.bash
    else
        echo "Invalid ROS_DISTRO $ROS_DISTRO was given."
    fi

    source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash

    if [ "$ROS_VERSION" = "1" ]; then
        export ROSCONSOLE_FORMAT='[${severity}] [${time}] [${node}]: ${message}'
    elif [ "$ROS_VERSION" = "2" ]; then
        export RCUTILS_COLORIZED_OUTPUT=1
        export RCUTILS_CONSOLE_OUTPUT_FORMAT="[{severity} {time}] [{name}]: {message}"
        export ROS_LOCALHOST_ONLY=1
    fi
fi

# Python
export PYTHONBREAKPOINT=IPython.embed

# CCache
if command -v ccache > /dev/null 2>&1; then
    export CC="/usr/lib/ccache/gcc"
    export CXX="/usr/lib/ccache/g++"
fi

# CUDA
export PATH="/usr/local/cuda/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="/usr/local/libtorch/lib:$LD_LIBRARY_PATH"

# Rust
if test -f $HOME/.cargo/env; then
    source $HOME/.cargo/env
fi

# Snap
export PATH="/snap/bin:$PATH"

# Linuxbrew
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# Fish Shell
if [ -z "$FISH_VERSION" ]; then
    command -v fish > /dev/null 2>&1 && exec fish
fi
