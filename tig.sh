#! /bin/bash
source env.sh
git submodule update --init --recursive
# Install tig
cd $dir/tig
(make > tig.log 2>&1 && make install >> tig.log 2>&1 ) &
