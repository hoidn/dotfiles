#!/bin/bash
#Install various software
dir=~/dotfiles

bash copyconfig.sh

# Install ranger if necessary
cd ranger
python setup.py install --optimize=1 --record=install_log.txt --user

command_exists () {
    type "$1" &> /dev/null ;
}

git config --global core.excludesfile '~/.gitignore'

#cd ~/.vim
git submodule update --init --recursive

# If python isn't installed on this system, then download and install anaconda
if ! command_exists python ; then
	wget https://repo.continuum.io/archive/Anaconda2-4.1.1-Linux-x86_64.sh
	bash Anaconda2-4.1.1-Linux-x86_64.sh -b -p $HOME/anaconda3
	export PATH="$HOME/anaconda3/bin:$PATH"
fi

# Make directory for vim undo history
mkdir -p $HOME/.vimundo
mkdir -p $HOME/.local/bin
# Install par
sudo dnf -y install par the_silver_searcher gcc-c++

# Install fzf
~/.fzf/install

# Install YCM
cd ~/.vim/bundle/YCM
./install.py --clang-completer &

# Install fasd
cd ~/.clvv-fasd-4822024
PREFIX=$HOME make install
