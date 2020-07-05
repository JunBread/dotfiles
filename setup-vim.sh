#!/usr/bin/env bash

vimd=~/.vim
vimrc=~/.vimrc
vundle=~/.vim/bundle/Vundle.vim
monokai=~/.vim/colors/monokai.vim

# backup old .vimrc
if [ -e $vimrc ]; then
	mv $vimrc $vimrc.old
fi

mkdir -p ~/.vim/include
mkdir -p ~/.vim/colors

# install vundle
if [ ! -e $vundle ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git $vundle
fi

# install monokai color scheme
if [ ! -e $monokai ]; then
	wget -O $monokai https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim
fi

ln -sf $(pwd)/vimrc $vimrc
ln -sf $(pwd)/vim-include ~/.vim/vim-include

vim -c PluginInstall -c q -c q
