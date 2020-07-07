#!/usr/bin/env bash

vimd=~/.vim
vundle=$vimd/bundle/Vundle.vim
monokai=$vimd/colors/monokai.vim

vimrc_source=$(pwd)/vimrc
vimrc_target=~/.vimrc
viminclude_source=$(pwd)/vim-include
viminclude_target=$vimd/vim-include

if [ $1 == 'simple' ]; then
	viminclude_source=$(pwd)/vim-include/simple
fi

# backup old .vimrc
if [ -e $vimrc_target ]; then
	mv $vimrc_target $vimrc_target.old
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

ln -sf $vimrc_source $vimrc_target
ln -sf $viminclude_source $viminclude_target

vim -c PluginInstall -c q -c q
