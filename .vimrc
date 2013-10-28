set nocompatible   " Use VIM settings, rather than VI settings
set encoding=utf-8 " Set VIM file encoding detection

set expandtab      " Use spaces, rather than tabs
set tabstop=2      " One tab equals two spaces
set shiftwidth=2   " Controls how many columns text is indented with >> and <<

set history=50     " Keep 50 lines of command line history
set ruler          " Show the cursor position all the time
set showcmd        " Display incomplete commands
set showmode       " Show the mode you're in
set scrolloff=3    " Show three lines before and after the cursor

set backspace=indent,eol,start " Backspace through everything in insert mode

set nowrap         " Don't display lines continues on the next line when they don't fit on the screen
set number         " Show linenumbers
set textwidth=0    " Don't break a line after a certain number of chars has been met
set cursorline     " Highlight current line
set cursorcolumn   " Highlight current column

set hlsearch       " Highlight search keywords
set incsearch      " Enable incremental searching
set ignorecase     " Enable case insensitive search..
set smartcase      " ..unless keywords contain at least one capital letter
set grepprg=ack-grep " Use Ack when calling :grep

" Remove hl search when pressing Enter
nnoremap <CR> :nohlsearch<CR>

" Easier split navigations
" E.g. Ctrl-j instead of Ctrl-w + j
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Set colors
set t_Co=256
colorscheme wombat256

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
else
  syntax enable
end

" Configure Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Original repos on GitHub
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-markdown'
Bundle 'jtratner/vim-flavored-markdown'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'scrooloose/nerdtree'
Bundle 'airblade/vim-gitgutter'
Bundle 'gregsexton/gitv'

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting
  filetype plugin indent on

  " Set File type to 'text' for files ending in .txt
  autocmd BufNewFile,BufRead *.txt setfiletype text

  " Enable soft-wrapping for text files
  autocmd FileType text,markdown,html,xhtml,eruby setlocal wrap linebreak nolist

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters
  " autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim)
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Automatically load .vimrc source when saved
  autocmd BufWritePost .vimrc source $MYVIMRC

  augroup END
else
  set autoindent " Always set autoindenting on
endif

" Use Q for formatting, rather than Ex moode
map Q gq

" Ctrl+l to write '=>'
imap <c-l> <space>=><space>

" Ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" Search buffer
map <Leader>pb :CtrlPBuffer<CR>

