#!/bin/bash

# This is a bootstrapper for the install scripts inside install/
sudo ./install/add-ppas.sh
sudo ./install/apt-packages.sh

source ./install/kitty-install.sh 

stow --adopt */


# set zsh as default shell
chsh -s $(which zsh)

echo "Install finished!"
