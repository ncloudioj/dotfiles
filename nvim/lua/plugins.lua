-- Plugins are managed by Packer.nvim

local use = require("packer").use
require("packer").startup(function()
  use("L3MON4D3/LuaSnip")
  use("Raimondi/delimitMate")
  use("airblade/vim-gitgutter")
  use("christoomey/vim-tmux-navigator")
  use({ "catppuccin/nvim", as = "catppuccin" })
  use({ "dracula/vim", as = "dracula" })
  use("easymotion/vim-easymotion")
  use("florentc/vim-tla")
  use({
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  })
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-cmdline")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-path")
  use("hrsh7th/nvim-cmp")
  use("jose-elias-alvarez/null-ls.nvim")
  use("joshdick/onedark.vim")
  use("junegunn/fzf")
  use("junegunn/fzf.vim")
  use("nvim-tree/nvim-web-devicons")
  use("lewis6991/gitsigns.nvim")
  use("lervag/vimtex")
  use("lukas-reineke/indent-blankline.nvim")
  use("mfussenegger/nvim-dap")
  use("morhetz/gruvbox")
  use("nvim-lua/plenary.nvim")
  use("nvim-lua/popup.nvim")
  use("onsails/lspkind-nvim")
  use("preservim/vim-markdown")
  use("preservim/nerdcommenter")
  use("RRethy/vim-illuminate")
  use("rafamadriz/friendly-snippets")
  use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
  use("ryanoasis/vim-devicons")
  use("saadparwaiz1/cmp_luasnip")
  use("simrat39/rust-tools.nvim")
  use("suan/vim-instant-markdown")
  use("terryma/vim-multiple-cursors")
  use("tpope/vim-commentary")
  use("tpope/vim-endwise")
  use("tpope/vim-fugitive")
  use("tpope/vim-surround")
  use("vim-airline/vim-airline")
  use("vim-airline/vim-airline-themes")
  use("w0rp/ale")
  use("wbthomason/packer.nvim")
  use({
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  })
  use({
    "kyazdani42/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons",
    },
  })
  use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use({
    "nvim-telescope/telescope-fzf-native.nvim",
    run =
    "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
  })
  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.0",
    -- or                            , branch = '0.1.x',
    requires = { { "nvim-lua/plenary.nvim" } },
  })
end)

-- Automatically run :PackerCompile whenever plugins.lua is updated
vim.cmd([[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
