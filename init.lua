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
    -- "ryanoasis/vim-devicons"
    -- "tpope/vim-sleuth"
    -- "vim-test/vim-test"
    {
      "smjonas/inc-rename.nvim",
      opts = {}
    },
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
    {
      "saghen/blink.cmp",
      -- optional: provides snippets for the snippet source
      dependencies = { "rafamadriz/friendly-snippets" },

      -- use a release tag to download pre-built binaries
      version = "1.*",
      -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
      -- build = "cargo build --release",
      -- If you use nix, you can build from source using latest nightly rust with:
      -- build = "nix run .#build-plugin",

      ---@module "blink.cmp"
      ---@type blink.cmp.Config
      opts = {
        -- "default" (recommended) for mappings similar to built-in completions (C-y to accept)
        -- "super-tab" for mappings similar to vscode (tab to accept)
        -- "enter" for enter to accept
        -- "none" for no mappings
        --
        -- All presets have the following mappings:
        -- C-space: Open menu or open docs if already open
        -- C-n/C-p or Up/Down: Select next/previous item
        -- C-e: Hide menu
        -- C-k: Toggle signature help (if signature.enabled = true)
        --
        -- See :h blink-cmp-config-keymap for defining your own keymap
        keymap = { preset = "default" },

        appearance = {
          -- "mono" (default) for "Nerd Font Mono" or "normal" for "Nerd Font"
          -- Adjusts spacing to ensure icons are aligned
          nerd_font_variant = "mono"
        },

        -- (Default) Only show the documentation popup when manually triggered
        completion = { documentation = { auto_show = false } },

        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
          default = { "lsp", "path", "snippets", "buffer" },
        },

        -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
        -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
        -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
        --
        -- See the fuzzy documentation for more information
        fuzzy = { implementation = "prefer_rust_with_warning" }
      },
      opts_extend = { "sources.default" }
    },
    {
      "neovim/nvim-lspconfig",
      dependencies = { "saghen/blink.cmp" },

      -- example using `opts` for defining servers
      -- opts = {
      -- servers = {
      -- lua_ls = {}
      -- }
      -- },
      -- config = function(_, opts)
      -- local lspconfig = require("lspconfig")
      -- for server, config in pairs(opts.servers) do
      -- -- passing config.capabilities to blink.cmp merges with the capabilities in your
      -- -- `opts[server].capabilities, if you"ve defined it
      -- config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
      -- lspconfig[server].setup(config)
      -- end
      -- end

      -- example calling setup directly for each LSP
      config = function()
        local capabilities = require("blink.cmp").get_lsp_capabilities()
        local lspconfig = require("lspconfig")

        lspconfig["lua_ls"].setup({ capabilities = capabilities })
      end
    },
    {
      "folke/trouble.nvim",
      opts = {}, -- for default options, refer to the configuration section for custom setup.
      cmd = "Trouble",
      keys = {
        {
          "<leader>xx",
          "<cmd>Trouble diagnostics toggle<cr>",
          desc = "Diagnostics (Trouble)",
        },
        {
          "<leader>xX",
          "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
          desc = "Buffer Diagnostics (Trouble)",
        },
        {
          "<leader>cs",
          "<cmd>Trouble symbols toggle focus=false<cr>",
          desc = "Symbols (Trouble)",
        },
        {
          "<leader>cl",
          "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
          desc = "LSP Definitions / references / ... (Trouble)",
        },
        {
          "<leader>xL",
          "<cmd>Trouble loclist toggle<cr>",
          desc = "Location List (Trouble)",
        },
        {
          "<leader>xQ",
          "<cmd>Trouble qflist toggle<cr>",
          desc = "Quickfix List (Trouble)",
        },
      },
    },
  }, -- end of spec

  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "dracula" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

-- set colors
vim.cmd("colorscheme dracula")

require("lualine").setup({ options = { theme = "auto" } })
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
