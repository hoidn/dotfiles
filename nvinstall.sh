command_exists () {
    type "$1" &> /dev/null ;
}

if ! command_exists cmake ; then
	cd cmake
	./bootstrap 
	make
	make install
	sudo make install
	cd ../
fi

cd neovim
make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX:PATH=$HOME/neovim"
make install
pip install neovim -U
ln -s ~/neovim/bin/nvim ~/.local/bin/

