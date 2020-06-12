dotfiles
========

A set of configuration files

## Setup

Make sure to install the following packages on a clean system:

	sudo apt-get install -y build-essential dkms autotools-dev automake curl

Install the following package before compiling *tmux*:

	sudo apt-get install -y bison libevent-dev

Install the following package before compiling *Vim*:

	sudo apt-get install -y libncurses5-dev

Install *Ctags* (for navigating code like a pro):

	sudo apt-get install -y exuberant-ctags

Browse to your project's path and generate a *tags* file:

	ctags .

## Installation

0. Inside your user's home directory, run `git clone https://github.com/trimentor/dotfiles.git`
0. Run `~/dotfiles/scripts/compile-tmux.sh`
0. Run `~/dotfiles/scripts/compile-vim.sh`
0. Run `~/dotfiles/scripts/setup-tmux.sh`
0. Run `~/dotfiles/scripts/setup-vim.sh`
0. Run `~/dotfiles/scripts/setup-aliases.sh`
0. Run `~/dotfiles/scripts/setup-git.sh`
0. Run `~/dotfiles/scripts/setup-ctags.sh`
