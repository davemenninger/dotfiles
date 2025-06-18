-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = "\\"

-- don't fold the Lazy window itself
vim.api.nvim_create_autocmd("FileType", { pattern = "lazy_backdrop", command = [[setlocal nofoldenable]] })

-- set foldnestmax=10
--- vim.api.nvim_set_option("clipboard","unnamed")
--- vim.bo.swapfile = false
--- vim.o.backup = false
--- vim.o.completeopt='menuone,noinsert,noselect'
--- vim.o.undodir = vim.fn.stdpath('config') .. '/undodir'
--- vim.o.undofile = true
vim.opt.autoindent = true -- automatically set indent of new line
vim.opt.background = 'dark'
vim.opt.colorcolumn = '80'
vim.opt.cursorcolumn = true
vim.opt.cursorline = true
vim.opt.errorbells = false
vim.opt.expandtab = true
vim.opt.foldenable = true
vim.opt.foldmethod = 'indent'
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.linebreak = true -- set soft wrapping
vim.opt.list = true
vim.opt.listchars = { tab = '▸ ', trail = '·' }
vim.opt.mouse = ""
vim.opt.number = true -- show line numbers
vim.opt.shiftwidth = 2
vim.opt.showbreak = '↪'
vim.opt.showmode = false
vim.opt.signcolumn = 'yes'
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.syntax = 'on'
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.title = true
vim.opt.ttyfast = true -- faster redrawing
vim.opt.wildmenu = true
vim.opt.wrap = true
vim.opt.wrapmargin = 8
vim.opt.wrapscan = true

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- add your plugins here

    --- Colors
    '2nthony/vitesse.nvim',
    'altercation/vim-colors-solarized',
    'bitfield/vim-gitgo',
    'bkegley/gloombuddy',
    'bluz71/vim-nightfly-colors',
    'cpea2506/one_monokai.nvim',
    'folke/tokyonight.nvim',
    'joshdick/onedark.vim',
    'judaew/ronny.nvim',
    'marko-cerovac/material.nvim',
    'maxmx03/FluoroMachine.nvim',
    'mhartington/oceanic-next',
    'Mofiqul/adwaita.nvim',
    'morhetz/gruvbox',
    'nanotech/jellybeans.vim',
    'navarasu/onedark.nvim',
    'neanias/everforest-nvim',
    'NTBBloodbath/doom-one.nvim',
    'nxvu699134/vn-night.nvim',
    'nyngwang/nvimgelion',
    'ofirgall/ofirkai.nvim',
    'olimorris/onedarkpro.nvim',
    'oxfist/night-owl.nvim',
    'pineapplegiant/spaceduck',
    'polirritmico/monokai-nightasty.nvim',
    'ray-x/aurora',
    'ray-x/starry.nvim',
    'rebelot/kanagawa.nvim',
    'Rigellute/shades-of-purple.vim',
    'sainnhe/sonokai',
    'savq/melange-nvim',
    'sekke276/dark_flat.nvim',
    'srcery-colors/srcery-vim',
    'talha-akram/noctis.nvim',
    'Th3Whit3Wolf/onebuddy',
    'Th3Whit3Wolf/space-nvim',
    'theacodes/witchhazel',
    'titanzero/zephyrium',
    'tomasr/molokai',
    'yonlu/omni.vim',
    'zootedb0t/citruszest.nvim',
    { 'catppuccin/nvim', name = 'catppuccin' },
    { 'dracula/vim', name = 'dracula' },
    { 'Everblush/nvim', name = 'everblush' },
    {
      'glepnir/zephyr-nvim',
      dependencies = { 'nvim-treesitter/nvim-treesitter', lazy = true },
    },
    {
      'rockyzhang24/arctic.nvim',
      dependencies = { 'rktjmp/lush.nvim' }
    },

    --- General
    'airblade/vim-gitgutter',
    'bling/vim-airline',
    'jeetsukumaran/vim-buffergator',
    'hiphish/rainbow-delimiters.nvim',
    'nvim-treesitter/nvim-treesitter',
    'vimwiki/vimwiki',
    {'mason-org/mason.nvim',
      config = function()
        require("mason").setup()
      end,
    },
    {
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
      'nvim-telescope/telescope.nvim', tag = '0.1.4',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },

    --- General
    -- use 'ctrlpvim/ctrlp.vim'
    -- use 'ryanoasis/vim-devicons'
    -- https://github.com/nvim-lualine/lualine.nvim
    -- use 'nvim-tree/nvim-web-devicons'
    -- use 'tpope/vim-fugitive'
    -- use 'tpope/vim-sleuth'
    -- use 'tpope/vim-surround'
    -- use 'vim-test/vim-test'
  }, -- end of spec

  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "dracula" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

-- don't remember what this is for
local vim = vim

require('starry').setup()
require("telescope").setup()
require("todo-comments").setup()

require 'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the listed parsers should always be installed)
  ensure_installed = { "go", "c", "c_sharp", "lua", "vim", "vimdoc", "query", "python", "javascript" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = false,

  highlight = {
    enable = true,
  },
}

vim.diagnostic.config({
  virtual_text = true
})

vim.cmd("colorscheme dracula")
vim.cmd [[
  let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': 'md'}]

  autocmd BufNewFile,BufRead *.razor set filetype=cs
  nnoremap <space> za

  " Stop highlighting on Enter
  map <CR> :noh<CR>

  " move across a wrapped line
  nnoremap j gj
  nnoremap k gk
]]

vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
-- vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

-- Disable folding in Telescope's result window.
vim.api.nvim_create_autocmd("FileType", { pattern = "TelescopeResults", command = [[setlocal nofoldenable]] })

-- disable arrow keys
vim.keymap.set('n', '<up>', '<nop>')
vim.keymap.set('n', '<down>', '<nop>')
vim.keymap.set('n', '<left>', '<nop>')
vim.keymap.set('n', '<right>', '<nop>')
vim.keymap.set('i', '<up>', '<nop>')
vim.keymap.set('i', '<down>', '<nop>')
vim.keymap.set('i', '<left>', '<nop>')
vim.keymap.set('i', '<right>', '<nop>')
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<c-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.g['airline_theme'] = 'dracula'
