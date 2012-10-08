let mapleader = ","

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

" hide buffers; don't close them. this way we don't have to save
" a buffer before switching to another one.
set hidden

" show tabs, except in xml files
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
autocmd filetype html,xml set listchars-=tab:>.

" enables a paste mode in which autoindent is turned off
set pastetoggle=<F2>

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" use ,/ combo to clear the highlighted search
nmap <silent> ,/ :nohlsearch<CR>

" save using sudo
cmap w!! w !sudo tee % >/dev/null

" treat ROS launch files as xml
cmap w!! w !sudo tee % >/dev/null
au BufNewFile,BufRead *.launch setfiletype xml
cmap w!! w !sudo tee % >/dev/null

call pathogen#infect()
cmap w!! w !sudo tee % >/dev/null
call pathogen#helptags()

