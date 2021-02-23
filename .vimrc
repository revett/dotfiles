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
set smartcase

" highlight search results (after pressing Enter)
set hlsearch

" highlight all pattern matches WHILE typing the pattern
set incsearch

" disable last search highlight by pressing return
nnoremap <CR> :noh<CR><CR>

" show the mathing brackets
set showmatch

" leader key
let mapleader = "\<Space>"

" keybindings
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

nnoremap <Space> <nop>
nnoremap <leader>j <C-w>k
nnoremap <leader>k <C-w>j
nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l
nnoremap <leader><leader> <C-w>w
nnoremap k jzz
nnoremap j kzz

inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>
inoremap <Esc> <nop>
inoremap jj <Esc>

" turn on syntax highlighting
syntax on

" Fix 200/201 paste bug triggered by jj/esc inoremap
set t_BE=

" plugins start
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" plugins end
call plug#end()

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
  \ quit | endif

" lines after cursor
set scrolloff=10

" vim-go configuration
let g:go_metalinter_autosave = 1
