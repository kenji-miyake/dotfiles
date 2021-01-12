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
    source /opt/ros/foxy/setup.bash
    source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash
    export ROSCONSOLE_FORMAT='[${severity}] [${time}] [${node}]: ${message}'

    # custom rqt_multiplot
    if [ "$ROS_VERSION" = "1" ]; then
      source ~/rqt_multiplot_ws/install/setup.bash
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

# Rust
if command -v cargo > /dev/null 2>&1; then
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
