#!/usr/bin/env bash 

vimrc="~/.vimrc"

# backup old .vimrc
if [ -e $vimrc ]; then
	mv $vimrc $vimrc.old
fi

ln -sf $(pwd)/vimrc $vimrc
