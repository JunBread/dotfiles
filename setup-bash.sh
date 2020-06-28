#!/usr/bin/env bash 

bashrc=~/.bashrc

# backup old .vimrc
if [ -e $bashrc ]; then
	mv $bashrc $bashrc.old
fi

ln -sf $(pwd)/bashrc $bashrc