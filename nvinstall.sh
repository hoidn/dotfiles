cd neovim

# Clean previous build artifacts owned by root
sudo rm -rf build

# Build and install to ~/.local
make distclean
make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/.local -DCMAKE_POLICY_VERSION_MINIMUM=3.5"
make install

# Create symlink after verifying binary exists
mkdir -p ~/.local/bin
if [ -f ~/.local/bin/nvim ]; then
    echo "Neovim binary successfully installed"
else
    echo "ERROR: Neovim binary not found at ~/.local/bin/nvim after install"
    exit 1
fi

# Setup config directory
mkdir -p ~/.config
ln -sf ~/dotfiles/.config/nvim ~/.config/

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
##command_exists () {
##    type "$1" &> /dev/null ;
##}
##
##if ! command_exists cmake ; then
##	cd cmake
##	./bootstrap 
##	make
##	make install
##	sudo make install
##	cd ../
##fi
##
#cd neovim
##make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX:PATH=$HOME/neovim"
#make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/.local"
#make install
##pip install neovim -U
#[ -f ~/.local/bin/nvim ] && rm ~/.local/bin/nvim
#ln -s ~/neovim/bin/nvim ~/.local/bin/
#
#sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
#       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#
##sudo apt-get install neovim
### X11 headers are needed to build / install ueberzug. libxres-dev, in particular, isn't mentioned in most of the
### build instructions online
##sudo apt-get install libx11-dev
##sudo apt-get install libxext-dev
##sudo apt-get install libxres-dev
##pip3 install pynvim ueberzug 
