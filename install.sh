#!/bin/bash

# This is a bootstrapper for the install scripts inside install/
sudo ./install/apt-packages.sh
./install/fonts-install.sh
./install/kitty-install.sh 
./install/nvim-install.sh


stow --adopt nvim wget x zsh 

# set zsh as default shell
chsh -s $(which zsh)

echo "Install finished!"
