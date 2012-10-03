set so=7 "display some rows below the cursor when scrolling

set nobackup
set nowb
set noswapfile

set expandtab
set shiftwidth=4
set tabstop=4
set smarttab
set ai "Auto indent
set si "Smart indet
set wrap "Wrap lines

set incsearch "Make search act like search in modern browsers

set showmatch "Show matching brackets when text indicator is over them

set ruler "Always show current position

set nocompatible
filetype plugin on

" Remove menu bar from gvim
set guioptions-=m

" Remove toolbar from gvim
set guioptions-=T

" Show line numbers
set number

" turn syntax highlighting on
set t_Co=256
syntax on
colorscheme wombat256mod
