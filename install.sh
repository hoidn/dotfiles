#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired
# dotfiles in ~/dotfiles. It also installs a few utilities, along with
# their dependencies.
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files=".bashrc .vimrc .inputrc .vim .clvv-fasd-4822024 .fzf"

##########

mkdir -p ~/bin

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
done

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

# Install fzf
~/.fzf/install
