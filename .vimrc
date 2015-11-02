set nocompatible   " Use VIM settings, rather than VI settings
set encoding=utf-8 " Set VIM file encoding detection

set re=1           " Use old Regular Expression Engine for faster navigation in Ruby files

set expandtab      " Use spaces, rather than tabs
set tabstop=2      " One tab equals two spaces
set shiftwidth=2   " Controls how many columns text is indented with >> and <<

set history=50     " Keep 50 lines of command line history
set ruler          " Show the cursor position all the time
set autowrite      " Automatically :write before running commands
set showcmd        " Display incomplete commands
set showmode       " Show the mode you're in
set scrolloff=3    " Show three lines before and after the cursor

set laststatus=2   " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

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

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
else
  syntax enable
end

" Configure Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'gmarik/vundle'

" Original repos on GitHub
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rbenv'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/rbenv-ctags'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/nerdtree'
Plugin 'thoughtbot/vim-rspec'
Plugin 'bogado/file-line'
" Version Control
Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'
Plugin 'airblade/vim-gitgutter'

call vundle#end()

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

" When editing a file, always jump to the last known cursor position.
" Don't do it for commit messages, when the position is invalid, or when
" inside an event handler (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" Automatically load .vimrc source when saved
autocmd BufWritePost .vimrc source $MYVIMRC
augroup END

" Use Q for formatting, rather than Ex moode
map Q gq

let mapleader=","

" RSpec mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

let g:rspec_command = "!bundle exec rspec {spec}"

" Ctrl+l to write '=>'
imap <c-l> <space>=><space>

" Ctrl+d to jump to the next line and write 'binding.pry'
noremap <c-d> obinding.pry<ESC>:w<CR>

" Ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" Search buffer
map <Leader>pb :CtrlPBuffer<CR>

" Use ctags for jumping to source code
set tags=./tags,tags
nnoremap <f5> :!ctags -R<CR>
noremap <c-b> g<c-]>
autocmd BufWritePost * call system("ctags -R")

" Set colors
set t_Co=256
set background=dark
colors PaperColor
