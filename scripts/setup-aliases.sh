#!/bin/bash

# https://en.wikipedia.org/wiki/ANSI_escape_code
RED='\033[0;31m'
GREEN='\033[0;32m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NO_COLOR='\033[0m'

if [ ! -L ~/.aliases ]; then
  printf "${RED}Linking aliases..${NO_COLOR}\n"
  ln -s ~/dotfiles/.aliases ~/.aliases
  printf "${GREEN}Done!${NO_COLOR}\n"
fi

read -r -p "Load aliases? (y/N) " load

if [[ "$load" =~ ^(yes|y)$ ]]; then
  printf "${RED}Updating bash configuration file..${NO_COLOR}\n"
  cat ~/dotfiles/scripts/aliases.txt >> ~/.bashrc
  printf "${GREEN}Done!${NO_COLOR}\n"
fi
