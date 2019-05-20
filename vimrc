" Encoding to UTF-8
scriptencoding utf-8

" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" Don't add empty newlines at the end of files
set noeol

" Enable mouse in all modes
set mouse=a

" Leader
let mapleader = ","

" Turn on the Wild menu
set wildmenu

" Show the filename in the titlebar
set title

" Show (partial) command in the last line of the screen
set showcmd

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

" Soft wrapping text
set wrap linebreak nolist

" Show line numbers
set number

" Searching
set incsearch
set ignorecase
set smartcase
set hlsearch

" Regular expressions turn magic on
set magic

" Don't redraw while executing macros
set lazyredraw 

" Ring the bell (beep or screen flash) for error messages
set noerrorbells

" LaTeX
let g:tex_flavor='latex'

" Color
colorscheme lucario

" Turn backup off
set nobackup
set nowb
set noswapfile

" Taglist Plugin
nnoremap <silent> <F8> :TlistToggle<CR>
autocmd BufWritePost *.c,*.cc,*.cpp,*.h,*.hh :TlistUpdate
autocmd BufWritePost *.py :TlistUpdate
autocmd BufWritePost *.php :TlistUpdate
