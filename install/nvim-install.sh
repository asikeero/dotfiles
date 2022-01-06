#!/bin/sh
if [ ! -e ~/.local/bin/nvim.appimage ]
then
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
    chmod u+x nvim.appimage
    mv nvim.appimage ~/.local/bin/
fi
