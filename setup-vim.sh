#!/usr/bin/env bash

VIMD=~/.vim
VUNDLE=$VIMD/bundle/Vundle.vim

VIMRC_SOURCE=$(pwd)/vimrc
VIMRC_TARGET=~/.vimrc
VIMINCLUDE_SOURCE=$(pwd)/vim-include
VIMINCLUDE_TARGET=$VIMD/vim-include

if [[ "$1" == "--simple" ]]; then
    VIMINCLUDE_SOURCE=$(pwd)/vim-include/simple
else
    # setup wiki
    echo 'Where is your wiki root? leave empty if you want to clone a repository from github.'
    read -p ': ' wiki

    WIKI=`eval echo $WIKI`
    if [[ -d $WIKI && -d $WIKI/_wiki ]]; then
        printf $WIKI > ~/.wiki.conf
    else
        git clone https://github.com/junbread/wiki ~/personal/wiki
        printf '~/personal/wiki' > ~/.wiki.conf
    fi
fi

# backup old .vimrc
if [[ -f $VIMRC_TARGET && ! -L $VIMRC_TARGET ]]; then
    mv $VIMRC_TARGET $VIMRC_TARGET.old
fi

mkdir -p ~/.vim/include
mkdir -p ~/.vim/colors

# install vundle.
# note that it is directory
if [[ ! -d $VUNDLE ]]; then
    git clone https://github.com/VundleVim/Vundle.vim.git $VUNDLE
fi

ln -sfn $VIMRC_SOURCE $VIMRC_TARGET
ln -sfn $VIMINCLUDE_SOURCE $VIMINCLUDE_TARGET

vim -c PluginInstall -c q -c q
