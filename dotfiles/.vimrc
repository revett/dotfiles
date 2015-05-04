set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

call vundle#end()
filetype plugin indent on

syntax on
set runtimepath^=~/.vim/bundle/ctrlp.vim
set smarttab
set expandtab
set ruler

set colorcolumn=80

set number

set hlsearch
set incsearch
:nnoremap § :nohlsearch<cr>

set noswapfile

set tabstop=2
set shiftwidth=2
set softtabstop=2

let @p = "\n" . 'require "pry"; binding.pry'

execute pathogen#infect()

map <leader>' :NERDTreeToggle<cr>
