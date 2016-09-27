sudo dnf -y copr enable dperson/neovim
sudo dnf -y install neovim

curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
