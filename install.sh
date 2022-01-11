bash basictools.sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
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

git config --global alias.tree "log --oneline --decorate --all --graph"

# sudo dnf -y install the_silver_searcher gcc-c++ clang-devel tmux vim-enhanced



git config --global core.excludesfile '~/.gitignore'


# download and install anaconda
# TODO: necessary with vim-enhanced?
if ! command_exists python$PYTHON_VER ; then
	echo "no python found; installing Anaconda python"
	wget https://repo.continuum.io/archive/Anaconda$ANACONDA_VER-Linux-x86_64.sh
	bash Anaconda$ANACONDA_VER-Linux-x86_64.sh -b -p $ANACONDA_DIR
	export PATH="$ANACONDA_DIR:$PATH"
fi



# Install YCM
cd ~/.vim/bundle/YCM
./install.py --clang-completer
echo "installed YCM"

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



