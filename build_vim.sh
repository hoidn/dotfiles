# Build vim so that it uses the python interpreter of the current environment
git clone https://github.com/vim/vim.git
./configure --with-features=huge             --enable-multibyte             --enable-rubyinterp=yes             --enable-python3interp=yes             --with-python3-config-dir=$(python3-config --configdir)             --enable-perlinterp=yes             --enable-luainterp=yes             --enable-gui=gtk2 --enable-cscope --prefix=/usr/local
make VIMRUNTIMEDIR=/usr/local/share/vim/vim90
