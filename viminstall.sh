# https://gist.github.com/rbnvrw/e78de68a956f6c3e69743260bf4c215f
# TODO: this doesn't work in Fedora 23
sudo yum install -y ruby ruby-devel lua lua-devel luajit \
    luajit-devel ctags git python python-devel \
    python3 python3-devel tcl-devel \
    perl perl-devel perl-ExtUtils-ParseXS \
    perl-ExtUtils-XSpp perl-ExtUtils-CBuilder \
    perl-ExtUtils-Embed

# symlink xsubpp (perl) from /usr/bin to the perl dir
sudo ln -s /usr/bin/xsubpp /usr/share/perl5/ExtUtils/xsubpp

cd ~
git clone https://github.com/vim/vim.git
cd vim
make clean

CFLAGS+="-O -fPIC -Wformat" ./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --with-python-config-dir=/usr/lib64/python2.7/config \
            --enable-python3interp \
            --with-python3-config-dir=/usr/lib64/python3.4/config-3.4m \
            --enable-perlinterp \
            --enable-luainterp \
            --enable-gui=gtk2 --enable-cscope --prefix=/usr
make -j VIMRUNTIMEDIR=/usr/share/vim/vim74
sudo make install
