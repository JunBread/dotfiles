#!/usr/bin/env bash 

BASHRC_SOURCE=$(pwd)/bashrc
BASHRC_TARGET=~/.bashrc
BASHRC_LOCAL_SOURCE=$(pwd)/bashrc.local
BASHRC_LOCAL_TARGET=~/.bashrc.local

if [ $1 != "--simple" ]; then
    # copy initial local .bashrc
    cp $BASHRC_LOCAL_SOURCE $BASHRC_LOCAL_TARGET

    # install bat
    if ! command -v bat &>/dev/null && ! command -v batcat &>/dev/null; then
      if [ "$OSTYPE" == "linux"* ]; then
        sudo apt install -y bat
      elif [ "$OSTYPE" == "darwin"* ]; then
        brew install bat
	  	fi
    fi

    # install nvm
    export PROFILE=$BASHRC_LOCAL_TARGET
    wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
fi

# backup old bashrc
if [ -f $BASHRC_TARGET ] && [ ! -L $BASHRC_TARGET ]; then
    mv $BASHRC_TARGET $BASHRC_TARGET.old
fi

# create local bashrc if not exists
touch $BASHRC_LOCAL_TARGET

# symlink bashrc
ln -sfn $BASHRC_SOURCE $BASHRC_TARGET

# load bashrc
source $BASHRC_TARGET
