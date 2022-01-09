#!/bin/bash


# This is a bootstrapper for the install scripts inside install/
sudo ./install/apt-packages.sh

# make sure directories exist 
# to avoid creating symlinked directories
mkdir -p $XDG_CONFIG_HOME/nvim $XDG_CONFIG_HOME/wget $XDG_CONFIG_HOME/zsh $XDG_CONFIG_HOME/kitty

# first insert config files with stow
stow --adopt nvim wget x zsh kitty

./install/fonts-install.sh
./install/kitty-install.sh 
./install/nvim-install.sh
./install/nvm-install.sh

# set zsh as default shell
chsh -s $(which zsh)

echo "Install finished!"
