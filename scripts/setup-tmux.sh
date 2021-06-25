#!/bin/bash

# https://en.wikipedia.org/wiki/ANSI_escape_code
RED='\033[0;31m'
GREEN='\033[0;32m'
NO_COLOR='\033[0m'

if [ ! -L ~/.tmux.conf ]; then
  printf "${RED}Linking tmux configuration file..${NO_COLOR}\n"
  ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
  printf "${GREEN}Done!${NO_COLOR}\n"
fi
