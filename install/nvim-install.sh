#!/bin/sh
if [ ! -e ~/.local/bin/nvim.appimage ]
then
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
    chmod u+x nvim.appimage
    mkdir -p ~/.local/bin
    mv nvim.appimage ~/.local/bin/
    
    # configure nvim
    ./nvim-configure.sh

else
    echo "nvim already installed"
fi
