git clone https://github.com/neovim/neovim.git
cd neovim
make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX:PATH=$HOME/neovim"
make install
pip install neovim
ln -s ~/neovim/bin/nvim ~/.local/bin/
