sudo zypper install cmake

echo "installed brew"
bash osxsetup.sh
echo "ran: "
cat osxsetup.sh

#!/bin/bash
#Install various software
BASE=`pwd`
source env.sh

command_exists () {
    type "$1" &> /dev/null ;
}

bash gconfig.sh

bash copyconfig.sh
echo "copied configs"

bash fzf.sh

# Install ranger if necessary
cd ranger
python setup.py install --optimize=1 --record=install_log.txt --user
echo "installed ranger"

git config --global core.excludesfile '~/.gitignore'


# download and install anaconda
# TODO: necessary with vim-enhanced?
if ! command_exists python$PYTHON_VER ; then
	echo "no python found; installing Anaconda python"
	wget https://repo.continuum.io/archive/Anaconda$ANACONDA_VER-Linux-x86_64.sh
	bash Anaconda$ANACONDA_VER-Linux-x86_64.sh -b -p $ANACONDA_DIR
	export PATH="$ANACONDA_DIR:$PATH"
fi


# Make directory for vim undo history
mkdir -p $HOME/.vimundo
mkdir -p $HOME/.local/bin



# Install YCM
cd ~/.vim/bundle/YCM
./install.py --clang-completer
echo "installed YCM"

bash fasd.sh

## Install Rust
#if ! command_exists cargo ; then
#	cd $BASE
#	bash rustinstall.sh
#fi
#echo "installed rust"
#
## Install ripgrep
#if ! command_exists rg ; then
#	cargo install ripgrep
#fi
#echo "installed ripgrep"
