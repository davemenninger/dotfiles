filetype off
execute pathogen#infect()
syntax on
filetype plugin indent on
au BufRead,BufNewFile *.md set filetype=markdown
set shell=bash
set nocompatible
set modelines=0
set diffopt=filler,vertical
