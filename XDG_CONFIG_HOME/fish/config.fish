# Alias
alias bash='env FISH_VERSION=$FISH_VERSION bash'

# ROS
set -q ROS_DISTRO && source /opt/ros/$ROS_DISTRO/share/rosbash/rosfish

if command -v register-python-argcomplete >/dev/null 2>&1
    register-python-argcomplete --shell fish colcon | .
end
