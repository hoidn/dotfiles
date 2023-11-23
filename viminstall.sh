# symlink xsubpp (perl) from /usr/bin to the perl dir
#sudo ln -s /usr/bin/xsubpp /usr/share/perl5/ExtUtils/xsubpp

# TODO: steer this from the main install script
# TODO: distro-dependent build dependencies for lua
PYTHON_CONFIG=$HOME/anaconda3/lib/python3.7/config
VIMDIR=$HOME
#VIMDIR=$HOME/.local/usr/share/vim/vim80/

cd ~
git clone https://github.com/vim/vim.git
cd vim
make distclean


# Check ~/vim/src/auto/config.log for config issues
CFLAGS+="-O -fPIC -Wformat" ./configure \  --with-features=huge \
            --prefix=$VIMDIR \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-python3interp=yes \
            --with-python-config-dir=$PYTHON_CONFIG \
            --enable-luainterp=yes \
            --enable-luajit=yes \
            --enable-gui=gtk2 --enable-cscope
	    --enable-fail-if-missing
	    --with-lua-prefix=/usr/include/
            #--enable-perlinterp \
make -j 8
make install #DESTDIR=~/.local #VIMRUNTIMEDIR=$VIMDIR DESTDIR=~/.local
