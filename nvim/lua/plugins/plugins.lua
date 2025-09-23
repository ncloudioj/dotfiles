return {
  {
    "L3MON4D3/LuaSnip",
    tag = "v2.3.0",
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme catppuccin-mocha]])
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  {
    "dracula/vim",
    name = "dracula",
    lazy = true,
    event = "VeryLazy",
  },
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
  },
  "florentc/vim-tla",
  {
    "folke/trouble.nvim",
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
        "<F4>",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Show symbols on the right (Trouble)",
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
    opts = {}, -- for default options, refer to the configuration section for custom setup.
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      delay = function(ctx)
        return ctx.plugin and 0 or 200
      end,
    },
  },
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
  { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
  "gbprod/yanky.nvim",
  {
    "hrsh7th/nvim-cmp",
    -- load cmp on InsertEnter
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
    },
  },
  "nvimtools/none-ls.nvim",
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },
  "nvim-tree/nvim-web-devicons",
  "leoluz/nvim-dap-go",
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
    version = "^6", -- Recommended
    lazy = false,
  },
  "morhetz/gruvbox",
  "nvim-lua/plenary.nvim",
  "nvim-lualine/lualine.nvim",
  "onsails/lspkind-nvim",
  {
    "OXY2DEV/markview.nvim",
    lazy = true,      -- Recommended
    ft = "markdown", -- If you decide to lazy-load anyway
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    }
  },
  "preservim/vim-markdown",
  "RRethy/vim-illuminate",
  "rafamadriz/friendly-snippets",
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
  },
  {
    "ray-x/go.nvim",
    config = function()
      require("go").setup()
    end,
    event = {"CmdlineEnter"},
    ft = {"go", 'gomod'},
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
  },
  "ryanoasis/vim-devicons",
  "suan/vim-instant-markdown",
  "terryma/vim-multiple-cursors",
  "tpope/vim-endwise",
  "tpope/vim-fugitive",
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  "windwp/nvim-autopairs",
  {
    "kyazdani42/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "akinsho/bufferline.nvim",
    -- version = "v3.*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  {
    "nvim-telescope/telescope.nvim",
    version = "0.1.6",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "yetone/avante.nvim",
    build = vim.fn.has("win32") ~= 0
        and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
        or "make",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    opts = {
      -- add any opts here
      -- this file can contain specific instructions for your project
      instructions_file = "avante.md",
      -- for example
      provider = "gemini",
      providers = {
        claude = {
          endpoint = "https://api.anthropic.com",
          model = "claude-sonnet-4",
          api_key_name = "cmd:bw get notes anthropic-token",
          timeout = 30000, -- Timeout in milliseconds
          extra_request_body = {
            temperature = 0.75,
            max_tokens = 20480,
          },
        },
        gemini = {
          endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
          model = "gemini-2.5-pro",
          -- api_key_name = "cmd:bw get notes gemeni-token",
          timeout = 30000, -- Timeout in milliseconds
          temperature = 0,
          max_tokens = 8192,
        },
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick", -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "stevearc/dressing.nvim", -- for input provider dressing
      "folke/snacks.nvim", -- for input provider snacks
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
