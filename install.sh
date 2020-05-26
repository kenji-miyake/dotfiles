#!/usr/bin/env bash

# Prevent root execution
if [ $(id -u) -eq 0 ]; then
  echo "Don't run as root" >&2
  exit 1
fi

# Essential packages
command -v curl > /dev/null 2>&1 || sudo apt -y install curl

# Install LinuxBrew
if !(command -v brew > /dev/null 2>&1); then
  sudo apt -y install build-essential curl file git
  /usr/bin/env bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Install brew packages
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
brew install \
  ag \
  fd \
  fish \
  fzf \
  sd

# Install fisher
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

# Run install script
fish install.fish
