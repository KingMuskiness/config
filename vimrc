" Disable vi compatibilty
set nocompatible

" Filetype Options
filetype on
filetype plugin on
filetype indent on
syntax on

set encoding=utf-8
set number relativenumber

" Spacing
set shiftwidth=6
set tabstop=6
set expandtab
set autoindent

set nobackup
set scrolloff=10

set nowrap

"Search
set incsearch
set ignorecase
set showcmd
set showmode
set showmatch
set hlsearch
set history=1000

"Backup
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

"Wildmenu
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

"Statusbar
set statusline=
set statusline+=\ %F\ %M\ %Y\ %R
set statusline+=%=
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
set laststatus=2

