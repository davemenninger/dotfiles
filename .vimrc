filetype off
set nocompatible

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ['perl', 'perlcritic', 'podchecker']
let g:syntastic_perl_lib_path = [ './lib', './lib/auto' ]
let g:syntastic_perl_perlcritic_thres = 1

let g:airline_powerline_fonts = 1

execute pathogen#infect()

syntax on

set background=dark
colorscheme slate
silent! colorscheme gruvbox

filetype plugin indent on

au BufRead,BufNewFile *.md set filetype=markdown

set backup
set noswapfile

set shell=bash
set modelines=0
set diffopt=filler,vertical
set backspace=indent,eol,start

set tabstop=8 " make real tabs display as 8 spaces
set softtabstop=4 " make all new tabs 4 spaces
set shiftwidth=4 " how many spaces << and >> creates
set expandtab " all new tabs should use spaces

set splitbelow
set splitright

set ignorecase
set smartcase

set relativenumber
set cursorline
set wildmenu
set colorcolumn=80
highlight ColorColumn ctermbg=darkgrey guibg=darkgrey

" make arrows keys not work in order to learn hjkl movement
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
" move across a wrapped line
nnoremap j gj
nnoremap k gk

" don't need to hit shift
nnoremap ; :

" don't need to hunt for corner of keyboard
inoremap jk <ESC>

" edit my .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" folding
set foldenable
"set foldnestmax=10
set foldmethod=indent
nnoremap <space> za

set viminfo='25,\"50,n~/.viminfo
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" show tabs and trailing
if has('multi_byte')
    scriptencoding utf-8
    set listchars=tab:▸\ ,trail:·
    set list
endif

" F2 to trim trailing whitespace
" https://stackoverflow.com/questions/24148991/vim-is-inserting-q-when-i-hit-f2
map <Esc>OQ :%s/\s\+$//g
map <F2> :%s/\s\+$//g

let NERDSpaceDelims=1

autocmd VimEnter * RainbowParenthesesToggleAll

nnoremap <F5> :GundoToggle<CR>
