#!/bin/sh
if [ ! -e ~/.local/bin/nvim.appimage ]
then
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
    chmod u+x nvim.appimage
    mkdir -p ~/.local/bin
    mv -i nvim.appimage ~/.local/bin/
else
    echo "nvim already installed"
fi

# install config files
mkdir -p $HOME/.config/nvim
stow --adop nvim
