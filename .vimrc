" -----------------------------------------------------
"  *****************************************************
"   My vimrc - by stchvtz
"  *****************************************************
" -----------------------------------------------------
"


" |-----------------------------------------------------|
" |                     Global                          |
" |-----------------------------------------------------|
"  


runtime! debian.vim

" gvim more like vim, not vi ;)
set nocompatible


"|
"|                      Vundle
"|
"
"
filetype off

" set rtp+=~/usr/share/vim/bundle/vundle/
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'L9'
Bundle 'vim-scripts/FuzzyFinder'
Bundle 'tpope/vim-rails.git'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-ragtag'
Bundle 'digitaltoad/vim-jade'
Bundle 'wavded/vim-stylus'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/AutoClose'
Bundle 'maciakl/vim-neatstatus'
Bundle 'flazz/vim-colorschemes'
Bundle 'kien/ctrlp.vim'
Bundle 'justinmk/vim-gtfo'
Bundle 'mattn/gist-vim'
Bundle 'tpope/vim-fugitive'
Bundle 'terryma/vim-multiple-cursors'

" Wykrywanie typu pliku i wlaczenie domyslnych ustawien jak długosc linii, wciecia
" Rowniez ladownie plikow wciec aby robic automatyczne wciecia zaleznie od jezyka programowania
filetype plugin indent on

" kodowanie UTF-8
set encoding=utf-8

" using syntax
syntax enable

" enable syntax highlighting by default.
if has("syntax")
  syntax on
endif


" Enable filetype plugins
filetype plugin on
filetype indent on

" Show matching brackets.
set showmatch		

" Do smart case matching
set smartcase	

" Incremental search
set incsearch	

" Hide buffers when they are abandoned
set hidden    

" Enable mouse usage (all modes)
set mouse=a	

" Mysz zachowuje się jak w windowsie
:behave mswin 

"set linebreak
set wildmenu

" Sets how many lines of history VIM has to remember
set history=500

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
set nowrap

" mapping leader key - coś nie śmiga :D
""let mapleader = “,”


set backspace=2


" |-----------------------------------------------------|
" |                       Look                          |
" |-----------------------------------------------------|
"  

"czcionka
set guifont=Monospace\ 9

set t_Co=256

" color theme
colorscheme lucius

" use dark background
set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    " set guioptions-=m
    " set guioptions-=r
    set lines=50 columns=190 
endif

" Show (partial) command in status line.
set showcmd	

" convert all typed tabs to spaces
set expandtab
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Height of the command bar
set cmdheight=1

" numerowanie lini
set number

" podświetlanie obecnej lini
set cul                                          
hi CursorLine term=none cterm=none ctermbg=8

" NERDTree at right side
" let g:NERDTreeWinPos = "right"


" |-----------------------------------------------------|
" |                     Behavior                        |
" |-----------------------------------------------------|
"  


" Go to last file(s) if invoked without arguments.
autocmd VimLeave * nested if (!isdirectory($HOME . "/.vim")) |
    \ call mkdir($HOME . "/.vim") |
    \ endif |
    \ execute "mksession! " . $HOME . "/.vim/Session.vim"

autocmd VimEnter * nested if argc() == 0 && filereadable($HOME . "/.vim/Session.vim") |
    \ execute "source " . $HOME . "/.vim/Session.vim"

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif


" |-----------------------------------------------------|
" |                     Shortcuts                       |
" |-----------------------------------------------------|
"

" Toggle the file browser
map <F2> <Esc>:NERDTreeToggle<CR>

" FuzzyFinder Buffer map
map <F3> <Esc>:FufBuffer<CR>

" ctrlP finding file
map <F4> <Esc>:CtrlPMixed<CR>