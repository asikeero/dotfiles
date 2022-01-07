if [ ! -e ~/.config/nvm ]
then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
    # make sure a global node installation exists
    nvm install node
else
    echo "nvm already installed"
fi

