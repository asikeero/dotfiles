#!/bin/sh

installdir=~/.local/pyenv

# pyenv
git clone https://github.com/pyenv/pyenv.git $installdir

# pyenv venv
git clone https://github.com/pyenv/pyenv-virtualenv.git $installdir/plugins/pyenv-virtualenv
