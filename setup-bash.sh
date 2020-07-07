#!/usr/bin/env bash 

bashrc_source=$(pwd)/bashrc
bashrc_target=~/.bashrc

if [[ $1 == '--simple' ]]; then
	bashrc_source=$(pwd)/bashrc.simple
else
	# install utilities

	# install bat
	if [[ ! -f /usr/bin/bat && ! -f /usr/bin/batcat ]]; then
		sudo apt install -y bat
	fi
fi

# backup old .vimrc
if [[ -f $bashrc_target && ! -L $bashrc_target ]]; then
	mv $bashrc_target $bashrc_target.old
fi

ln -sfn $bashrc_source $bashrc_target

source ~/.bashrc