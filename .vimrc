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

" set leader key
let mapleader = "§"

" Fix 200/201 paste bug triggered by jj/esc inoremap
set t_BE=

" lines after cursor
set scrolloff=20

" set up theme
syntax on
