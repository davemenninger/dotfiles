filetype off
execute pathogen#infect()
syntax on
set background=dark
filetype plugin indent on
au BufRead,BufNewFile *.md set filetype=markdown
set shell=bash
set nocompatible
set modelines=0
set diffopt=filler,vertical
set backspace=indent,eol,start
