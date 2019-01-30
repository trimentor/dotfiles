#!/bin/bash

# https://en.wikipedia.org/wiki/ANSI_escape_code
RED='\033[0;31m'
GREEN='\033[0;32m'
NO_COLOR='\033[0m'

if [ ! -d ~/.config/git ]; then
  printf "${RED}Creating git config directory..${NO_COLOR}\n"
  mkdir -p ~/.config/git
  printf "${GREEN}Done!${NO_COLOR}\n"
fi

if [ ! -L ~/.config/git/attributes ]; then
  printf "${RED}Linking gitattributes..${NO_COLOR}\n"
  ln -s ~/dotfiles/.gitattributes ~/.config/git/attributes
  printf "${GREEN}Done!${NO_COLOR}\n"
fi

if [ ! -L ~/.config/git/config ]; then
  printf "${RED}Linking gitconfig..${NO_COLOR}\n"
  ln -s ~/dotfiles/.gitconfig ~/.config/git/config
  printf "${GREEN}Done!${NO_COLOR}\n"
fi

if [ ! -L ~/.config/git/ignore ]; then
  printf "${RED}Linking gitignore..${NO_COLOR}\n"
  ln -s ~/dotfiles/.gitignore ~/.config/git/ignore
  printf "${GREEN}Done!${NO_COLOR}\n"
fi

if [ ! -L ~/.config/git/message ]; then
  printf "${RED}Linking gitmessage..${NO_COLOR}\n"
  ln -s ~/dotfiles/.gitmessage ~/.config/git/message
  printf "${GREEN}Done!${NO_COLOR}\n"
fi
