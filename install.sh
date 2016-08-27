#!/bin/bash
#Install various software
dir=~/dotfiles

git config --global core.excludesfile '~/.gitignore'

#cd ~/.vim
git submodule update --init --recursive

# Install ranger if necessary
cd ranger
python setup.py install --optimize=1 --record=install_log.txt --user

# Install fasd
cd ~/.clvv-fasd-4822024
PREFIX=$HOME make install

# Make directory for vim undo history
mkdir -p $HOME/.vimundo
# Install par
sudo dnf -y install par the_silver_searcher

# Install fzf
~/.fzf/install

# Install YCM
cd ~/.vim/bundle/YCM
./install.py --clang-completer &

cd $dir
.copyconfig.sh
