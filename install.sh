#!/bin/bash
# This is a bootstrapper for the install scripts inside install/


sudo ./install/apt-packages.sh
sudo ./install/python-build-deps.sh

# make sure directories exist 
# to avoid creating symlinked directories
mkdir -p $XDG_CONFIG_HOME/nvim
mkdir -p $XDG_CONFIG_HOME/wget
mkdir -p $XDG_CONFIG_HOME/zsh
mkdir -p $XDG_CONFIG_HOME/kitty
mkdir -p $XDG_CONFIG_HOME/git

# first insert config files with stow
stow --adopt nvim wget x zsh kitty git

# call all the install scripts
./install/fonts-install.sh
./install/kitty-install.sh 
./install/nvim-install.sh
./install/nvm-install.sh
./install/pyenv-install.sh
./install/poetry-install.sh

# set zsh as default shell
chsh -s $(which zsh)

echo "Install finished!"
