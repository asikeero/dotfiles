#!/bin/bash

# exit if any operation fails
set -e

# exit if missing parameters
set -u

# colors and printing functions
NORM='\033[0m'
GRE='\033[0;32m'
RED='\033[0;31m'
YEL='\033[0;33m'

function gecho {
    echo -e "${GRE}[message] $1${NORM}"
}

function yecho {
    echo -e "${YEL}[warning] $1${NORM}"
}

function recho {
    echo -e "${RED}[error] $1${NORM}"
    exit 1
}

# check prerequisites
function check_prereq {
    (command -v $1 > /dev/null && gecho "prereq $1 found") ||
        recho "prereq $1 not found, install first"
}

# look for cmdline tool, if not found install
function install {
    (command -v $1 > /dev/null && gecho "$1 found, not installing") || 
        (yecho "$1 not found, installing" && apt install $1 -y)
}

function create_link {
    echo "Linking: $1 --> $2"
    (ln -sf $1 $2 && gecho "success") ||
        (recho "linking failed")
}

# actions start here
# check directory
[[ $(basename $(pwd)) == "dotfiles" ]] ||
    recho "directory should be ~/dotfiles/"

# update apt repos
apt update

# check prerequisites
check_prereq git

# install wanted tools
install neofetch
install stow
install zsh
install tree

# create needed symlinks with stow
stow --adopt */

gecho "Install finished!"
