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

" Turn backup off
set nobackup
set nowb
set noswapfile
" }}}

" Syntax highlighting {{{
set synmaxcol=160 " Turn of syntax highlighting for long lines

" Highlight the background in a subtle red for text that goes over the
" 80 column limit.
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

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

" Silver Searcher {{{
"let g:ackprg = 'ag --vimgrep'

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" }}}

" File history {{{
" Jump to the last known cursor position
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif
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
call plug#begin()

" Colorschemes {{{
Plug 'artanikin/vim-synthwave84'
" }}}

" CSS {{{
" Preview colours in source code while editing
Plug 'ap/vim-css-color'
" }}}

" Git {{{
" Show which lines have been added, modified, or removed
Plug 'airblade/vim-gitgutter'
" The best Git wrapper of all time :-)
Plug 'tpope/vim-fugitive'
" }}}
"
" IDE {{{
" Enable opening a file in a given line (vim index.html:20)
Plug 'bogado/file-line'

" Asynchronous Lint Engine
Plug 'dense-analysis/ale'

" Insert or delete brackets, parens, quotes in pair
Plug 'jiangmiao/auto-pairs'

" Fuzzy file, buffer, mru, tag, etc finder
Plug 'kien/ctrlp.vim'

" Auto-update ctags files
Plug 'ludovicchabant/vim-gutentags'

" NERDTree is a file system explorer for the Vim editor.
" Users can visually browse complex directory hierarchies, quickly open files
" for reading or editing, and perform basic file system operations.
Plug 'scrooloose/nerdtree'

" Comment stuff out
Plug 'tpope/vim-commentary'

" Lean & mean status/tabline for Vim
Plug 'vim-airline/vim-airline'
" }}}

" Perl {{{
" Enable support for Perl 5 and Perl 6 in Vim
Plug 'vim-perl/vim-perl'
" }}}

" Python {{{
Plug 'nvie/vim-flake8'
Plug 'vim-scripts/indentpython.vim'
Plug 'vim-syntastic/syntastic'
" }}}

" Rails {{{
" Turns Vim into a Ruby on Rails editor
Plug 'tpope/vim-rails'
" Provides easy navigation and syntax highlighting in ruby
Plug 'vim-ruby/vim-ruby'
" }}}

" Ruby {{{
" Help to end certain Ruby structures automatically
Plug 'tpope/vim-endwise'
" }}}

" Tmux {{{
" Seamless navigation between tmux panes and Vim splits
Plug 'christoomey/vim-tmux-navigator'
" A SLIME inspired tmux integration plugin
Plug 'epeli/slimux'
" }}}

call plug#end()
" }}}

" Ctags {{{
" Use Ctrl+b for jumping to source code
noremap <c-b> g<c-]>
" }}}

" Python {{{
let python_highlight_all=1
" }}}

" Ruby {{{
" Ctrl+l to write '=>'
imap <c-l> <space>=><space>

" Ctrl+d to jump to the next line and write 'byebug'
noremap <c-d> obyebug<ESC>:w<CR>
" }}}

" Slimux {{{
" Send current line to the configured pane
map <leader>l :SlimuxREPLSendLine<CR>
" Send last visually selected text to the configured pane
map <leader>e :SlimuxREPLSendSelection<CR>
" Test current line
map <leader>t :let @t=expand("%:p").':'.line(".")<CR>:SlimuxShellRun clear;be rspec <c-r>t<CR>
" Run all specs in the current file
map <leader>a :let @t=expand("%:p")<CR>:SlimuxShellRun clear; be rspec <c-r>t<CR>
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

" Nerd Tree {{{
let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize=35

" (Re)open NERDTree or close it
map <Leader>n :NERDTreeToggle<CR>

map <leader>nf :NERDTreeFind<cr>
" }}}

" Colors {{{
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set background=dark
colorscheme synthwave84
" }}}
