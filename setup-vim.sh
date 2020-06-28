#!/usr/bin/env bash 

vimd=~/.vim
vimrc=~/.vimrc

# backup old .vimrc
if [ -e $vimrc ]; then
	mv $vimrc $vimrc.old
fi

mkdir -p ~/.vim/include

ln -sf $(pwd)/vimrc $vimrc
ln -sf $(pwd)/vim-include ~/.vim/vim-include
