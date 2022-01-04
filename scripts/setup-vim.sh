#!/bin/bash

# https://en.wikipedia.org/wiki/ANSI_escape_code
RED='\033[0;31m'
GREEN='\033[0;32m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NO_COLOR='\033[0m'

if [ ! -d ~/.vim ]; then
  printf "${RED}Creating vim directory..${NO_COLOR}\n"
  mkdir ~/.vim
  printf "${GREEN}Done!${NO_COLOR}\n"
fi
if [ ! -L ~/.vimrc ]; then
  printf "${RED}Linking vim configuration file..${NO_COLOR}\n"
  ln -s ~/dotfiles/.vimrc ~/.vimrc
  printf "${GREEN}Done!${NO_COLOR}\n"
fi
if [ ! -d ~/.vim/ftplugin ]; then
  printf "${RED}Linking file type plugin directory..${NO_COLOR}\n"
  ln -s ~/dotfiles/.vim/ftplugin/ ~/.vim/ftplugin
  printf "${GREEN}Done!${NO_COLOR}\n"
fi

if [ ! -d ~/.vim/autoload/plug.vim ]; then
  printf "${RED}Downloading plugin manager..${NO_COLOR}\n"
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  printf "${GREEN}Done!${NO_COLOR}\n"
  printf "${PURPLE}Open Vim and run ${CYAN}:PlugInstall${PURPLE} when setup finished.${NO_COLOR}\n"
fi

read -r -p "Use Vim as your default editor? (y/N) " use
if [[ "$use" =~ ^(yes|y)$ ]]; then
  printf "${RED}Updating bash configuration file..${NO_COLOR}\n"
  cat ~/dotfiles/scripts/editor.txt >> ~/.bashrc
  printf "${GREEN}Done!${NO_COLOR}\n"
fi
