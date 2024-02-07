#command_exists () {
#    type "$1" &> /dev/null ;
#}
#
#if ! command_exists cmake ; then
#	cd cmake
#	./bootstrap 
#	make
#	make install
#	sudo make install
#	cd ../
#fi
#
cd neovim
#make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX:PATH=$HOME/neovim"
make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/.local"
make install
#pip install neovim -U
ln -s ~/neovim/bin/nvim ~/.local/bin/

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#sudo apt-get install neovim
## X11 headers are needed to build / install ueberzug. libxres-dev, in particular, isn't mentioned in most of the
## build instructions online
#sudo apt-get install libx11-dev
#sudo apt-get install libxext-dev
#sudo apt-get install libxres-dev
#pip3 install pynvim ueberzug 
