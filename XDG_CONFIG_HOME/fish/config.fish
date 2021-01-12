# Set $SHELL for venv in VSCode
set SHELL (which fish)

# pipx
register-python-argcomplete --shell fish pipx | source

# ROS
set -q ROS_DISTRO && source /opt/ros/$ROS_DISTRO/share/rosbash/rosfish
alias colcon='__colcon_find_workspace_dir > /dev/null && cd (__colcon_find_workspace_dir); command colcon'
