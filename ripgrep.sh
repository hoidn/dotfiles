curl https://sh.rustup.rs -sSf | sh

git clone https://github.com/BurntSushi/ripgrep
cd ripgrep
cargo build --release
./target/release/rg --version
cp ./target/release/rg ~/bin/

