# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Original .bashrc
source /etc/skel/.bashrc

# ROS
if [ -d "/opt/ros" ]; then
    source /opt/ros/foxy/setup.bash
    source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash
fi

# Python
export PYTHONBREAKPOINT=IPython.embed

# CCache
export CC="/usr/lib/ccache/gcc"
export CXX="/usr/lib/ccache/g++"

# CUDA
export PATH="/usr/local/cuda/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"

# Snap
export PATH="/snap/bin:$PATH"

# Linuxbrew
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# Fish Shell
if [ -z "$FISH_VERSION" ]; then
    command -v fish > /dev/null 2>&1 && exec fish
fi
