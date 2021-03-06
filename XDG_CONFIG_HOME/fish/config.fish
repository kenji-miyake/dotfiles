# Set $SHELL for venv in VSCode
set SHELL (which fish)

# pipx
register-python-argcomplete --shell fish pipx | source

# colcon
alias colcon='__colcon_find_workspace_dir > /dev/null && cd (__colcon_find_workspace_dir); command colcon'

# ROS
abbr -a rpf "ros2 pkg prefix --share"
alias roscd="ccd -o"

if [ "$ROS_VERSION" = "1" ]
    source /opt/ros/noetic/share/rosbash/rosfish
else if [ "$ROS_VERSION" = "2" ]
    register-python-argcomplete --shell fish ros2 | source
end
