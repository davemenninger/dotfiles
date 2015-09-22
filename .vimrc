filetype off
set nocompatible
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ['perl', 'podchecker']
execute pathogen#infect()
syntax on
set background=dark
filetype plugin indent on
au BufRead,BufNewFile *.md set filetype=markdown
set shell=bash
set modelines=0
set diffopt=filler,vertical
set backspace=indent,eol,start
set viminfo='25,\"50,n~/.viminfo
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
