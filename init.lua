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

vim.g['rainbow_active'] = 1
vim.g['airline_theme'] = 'random'

local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn

-- ensure that packer is installed
local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  execute 'packadd packer.nvim'
end

vim.cmd('packadd packer.nvim')

local packer = require 'packer'
local util = require 'packer.util'

packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})

vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
-- vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  --- Colors
  use '2nthony/vitesse.nvim'
  use 'Mofiqul/adwaita.nvim'
  use 'NTBBloodbath/doom-one.nvim'
  use 'Rigellute/shades-of-purple.vim'
  use 'Th3Whit3Wolf/onebuddy'
  use 'Th3Whit3Wolf/space-nvim'
  use 'altercation/vim-colors-solarized'
  use 'bitfield/vim-gitgo'
  use 'bkegley/gloombuddy'
  use 'bluz71/vim-nightfly-colors'
  use 'catppuccin/nvim'
  use 'cpea2506/one_monokai.nvim'
  use 'dracula/vim'
  use 'folke/tokyonight.nvim'
  use 'joshdick/onedark.vim'
  use 'judaew/ronny.nvim'
  use 'marko-cerovac/material.nvim'
  use 'maxmx03/FluoroMachine.nvim'
  use 'mhartington/oceanic-next'
  use 'morhetz/gruvbox'
  use 'nanotech/jellybeans.vim'
  use 'navarasu/onedark.nvim'
  use 'neanias/everforest-nvim'
  use 'nxvu699134/vn-night.nvim'
  use 'nyngwang/nvimgelion'
  use 'ofirgall/ofirkai.nvim'
  use 'olimorris/onedarkpro.nvim'
  use 'oxfist/night-owl.nvim'
  use 'pineapplegiant/spaceduck'
  use 'polirritmico/monokai-nightasty.nvim'
  use 'ray-x/aurora'
  use 'rebelot/kanagawa.nvim'
  use 'sainnhe/sonokai'
  use 'savq/melange-nvim'
  use 'sekke276/dark_flat.nvim'
  use 'srcery-colors/srcery-vim'
  use 'talha-akram/noctis.nvim'
  use 'theacodes/witchhazel'
  use 'titanzero/zephyrium'
  use 'tomasr/molokai'
  use 'yonlu/omni.vim'
  use 'zootedb0t/citruszest.nvim'
  use { 'Everblush/nvim', as = 'everblush' }
  use({ 'rose-pine/neovim', as = 'rose-pine' })
  use({
    'glepnir/zephyr-nvim',
    requires = { 'nvim-treesitter/nvim-treesitter', opt = true },
  })
  use {
    'rockyzhang24/arctic.nvim',
    requires = { 'rktjmp/lush.nvim' }
  }
  use { 'ray-x/starry.nvim', setup = function()
    vim.g.starry_italic_comments = true
  end }

  --- General
  -- use 'ctrlpvim/ctrlp.vim'
  -- use 'ryanoasis/vim-devicons'
  -- https://github.com/nvim-lualine/lualine.nvim
  use 'airblade/vim-gitgutter'
  use 'bling/vim-airline'
  use 'jeetsukumaran/vim-buffergator'
  use 'luochen1990/rainbow'
  use 'nvim-tree/nvim-web-devicons'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-sleuth'
  use 'tpope/vim-surround'
  use 'vim-test/vim-test'
  use {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  }

  use 'nvim-treesitter/nvim-treesitter'

  use {
    'folke/trouble.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      auto_open = true,                      -- automatically open the list when you have diagnostics
      auto_close = true,                     -- automatically close the list when you have no diagnostics
      auto_preview = true,                   -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
      action_keys = {                        -- key mappings for actions in the trouble list
        jump = { "<tab>", "<2-leftmouse>" }, -- jump to the diagnostic or open / close folds
        jump_close = { "<cr>", "o" },        -- jump to the diagnostic and close the list
      },
    },
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }

  use({
    'jose-elias-alvarez/null-ls.nvim',
    event = 'BufRead',
    requires = {
      { "nvim-lua/plenary.nvim" },
    },
    config = function()
      local nls = require('null-ls')

      local fmt = nls.builtins.formatting
      local dgn = nls.builtins.diagnostics

      -- Configuring null-ls
      nls.setup({
        debug = true,
        sources = {
          -- # FORMATTING #
          fmt.trim_whitespace.with({
            filetypes = { 'text', 'sh', 'zsh', 'toml', 'make', 'conf', 'tmux' },
          }),
          -- NOTE:
          -- 1. both needs to be enabled to so prettier can apply eslint fixes
          -- 2. prettierd should come first to prevent occassional race condition
          fmt.prettierd,
          fmt.eslint_d,
          fmt.rustfmt,
          fmt.stylua,
          fmt.goimports,
          fmt.shfmt.with({
            extra_args = { '-i', 4, '-ci', '-sr' },
          }),
          -- # DIAGNOSTICS #
          nls.builtins.diagnostics.golangci_lint,
          dgn.eslint_d,
          dgn.shellcheck,
          dgn.luacheck.with({
            extra_args = { '--globals', 'vim', '--std', 'luajit' },
          }),
        },
      })
    end,
  })
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'gopls',
  'elixirls',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  -- ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.on_attach(function(_, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

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
end)

-- local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")
local telescope = require("telescope")
local todo = require("todo-comments")

todo.setup()

telescope.setup {
  defaults = {
    mappings = {
      i = { ["<c-t>"] = trouble.open_with_trouble },
      n = { ["<c-t>"] = trouble.open_with_trouble },
    },
  },
}

lsp.setup()


require 'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "go", "c", "lua", "vim", "vimdoc", "query" },

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

vim.cmd("colorscheme starry")
vim.cmd [[
  nnoremap <space> za

  " Stop highlighting on Enter
  map <CR> :noh<CR>

  " move across a wrapped line
  nnoremap j gj
  nnoremap k gk
]]
