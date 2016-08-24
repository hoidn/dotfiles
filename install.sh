#!/bin/bash
#Install various software

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
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer

./copyconfig.sh
