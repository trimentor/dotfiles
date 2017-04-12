" Settings {{{
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

set foldmethod=marker " Fold block of text surrounded by {{{ and }}}

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
" }}}

" Syntax highlighting {{{
colors onedark " https://github.com/joshdick/onedark.vim
set t_Co=256

" Switch syntax highlighting on, when the terminal has colors
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
else
  syntax enable
end
" }}}

" Search highlighting {{{
" Remove search highlighting when pressing ENTER
nnoremap <CR> :nohlsearch<CR>
" }}}

" Mapleader {{{
let mapleader=","
" }}}

" Easier split navigations {{{
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l
" }}}

" Disable arrow navigtion {{{
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
" }}}

" Help {{{
noremap <Leader>vh :vert help<space>
" }}}

" Sudo write (,W) {{{
noremap <leader>W :w !sudo tee %<CR>
" }}}

" Plugins {{{
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
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/nerdtree'
Plugin 'thoughtbot/vim-rspec'
Plugin 'bogado/file-line'
Plugin 'tpope/vim-unimpaired'
" Version Control
Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'
Plugin 'airblade/vim-gitgutter'

call vundle#end()
filetype plugin indent on
" }}}

" Ruby {{{
" Ctrl+l to write '=>'
imap <c-l> <space>=><space>

" Ctrl+d to jump to the next line and write 'binding.pry'
noremap <c-d> obinding.pry<ESC>:w<CR>
" }}}

" RSpec {{{
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR> 
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_command = "!bundle exec rspec {spec}"
" }}}

" CtrlP {{{
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_user_command = ['.git/', 'git ls-files --cached --others  --exclude-standard %s']
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)\tags\tmp$'
let g:ctrlp_max_files = 5000

" Search buffer
map <Leader>pb :CtrlPBuffer<CR>
" }}}

" Git support (Fugitive) {{{
map <Leader>gb :Gblame<CR>
map <Leader>gs :Gstatus<CR>
map <Leader>gd :Gdiff<CR>
map <Leader>gl :Glog<CR>
map <Leader>gc :Gcommit<CR>
" }}}

" Filesystem navigation {{{
" (Re)open NERDTree or close it
map <Leader>n :NERDTreeToggle<CR>
" }}}
