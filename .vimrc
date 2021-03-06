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
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'L9'
"" Project tree at side menu
Plugin 'scrooloose/nerdtree'
"" Syntax checker
Plugin 'scrooloose/syntastic'
"" plugin for ruby
Plugin 'vim-ruby/vim-ruby'
"" haml syntax 
Plugin 'tpope/vim-haml'
"" shorthands for tags
Plugin 'tpope/vim-ragtag'
"" jade syntax
Plugin 'digitaltoad/vim-jade'
"" quotations marks
Plugin 'tpope/vim-surround'
"" autoclose {[()]} itp.
Plugin 'vim-scripts/AutoClose'
"" status bar
Plugin 'itchyny/lightline.vim'
"" lots of colorschemes
Plugin 'flazz/vim-colorschemes'
"" i use that for finding files mapped at F4
Plugin 'kien/ctrlp.vim'
"" open current file inside terminal or file manager
Plugin 'justinmk/vim-gtfo'
"" send file or chunk of code to gist
Plugin 'mattn/gist-vim'
"" for git
Plugin 'tpope/vim-fugitive'
"" multiple coursor :D
Plugin 'terryma/vim-multiple-cursors'
"" only for tests, display color table
Plugin 'xterm-color-table.vim'
"" shows git diff in gutter
Plugin 'airblade/vim-gitgutter'
"" makes work with node little more comfortable
Plugin 'moll/vim-node'
"" node completitor
Plugin 'myhere/vim-nodejs-complete'
"" c-tags
Plugin 'vim-scripts/taglist.vim'
"" support for editing JS
Plugin 'marijnh/tern_for_vim'
"" go support for vim
Plugin 'fatih/vim-go'

call vundle#end()

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

let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
map <F5> :TlistToggle<cr>

" |-----------------------------------------------------|
" |                       Look                          |
" |-----------------------------------------------------|
"  

"czcionka
set guifont=Monospace\ 9

set t_Co=256
"
" use dark background
set background=dark

" color theme
colorscheme lucius

"" status bar settings
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }
set laststatus=2


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
