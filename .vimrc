set shell=bash
execute pathogen#infect()
syntax on
filetype plugin indent on
au BufRead,BufNewFile *.md set filetype=markdown
