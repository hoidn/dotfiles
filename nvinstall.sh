git clone https://github.com/neovim/neovim.git
cd neovim
make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX:PATH=$HOME/neovim"
make install

ln -s `pwd`/build/bin/nvim ~/.local/bin/nvim 
