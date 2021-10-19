# Make directory for vim undo history
mkdir -p $HOME/.vimundo
mkdir -p $HOME/.local/bin

bash copyconfig.sh
echo "copied configs"

mkdir -p $HOME/bin
#cd ~/.vim
git submodule update --init --recursive

# Install fzf
yes | bash fzf.sh
echo "installed fzf"

cd ~/.clvv-fasd-4822024
PREFIX=$HOME make install
echo "installed fasd"

# Install ranger if necessary
cd ranger
python setup.py install --optimize=1 --record=install_log.txt --user
echo "installed ranger"
