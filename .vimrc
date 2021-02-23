" show line numbers
set number

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

" keybindings
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>
nnoremap j k
nnoremap k j
inoremap <Esc> <nop>
inoremap jj <Esc>

" turn on syntax highlighting
syntax on

" Fix 200/201 paste bug triggered by jj/esc inoremap
set t_BE=
