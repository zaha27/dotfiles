" Minimal vimrc, no plugins (tree view = built-in netrw)

set nocompatible
filetype plugin indent on
syntax on

" Absolute line numbers (not relative)
set number
set norelativenumber

" Sane defaults
set backspace=indent,eol,start
set encoding=utf-8
set ruler showcmd laststatus=2
set incsearch hlsearch ignorecase smartcase
set expandtab shiftwidth=4 tabstop=4 softtabstop=4 autoindent

" File tree on the left (netrw)
let g:netrw_banner = 0        " hide help banner
let g:netrw_liststyle = 3     " tree view
let g:netrw_browse_split = 4  " open files in the previous window
let g:netrw_altv = 1          " split to the right
let g:netrw_winsize = 20      " tree width: 20% of screen

" Toggle tree with Ctrl-n
nnoremap <silent> <C-n> :Lexplore<CR>

" Open tree automatically on start, focus stays on the file
augroup netrw_tree
  autocmd!
  autocmd VimEnter * if !&diff | Lexplore | wincmd p | endif
augroup END
