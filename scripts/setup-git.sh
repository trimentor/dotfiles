#!/bin/bash

# https://en.wikipedia.org/wiki/ANSI_escape_code
RED='\033[0;31m'
GREEN='\033[0;32m'
NO_COLOR='\033[0m'

if [ ! -L ~/.gitattributes ]; then
  printf "${RED}Linking gitattributes..${NO_COLOR}\n"
  ln -s ~/dotfiles/.gitattributes ~/.gitattributes
  printf "${GREEN}Done!${NO_COLOR}\n"
fi

if [ ! -L ~/.gitconfig ]; then
  printf "${RED}Linking gitconfig..${NO_COLOR}\n"
  ln -s ~/dotfiles/.gitconfig ~/.gitconfig
  printf "${GREEN}Done!${NO_COLOR}\n"
fi

if [ ! -L ~/.gitignore ]; then
  printf "${RED}Linking gitignore..${NO_COLOR}\n"
  ln -s ~/dotfiles/.gitignore ~/.gitignore
  printf "${GREEN}Done!${NO_COLOR}\n"
fi

if [ ! -L ~/.gitmessage ]; then
  printf "${RED}Linking gitmessage..${NO_COLOR}\n"
  ln -s ~/dotfiles/.gitmessage ~/.gitmessage
  printf "${GREEN}Done!${NO_COLOR}\n"
fi
