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

autocmd FileType python setlocal shiftwidth=4 softtabstop=4 tabstop=4

set incsearch "Make search act like search in modern browsers

set showmatch "Show matching brackets when text indicator is over them

set ruler "Always show current position

set nocompatible
filetype plugin on

" Remove menu bar from gvim
set guioptions-=m

" Remove toolbar from gvim
set guioptions-=T

" Turn syntax highlighting on
syntax on

" Line numbers
set number

colorscheme kalisi
set background=dark
set t_Co=256
let g:airline_theme='kalisi'

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

" save using sudo
cmap w!! w !sudo tee % >/dev/null

" treat ROS launch files as xml
cmap w!! w !sudo tee % >/dev/null
au BufNewFile,BufRead *.launch setfiletype xml
cmap w!! w !sudo tee % >/dev/null

"""""""""""""
" NERDTree
""""""""""""""

" Ctrl-n Toggles NERDTree
map <C-n> :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<cr>
let g:NERDTreeWinSize = 60
let NERDTreeIgnore = ['\.pyc$']

"""""""""""""
" Tab navigation shortcuts
""""""""""""""
nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

""""""""""""
" CtrlP for finding files.
""""""""""""

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = ''
let g:ctrlp_custom_ignore = 'target' " ignore rust build directory

""""""""""""
" Line width helpers
""""""""""""

"highlight OverLength ctermbg=red ctermfg=DarkBlue guibg=#FFD9D9
"match OverLength /\%80v.\+/

set textwidth=100

""""""""""""
" Rust
""""""""""""

filetype on
au BufNewFile,BufRead *.rs set filetype=rust

""""""""""""
" ROS
""""""""""""

set makeprg=catkin\ build\ -w\ ..\ --cmake-args\ -DCMAKE_EXPORT_COMPILE_COMMANDS=1


""""""""""""
" Clang-Format
""""""""""""

map <C-K> :pyf /usr/share/clang/clang-format-3.8/clang-format.py<cr>
imap <C-K> <c-o>:pyf /usr/share/clang/clang-format-3.8/clang-format.py<cr>


""""""""""""
" Pathogen
""""""""""""
execute pathogen#infect()
call pathogen#helptags()

