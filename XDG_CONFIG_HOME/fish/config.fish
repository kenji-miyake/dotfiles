# Set $SHELL for venv in VSCode
set SHELL (which fish)

# ripgrep
alias rg="rg --hidden --glob '!.git'"

# zoxide
zoxide init fish | source

# pipx
register-python-argcomplete --shell fish pipx | source

# colcon
alias colcon='__colcon_find_workspace_dir > /dev/null && cd (__colcon_find_workspace_dir); command colcon'

# ROS
register-python-argcomplete --shell fish ros2 | source
alias roscd="ccd -o"

# Reload
function reload_if_rosdistro_mixed
    if [ "$AUTO_SOURCE_PREV_ROS_DISTRO" != "$ROS_DISTRO" ]
        clear
        reload -c as -e 'ROS_DISTRO=$ROS_DISTRO'
    end
end

set -U AUTO_SOURCE_AFTER_SOURCE_COMMAND reload_if_rosdistro_mixed

# Zellij
abbr -a t 'nohup x-terminal-emulator > /dev/null 2>&1 & && disown %1'
