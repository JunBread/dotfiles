#!/usr/bin/env bash 

bashrc_source=$(pwd)/bashrc
bashrc_target=~/.bashrc
bashrc_local_source=$(pwd)/bashrc.local
bashrc_local_target=~/.bashrc.local

if [[ $1 != '--simple' ]]; then
    # copy initial local .bashrc
    cp $bashrc_local_source $bashrc_local_target

    # install bat
    if [[ ! -f /usr/bin/bat && ! -f /usr/bin/batcat ]]; then
        sudo apt install -y bat
    fi

    # install nvm
    export PROFILE=$bashrc_local_target
    wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
fi

# backup old bashrc
if [[ -f $bashrc_target && ! -L $bashrc_target ]]; then
    mv $bashrc_target $bashrc_target.old
fi

# create local bashrc if not exists
touch $bashrc_local_target

# symlink bashrc
ln -sfn $bashrc_source $bashrc_target

# load bashrc
source $bashrc_target