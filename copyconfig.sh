#!/bin/bash
############################
# This script creates symlinks from the home directory to any desired
# dotfiles in ~/dotfiles. It also installs a few utilities, along with
# their dependencies.
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files=".bashrc .vimrc .vimrc_common .inputrc .vim .clvv-fasd-4822024 .fzf .config/ranger .config/nvim .spacemacs .emacs.d .profile .zshrc"

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

