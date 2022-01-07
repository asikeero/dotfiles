# INSTALL & CONFIGURE kitty terminal
is_installed=$(which kitty)
if [ -z $is_installed ]
then
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin \
        launch=n
    # Create a symbolic link to add kitty to PATH (assuming ~/.local/bin is in your path
    mkdir -p ~/.local/bin
    ln -fs ~/.local/kitty.app/bin/kitty ~/.local/bin/
    # Place the kitty.desktop file somewhere it can be found by the OS
    cp -f ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
    # Update the path to the kitty icon in the kitty.desktop file
    sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty.desktop
    sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator $HOME/.local/bin/kitty 50
    sudo update-alternatives --set x-terminal-emulator $HOME/.local/bin/kitty
else
    echo "Kitty already installed :)"
fi

