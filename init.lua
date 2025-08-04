local vim = vim

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
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

-- set foldnestmax=10
--- vim.api.nvim_set_option("clipboard","unnamed")
--- vim.bo.swapfile = false
--- vim.o.backup = false
--- vim.o.completeopt='menuone,noinsert,noselect'
--- vim.o.undodir = vim.fn.stdpath('config') .. '/undodir'
--- vim.o.undofile = true
vim.opt.autoindent = true -- automatically set indent of new line
vim.opt.background = "dark"
vim.opt.colorcolumn = "80"
vim.opt.cursorcolumn = true
vim.opt.cursorline = true
vim.opt.errorbells = false
vim.opt.expandtab = true
vim.opt.foldenable = true
vim.opt.foldmethod = "indent"
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.linebreak = true -- set soft wrapping
vim.opt.list = true
vim.opt.listchars = { tab = "▸ ", trail = "·" }
vim.opt.mouse = ""
vim.opt.number = true -- show line numbers
vim.opt.shiftwidth = 2
vim.opt.showbreak = "↪"
vim.opt.showmode = false
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.syntax = "on"
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
    --- Colors
    "bluz71/vim-nightfly-colors",
    "cpea2506/one_monokai.nvim",
    "folke/tokyonight.nvim",
    "joshdick/onedark.vim",
    "judaew/ronny.nvim",
    "morhetz/gruvbox",
    "nxvu699134/vn-night.nvim",
    "olimorris/onedarkpro.nvim",
    "oxfist/night-owl.nvim",
    "ray-x/aurora",
    "ray-x/starry.nvim",
    "rebelot/kanagawa.nvim",
    "Rigellute/shades-of-purple.vim",
    "sekke276/dark_flat.nvim",
    "Th3Whit3Wolf/onebuddy",
    "Th3Whit3Wolf/space-nvim",
    "zootedb0t/citruszest.nvim",
    { "catppuccin/nvim", name = "catppuccin" },
    { "dracula/vim",     name = "dracula" },
    { "Everblush/nvim",  name = "everblush" },
    {
      "rockyzhang24/arctic.nvim",
      dependencies = { "rktjmp/lush.nvim" }
    },

    --- General
    "airblade/vim-gitgutter",
    "hiphish/rainbow-delimiters.nvim",
    "jeetsukumaran/vim-buffergator",
    "nvim-tree/nvim-web-devicons",
    "nvim-treesitter/nvim-treesitter",
    "tpope/vim-fugitive",
    "vimwiki/vimwiki",
    {
      "nvim-lualine/lualine.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" }
    },
    {
      "mason-org/mason.nvim",
      config = function()
        require("mason").setup()
      end,
    },
    {
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
      "nvim-telescope/telescope.nvim",
      tag = "0.1.4",
      dependencies = { "nvim-lua/plenary.nvim" }
    },

    --- Maybes
    -- "folke/trouble.nvim",
    -- "folke/which-key.nvim",
    -- "kylechui/nvim-surround",
    -- "lewis6991/satellite.nvim",
    -- "lukas-reineke/indent-blankline.nvim",
    -- "mason-org/mason-lspconfig.nvim",
    -- "mfussenegger/nvim-lint",
    -- "mhinz/vim-signify",
    -- "neovim/nvim-lspconfig",
    -- "ryanoasis/vim-devicons"
    -- "saghen/blink.cmp",
    -- "smjonas/inc-rename.nvim",
    -- "tpope/vim-sleuth"
    -- "vim-scripts/vim-svngutter", -- doesn't work on windows
    -- "vim-test/vim-test"
  }, -- end of spec

  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "tokyonight" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

-- set colors
vim.cmd("colorscheme tokyonight")

-- vim.cmd("let g:signify_skip = { 'vcs': { 'allow': ['svn'] } }")
-- vim.cmd("set shell=/bin/bash")

require("lualine").setup({ options = { theme = "auto" } })
-- require("satellite").setup()
require("starry").setup()
require("telescope").setup()
require("todo-comments").setup()

require "nvim-treesitter.configs".setup {
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

-- TODO: don't remember what this does
vim.diagnostic.config({ virtual_text = true })

-- move across wrapped lines
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- use space to toggle fold under the cursor
vim.keymap.set("n", "<space>", "za")

-- Stop highlighting on Enter
vim.keymap.set("n", "<CR>", ":noh<CR>")

-- disable arrow keys
vim.keymap.set("n", "<up>", "<nop>")
vim.keymap.set("n", "<down>", "<nop>")
vim.keymap.set("n", "<left>", "<nop>")
vim.keymap.set("n", "<right>", "<nop>")
vim.keymap.set("i", "<up>", "<nop>")
vim.keymap.set("i", "<down>", "<nop>")
vim.keymap.set("i", "<left>", "<nop>")
vim.keymap.set("i", "<right>", "<nop>")

-- telescope shortcuts
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<c-p>", builtin.find_files, {})
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- if we're in a vimwiki folder, treat .md as filetype vimwiki
vim.g.vimwiki_list = { path = { "*/vimwiki/" }, syntax = { "markdown" }, ext = { "md" } }

-- don't fold the Lazy window itself
vim.api.nvim_create_autocmd("FileType", { pattern = "lazy_backdrop", command = [[setlocal nofoldenable]] })

-- Disable folding in Telescope's result window.
vim.api.nvim_create_autocmd("FileType", { pattern = "TelescopeResults", command = [[setlocal nofoldenable]] })

-- treat .razor as filetype cs
vim.api.nvim_create_autocmd(
  {
    "BufNewFile",
    "BufRead",
  },
  {
    pattern = "*.razor",
    callback = function()
      local buf = vim.api.nvim_get_current_buf()
      vim.api.nvim_buf_set_option(buf, "filetype", "cs")
    end
  }
)

-- autoformat pre-write
vim.api.nvim_create_autocmd(
  { "BufWritePre" },
  {
    callback = function()
      vim.lsp.buf.format()
    end
  }
)

-- bind rename to rn
vim.keymap.set("n", "<leader>rn", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })
