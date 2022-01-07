#!/bin/bash


# This is a bootstrapper for the install scripts inside install/
sudo ./install/apt-packages.sh

# first insert config files with stow
stow --adopt nvim wget x zsh 

./install/fonts-install.sh
./install/kitty-install.sh 
./install/nvim-install.sh
./install/nvm-install.sh

# set zsh as default shell
chsh -s $(which zsh)

echo "Install finished!"
