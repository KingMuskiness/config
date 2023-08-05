" Sets tab size to 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Converts tabs to spaces
set expandtab
set autoindent
set fileformat=unix

" Basics
nnoremap c "_c
set nocompatible
syntax on
set encoding=utf-8
set number relativenumber

" Disable automatic commenting on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Fix vim split
set splitbelow splitright
