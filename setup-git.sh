#!/usr/bin/env bash 

# copy predefined local gitconfig unless simple flag is enabled
if [[ $1 != "--simple" ]]; then
    cp $(pwd)/gitconfig.local ~/.gitconfig.local
fi

# make local gitconfig
touch ~/.gitconfig.local

# symlink gitconfig
ln -sfn $(pwd)/gitconfig ~/.gitconfig
ln -sfn $(pwd)/gitexclude ~/.gitexclude
