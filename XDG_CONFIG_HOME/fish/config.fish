# Set $SHELL for venv in VSCode
set SHELL (which fish)

# ripgrep
alias rg="rg --hidden --glob '!.git'"

# pipx
register-python-argcomplete --shell fish pipx | source

# colcon
alias colcon='__colcon_find_workspace_dir > /dev/null && cd (__colcon_find_workspace_dir); command colcon'

# ROS
abbr -a rpf "ros2 pkg prefix --share"
alias roscd="ccd -o"

if [ "$ROS_VERSION" = 1 ]
    source /opt/ros/noetic/share/rosbash/rosfish
else if [ "$ROS_VERSION" = 2 ]
    register-python-argcomplete --shell fish ros2 | source
end

# Reload
function reload_if_rosdistro_mixed
    if [ "$AUTO_SOURCE_PREV_ROS_DISTRO" != "$ROS_DISTRO" ]
        clear
        reload -c as -e 'ROS_DISTRO=$ROS_DISTRO'
    end
end

set -U AUTO_SOURCE_AFTER_SOURCE_COMMAND reload_if_rosdistro_mixed
