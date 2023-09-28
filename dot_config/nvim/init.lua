-- =======
-- Basics
-- =======

-- Remap leader
vim.g.mapleader = ','

-- Various settings
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.colorcolumn = '80,90'
vim.o.undofile = true
vim.o.textwidth = 85
vim.o.relativenumber = true

-- Netrw
vim.cmd [[
  let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
  let g:netrw_banner = 0
]]

-- Spellcheck
vim.cmd [[set spell spelllang=en_gb]]

-- Remove highlights
vim.api.nvim_set_keymap('n', '<CR>', ':noh<CR>', { noremap = true, silent = true })

-- =========
-- Packages
-- =========
-- Bootstrap lazy
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- ===============
  -- Insert packages here
  -- ===============

  -- Themes
  'EdenEast/nightfox.nvim',

  -- Highlight, edit, and navigate code
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function(opts)
      require('tsitter').setup(opts)
    end,
    build = ':TSUpdate',
  },

  -- LSP Configuration & Plugins
  {
    'neovim/nvim-lspconfig',
    event = 'VeryLazy',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',


      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
    config = function()
      require('lsp').setup()
    end,
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
    config = function()
      require('complete').setup()
    end,
  },

  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    event = 'VeryLazy',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
  },

  -- TODOs and FIXes
  {
    'folke/todo-comments.nvim',
    event = 'VeryLazy',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  {
    'folke/trouble.nvim',
    event = 'VeryLazy',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },

  -- Lualine
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('statusbar').setup()
    end,
  },

  -- Surround
  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    config = function(opts)
      require('nvim-surround').setup(opts)
    end
  },

  -- Commentary
  {
    'tpope/vim-commentary',
    event = 'VeryLazy',
  },

  -- Autoformatting
  'tpope/vim-sleuth',

  -- Copilot
  'github/copilot.vim',

  -- ===============
  -- End of packages
  -- ===============
})

-- ===============
-- Themes
-- ===============
vim.cmd 'colorscheme terafox'


-- ===============
-- Core Configuration
-- ===============
require("core")
