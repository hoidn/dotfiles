#!/bin/bash
#Install various software
BASE=`pwd`
source env.sh

command_exists () {
    type "$1" &> /dev/null ;
}

git config --global alias.tree "log --oneline --decorate --all --graph"

# sudo dnf -y install par the_silver_searcher gcc-c++ clang-devel tmux vim-enhanced

mkdir -p $HOME/bin
#cd ~/.vim
git submodule update --init --recursive

# Install fzf
yes | ~/.fzf/install
cp .fzf/bin/fzf-tmux ~/bin/
cp .fzf/bin/fzf ~/bin/

bash copyconfig.sh

# Install ranger if necessary
cd ranger
python setup.py install --optimize=1 --record=install_log.txt --user

git config --global core.excludesfile '~/.gitignore'


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



# Install YCM
cd ~/.vim/bundle/YCM
./install.py --clang-completer

# Install fasd
cd ~/.clvv-fasd-4822024
PREFIX=$HOME make install

# Install Rust
if ! command_exists cargo ; then
	cd $BASE
	bash rustinstall.sh
fi

# Install ripgrep
if ! command_exists rg ; then
	cargo install ripgrep
fi

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install tmux
