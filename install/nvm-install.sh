if [ ! -e ~/.config/nvm ]
then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
    
    # make sure a global node installation exists
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    nvm install node
else
    echo "nvm already installed"
fi

