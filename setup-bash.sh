#!/usr/bin/env bash 

bashrc=~/.bashrc

# backup old .vimrc
if [[ -f $bashrc && ! -L $bashrc ]]; then
	mv $bashrc $bashrc.old
fi

ln -sf $(pwd)/bashrc $bashrc
