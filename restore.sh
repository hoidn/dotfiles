dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files=".bashrc .vimrc .inputrc .vim "
to_delete=".bashrc .vimrc .inputrc .vim .clvv-fasd-4822024 .fzf"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $to_delete; do
    echo "deleting ~/$file"
    rm ~/$file 
done

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Restoring $file from $olddir"
    mv $olddir/$file ~/$file
done

