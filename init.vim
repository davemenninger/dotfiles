call plug#begin('~/.config/nvim/plugged')

" Plugins go here.  Example:
" Plug 'foo/bar'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  let g:deoplete#enable_at_startup = 1
  " use tab for completion
  " inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Polyglot loads language support on demand!
Plug 'sheerun/vim-polyglot'
" theme
Plug 'tomasr/molokai'

Plug 'neomake/neomake'
  " Run Neomake when I save any buffer
  augroup localneomake
    autocmd! BufWritePost * Neomake
  augroup end
  " Don't tell me to use smartqutoes in markdown ok?
  " let g:neomake_markdown_enabled_markers = [ ]
  let g:neomake_open_list = 2

  let g:neomake_elixir_enabled_makers = ['mix', 'credo' ] ", 'dogma']

Plug 'slashmili/alchemist.vim'

Plug 'kien/ctrlp.vim'

Plug 'jeetsukumaran/vim-buffergator'

call plug#end()

" When writing a buffer (no delay).
call neomake#configure#automake('w')

set mouse =""


set background=dark
syntax enable
colorscheme molokai

" Sane tabs
" - Two spaces wide
set tabstop=2
set softtabstop=2
" - Expand them all
set expandtab
" - Indent by 2 spaces by default
set shiftwidth=2

" set number " line numbering

" Highlight search results
set hlsearch
" Incremental search, search as you type
set incsearch
" Ignore case when searching
set ignorecase
" Ignore case when searching lowercase
set smartcase
" Stop highlighting on Enter
map <CR> :noh<CR>


" Set the title of the iterm tab
set title
