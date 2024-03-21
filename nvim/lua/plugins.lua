-- Install Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
local plugins = {
  "L3MON4D3/LuaSnip",
  "Raimondi/delimitMate",
  "airblade/vim-gitgutter",
  -- {
    -- "christoomey/vim-tmux-navigator",
    -- lazy = false,
  -- },
  {
    "aserowy/tmux.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tmux").setup({
        copy_sync = {
          enable = false,
        },
      })
    end
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme catppuccin-macchiato]])
    end,
  },
  "dense-analysis/ale",
  {
    "dracula/vim",
    name = "dracula",
    lazy = false,
    priority = 1000,
  },
  "easymotion/vim-easymotion",
  "florentc/vim-tla",
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  {
    "folke/neodev.nvim",
    opts = {}
  },
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-path",
  "hrsh7th/nvim-cmp",
  "nvimtools/none-ls.nvim",
  "joshdick/onedark.vim",
  "junegunn/fzf",
  "junegunn/fzf.vim",
  "nvim-tree/nvim-web-devicons",
  "lewis6991/gitsigns.nvim",
  "lervag/vimtex",
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },
  "mfussenegger/nvim-dap",
  {
    "mrcjkb/rustaceanvim",
    version = "^4", -- Recommended
    ft = { "rust" },
  },
  "morhetz/gruvbox",
  "nvim-lua/plenary.nvim",
  "nvim-lua/popup.nvim",
  "nvim-lualine/lualine.nvim",
  "onsails/lspkind-nvim",
  "preservim/vim-markdown",
  "preservim/nerdcommenter",
  "RRethy/vim-illuminate",
  "rafamadriz/friendly-snippets",
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  },
  "ryanoasis/vim-devicons",
  "saadparwaiz1/cmp_luasnip",
  {
    "stevearc/aerial.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = {
       "nvim-treesitter/nvim-treesitter",
       "nvim-tree/nvim-web-devicons",
    },
  },
  "suan/vim-instant-markdown",
  "terryma/vim-multiple-cursors",
  "tpope/vim-commentary",
  "tpope/vim-endwise",
  "tpope/vim-fugitive",
  "tpope/vim-surround",
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  {
    "kyazdani42/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "akinsho/bufferline.nvim",
    version = "v3.*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build =
    "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
  },
  {
    "nvim-telescope/telescope.nvim",
    version = "0.1.4",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
}

local opt = {}

require("lazy").setup(plugins, opt)
