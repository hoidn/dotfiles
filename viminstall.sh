# symlink xsubpp (perl) from /usr/bin to the perl dir
#sudo ln -s /usr/bin/xsubpp /usr/share/perl5/ExtUtils/xsubpp

# TODO: steer this from the main install script
PYTHON_CONFIG=$HOME/anaconda2/lib/python2.7/config
VIMDIR=$HOME/.local/usr/share/vim/vim80/

cd ~
git clone https://github.com/vim/vim.git
cd vim
make distclean

# Check ~/vim/src/auto/config.log for config issues
CFLAGS+="-O -fPIC -Wformat" ./configure --with-features=huge \
            --prefix=$VIMDIR \
            --enable-multibyte \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --with-python-config-dir=$PYTHON_CONFIG \
            --enable-perlinterp \
            --enable-luainterp \
            --enable-gui=gtk2 --enable-cscope
make -j 6
make install VIMRUNTIMEDIR=$VIMDIR DESTDIR=~/.local
