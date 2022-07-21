call plug#begin('~/.config/nvim/plugged')

" Polyglot loads language support on demand!
Plug 'sheerun/vim-polyglot'

Plug 'elixir-editors/vim-elixir'

" theme
Plug 'tomasr/molokai'
" Plug 'joshdick/onedark.vim'
Plug 'navarasu/onedark.nvim'


Plug 'ctrlpvim/ctrlp.vim'

Plug 'luochen1990/rainbow'

Plug 'jeetsukumaran/vim-buffergator'

Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-fugitive'

Plug 'bling/vim-airline'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

let g:coc_global_extensions = ['coc-elixir', 'coc-diagnostic']

let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

command MixFormat silent %!mix format -

set mouse =""
set cursorline
set cursorcolumn
set colorcolumn=80

" folding
set foldenable
"set foldnestmax=10
set foldmethod=indent
nnoremap <space> za

set background=dark
syntax enable
" colorscheme molokai

let g:onedark_config = { 'style': 'deep' }
colorscheme onedark

" Sane tabs
" - Two spaces wide
set tabstop=2
set softtabstop=2
" - Expand them all
set expandtab
" - Indent by 2 spaces by default
set shiftwidth=2

set diffopt=filler,vertical
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

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" show tabs and trailing
if has('multi_byte')
    scriptencoding utf-8
    set listchars=tab:▸\ ,trail:·
    set list
    if !has("win32")
        set showbreak=↪           " The character to put to show a line has been wrapped
    end
  endif

" Set the title of the iterm tab
set title

" edit my .vimrc
nnoremap <leader>ev :vsplit $XDG_CONFIG_HOME/nvim/init.vim<cr>
nnoremap <leader>sv :source $XDG_CONFIG_HOME/nvim/init.vim<cr>

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

" add spellchecking in commits
augroup commits
  autocmd!

  if has('spell')
    au BufNewFile,BufRead COMMIT_EDITMSG setlocal spell
  endif
  " au BufNewFile,BufRead COMMIT_EDITMSG call feedkeys('ggi', 't')
augroup END

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nnoremap <silent> <leader>h :call CocActionAsync('doHover')<cr>

if !exists("g:DaveJournalStartCommand")
  let g:dave_journal_start_command = system('which dave_journal_start.bash')
  let g:dave_journal_start_command = expand('%:p:h') . '/dave_journal_start.bash'
endif

function! DaveJournalStart()
  " this is a fish function
  :read !journal_yaml
  " this is a fish function
  :read !journal_recur
endfunction

command! -nargs=* JournalStart call DaveJournalStart()
