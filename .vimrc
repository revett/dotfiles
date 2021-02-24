" show line numbers
set number

" natural splitting
set splitbelow
set splitright

" set ruler (80 chars)
set colorcolumn=80
highlight ColorColumn ctermbg=236

" replace tabs with spaces
set expandtab

" 1 tab = 2 spaces
set tabstop=2 shiftwidth=2

" when deleting whitespace at the beginning of a line, delete
" 1 tab worth of spaces (for us this is 2 spaces)
set smarttab

" when creating a new line, copy the indentation from the line above
set autoindent

" Ignore case when searching
set ignorecase

" leader key
let mapleader = "§"

" keybindings
nnoremap <leader><up> <C-w>k
nnoremap <leader><down> <C-w>j
nnoremap <leader><left> <C-w>h
nnoremap <leader><right> <C-w>l
nnoremap <leader><leader> <C-w>w

tnoremap <leader><up> <C-w>k
tnoremap <leader><down> <C-w>j
tnoremap <leader><left> <C-w>h
tnoremap <leader><right> <C-w>l
tnoremap <leader><leader> <C-w>w

inoremap <Esc> <nop>
inoremap <leader> <Esc>

" refresh NERDTree keybinding
nmap <leader>r :NERDTreeRefreshRoot

" Fix 200/201 paste bug triggered by jj/esc inoremap
set t_BE=

" plugins start
call plug#begin('~/.vim/plugged')

Plug 'ap/vim-css-color'
Plug 'bronson/vim-trailing-whitespace'
Plug 'dracula/vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'

" plugins end
call plug#end()

" Start NERDTree and open cheat sheet under in different split
autocmd VimEnter * NERDTree | 30split ~/.dotfiles/vim-cheat.md | set syntax=markdown | wincmd l

" Open terminal to right in vertical split on startup
autocmd VimEnter * vertical terminal ++kill=hup
autocmd VimEnter * vertical resize 100
autocmd VimEnter * wincmd h

" show hidden files in NERDTree
let NERDTreeShowHidden=1

" lines after cursor
set scrolloff=20

" vim-go configuration
filetype plugin indent on
let g:go_metalinter_autosave = 1

" fix issue with grey background - https://github.com/dracula/vim/issues/96
" set termguicolors
let g:dracula_colorterm = 0
let g:dracula_italic = 0

" set up theme
syntax on
colorscheme dracula

