#!/usr/bin/env bash 

bashrc=~/.bashrc

# backup old .vimrc
if [[ -f $bashrc && ! -L $bashrc ]]; then
	mv $bashrc $bashrc.old
fi

# install bat
if [[ ! -f /usr/bin/bat && ! -f /usr/bin/batcat ]]; then
	sudo apt install -y bat
fi

ln -sf $(pwd)/bashrc $bashrc
