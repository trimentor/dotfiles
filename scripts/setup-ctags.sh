#!/bin/bash

# https://en.wikipedia.org/wiki/ANSI_escape_code
RED='\033[0;31m'
GREEN='\033[0;32m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NO_COLOR='\033[0m'

if [ ! -L ~/.ctags ]; then
  printf "${RED}Linking Ctags file..${NO_COLOR}\n"
  ln -s ~/dotfiles/.ctags ~/.ctags
  printf "${GREEN}Done!${NO_COLOR}\n"
fi
