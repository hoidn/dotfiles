# compile and install emacs 25. no X. 
wget ftp://ftp.gnu.org/pub/gnu/emacs/emacs-25.3.tar.xz
tar xvf emacs-25.3.tar.xz
cd emacs-25.3
./configure --with-x-toolkit=no --with-png=no --with-gif=no --prefix=$(HOME)/.emacs.d --bindir=$(HOME)/bin
make -j 4
make install
