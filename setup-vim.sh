#!/usr/bin/env bash 

vimd=~/.vim
vimrc=~/.vimrc
vundle=~/.vim/bundle/Vundle.vim
molokai=~/.vim/colors/molokai.vim

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

# install molokai color scheme
if [ ! -e $molokai ]; then
wget -O $molokai https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
fi

ln -sf $(pwd)/vimrc $vimrc
ln -sf $(pwd)/vim-include ~/.vim/vim-include

vim -c PluginInstall -c q -c q
