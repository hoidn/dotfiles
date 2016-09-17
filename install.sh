#!/bin/bash
#Install various software
dir=~/dotfiles
ANACONDA_VER='2-4.1.1'
ANACONDA_DIR=$HOME/anaconda2
PYTHON_VER=2

command_exists () {
    type "$1" &> /dev/null ;
}

#sudo dnf -y install par the_silver_searcher gcc-c++ clang-devel cmake tmux vim-enhanced

bash copyconfig.sh

# Install ranger if necessary
cd ranger
python setup.py install --optimize=1 --record=install_log.txt --user

git config --global core.excludesfile '~/.gitignore'

#cd ~/.vim
git submodule update --init --recursive

# download and install anaconda
# TODO: necessary with vim-enhanced?
if ! command_exists python$PYTHON_VER ; then
	wget https://repo.continuum.io/archive/Anaconda$ANACONDA_VER-Linux-x86_64.sh
	bash Anaconda$ANACONDA_VER-Linux-x86_64.sh -b -p $ANACONDA_DIR
	export PATH="$ANACONDA_DIR:$PATH"
fi


# Make directory for vim undo history
mkdir -p $HOME/.vimundo
mkdir -p $HOME/.local/bin


# Install fzf
~/.fzf/install

# Install YCM
cd ~/.vim/bundle/YCM
./install.py --clang-completer

# Install fasd
cd ~/.clvv-fasd-4822024
PREFIX=$HOME make install
