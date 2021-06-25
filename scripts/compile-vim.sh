#!/bin/bash

cd /tmp
git clone https://github.com/vim/vim.git

cd vim/
latesttag=$(git describe --tags)
git checkout ${latesttag}

./configure --with-features=HUGE --enable-luainterp --enable-perlinterp --enable-pythoninterp --enable-rubyinterp
make
sudo make install

rm -rf /tmp/vim
