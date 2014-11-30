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

" turn syntax highlighting on
set t_Co=256
syntax on
colorscheme wombat256mod

" Make backspaces actually work:
"   http://vim.wikia.com/wiki/Backspace_and_delete_problems
set backspace=indent,eol,start

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
"nmap <silent> ,/ :nohlsearch<CR>

" save using sudo
cmap w!! w !sudo tee % >/dev/null

" treat ROS launch files as xml
cmap w!! w !sudo tee % >/dev/null
au BufNewFile,BufRead *.launch setfiletype xml
cmap w!! w !sudo tee % >/dev/null

"""""""""""""
" NERDTree
"""""""""""""

" Open NERDTree when vim starts up if no files specified at command line
autocmd vimenter * if !argc() | NERDTree | endif

" Ctrl-n Toggles NERDTree
map <C-n> :NERDTreeToggle<CR>

" Close vim if NERDTree is only remaining pane
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

map <leader>r :NERDTreeFind<cr>

""""""""""""
" C++
""""""""""""

autocmd FileType c,cpp,h,hpp,hxx,py highlight OverLength ctermbg=DarkBlue ctermfg=white guibg=#FFD9D9
autocmd FileType c,cpp,h,hpp,hxx,py match OverLength /\%121v.\+/

""""""""""""
" ROS
""""""""""""

set makeprg=catkin_make\ -C\ ..

""""""""""""
" YCM
""""""""""""

nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
let g:ycm_confirm_extra_conf=0

""""""""""""
" Pathogen
""""""""""""

call pathogen#infect()
cmap w!! w !sudo tee % >/dev/null
call pathogen#helptags()
