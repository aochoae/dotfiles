" Encoding to UTF-8
scriptencoding utf-8

" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" Don't add empty newlines at the end of files
set noeol

" Enable mouse in all modes
set mouse=a

" Enable syntax coloring
syntax on

" Enable automatic indentation
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4

filetype indent plugin on

if has("autocmd")
  autocmd FileType ruby,css,html,tex set ts=2 et sw=2 sts=2
endif

" Column limit
set textwidth=80

" Show line numbers
set number

" Searching
set incsearch
set ignorecase
set smartcase
set hlsearch

" LaTeX
let g:tex_flavor='latex'

" Color
colorscheme lucario

" Turn backup off
set nobackup
set nowb
set noswapfile
