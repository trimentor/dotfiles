#!/bin/bash

cd /tmp
latestrelease=$(curl -s https://api.github.com/repos/tmux/tmux/releases/latest | python3 -c "import sys, json; print(json.load(sys.stdin)['tarball_url'])")
wget ${latestrelease} -O tmux.tar.gz

gunzip tmux.tar.gz
tar -xf tmux.tar

mainfolder=$(tar -tf tmux.tar --exclude '*/*')
tar -xf tmux.tar
mv ${mainfolder} tmux

cd tmux/
./autogen.sh
./configure
make
sudo make install

rm -rf /tmp/tmux
rm /tmp/tmux.tar
