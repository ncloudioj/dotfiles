-- Plugins are managed by Packer.nvim

local use = require("packer").use
require("packer").startup(function()
  use "L3MON4D3/LuaSnip"
  use "Raimondi/delimitMate"
  use "airblade/vim-gitgutter"
  use "christoomey/vim-tmux-navigator"
  use {'dracula/vim', as = 'dracula'}
  use "easymotion/vim-easymotion"
  use "florentc/vim-tla"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-path"
  use "hrsh7th/nvim-cmp"
  use "joshdick/onedark.vim"
  use "junegunn/fzf"
  use "junegunn/fzf.vim"
  use "nvim-tree/nvim-web-devicons"
  use "lewis6991/gitsigns.nvim"
  use "lervag/vimtex"
  use "lukas-reineke/indent-blankline.nvim"
  use "morhetz/gruvbox"
  use "nvim-lua/plenary.nvim"
  use "nvim-lua/popup.nvim"
  use "onsails/lspkind-nvim"
  use "preservim/vim-markdown"
  use "preservim/nerdcommenter"
  use "RRethy/vim-illuminate"
  use "rafamadriz/friendly-snippets"
  use "ryanoasis/vim-devicons"
  use "saadparwaiz1/cmp_luasnip"
  use "simrat39/rust-tools.nvim"
  use "suan/vim-instant-markdown"
  use "terryma/vim-multiple-cursors"
  use "tpope/vim-commentary"
  use "tpope/vim-endwise"
  use "tpope/vim-fugitive"
  use "tpope/vim-surround"
  use "vim-airline/vim-airline"
  use "vim-airline/vim-airline-themes"
  use "w0rp/ale"
  use "wbthomason/packer.nvim"
  use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
  }
  use {
    "kyazdani42/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons"
    },
  }
  use { "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" }
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
  -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
end)

-- Automatically run :PackerCompile whenever plugins.lua is updated
-- vim.cmd([[
  -- augroup packer_user_config
    -- autocmd!
    -- autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  -- augroup end
-- ]])

local opt_silent = { silent = true }
local opt_silent_noremap = { silent = true, noremap = true }

-- Vim-fzf
vim.api.nvim_set_keymap("n", "bb", ":Buffers<CR>", opt_silent)
vim.api.nvim_set_keymap("n", "<C-p>", ":Files<CR>", opt_silent)

-- Vim-airline
vim.api.nvim_exec(
  [[
    let g:airline_powerline_fonts = 1
    let g:airline_detect_modified = 1
    let g:airline_detect_paste = 1
    let g:airline#extensions#whitespace#enabled = 1
    let g:airline#extensions#tabline#enabled = 0
    let g:airline#extensions#tabline#show_buffers = 1
    let g:airline#extensions#tabline#show_tab_type = 1
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline#extensions#tabline#buffer_nr_show = 1
    let g:airline#extensions#tabline#buffer_nr_format = '%s.'
    let g:airline_theme='dracula'
    let g:airline_section_y=''
    let g:airline#extensions#ale#enabled = 1
  ]],
  false
)

-- NerdCommenter
vim.api.nvim_exec(
  [[
    let NERDSpaceDelims = 1
    let NERDRemoveExtraSpaces = 0
    let g:NERDCustomDelimiters = { 'c': { 'left': '/* ', 'right': '*/', 'leftAlt': '//', 'rightAlt': '//' }, 'rust': { 'left': '//', 'leftAlt': '///' } }
  ]],
  false
)

-- Ale
vim.api.nvim_exec(
  [[
    let g:ale_open_list = 0
    let g:ale_lint_on_text_changed = 'never'
    let g:ale_lint_on_insert_leave = 0
    let g:ale_lint_on_enter = 0
    let g:ale_linter_aliases = {'jsx': ['css', 'javascript']}
    let g:ale_linters = {
      \  'dockerfile': ['hadolint'],
      \  'jsx': ['stylelint', 'eslint'],
      \  'javascript': ['prettier', 'eslint'],
      \  'python': ['flake8', 'mypy'],
      \  'rust': ['analyzer'],
      \  'haskell': ['hlint'],
      \  'sh': ['shellcheck'],
      \ }
    let g:ale_fixers = {
      \  'python': ['black', 'autopep8', 'isort'],
      \  'javascript': ['prettier', 'eslint']
      \ }
    let g:airline#extensions#ale#enabled = 1
  ]],
  false
)

-- VimTex
vim.api.nvim_exec(
  [[
    " Use Zathura as the VimTeX PDF viewer
    let g:vimtex_view_method = 'zathura'
    let g:vimtex_compiler_latexmk = {
        \ 'build_dir' : 'outputs',
        \ 'callback' : 1,
        \ 'continuous' : 1,
        \ 'executable' : 'latexmk',
        \ 'hooks' : [],
        \ 'options' : [
        \   '-verbose',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}
  ]],
  false
)

-- EasyMotion
vim.api.nvim_exec(
  [[
    " Disable default mappings
    let g:EasyMotion_do_mapping = 0
    let g:EasyMotion_smartcase = 1
    " Make 's' as the trigger
    nmap s <Plug>(easymotion-overwin-f)
  ]],
  false
)

-- vim-markdown
vim.api.nvim_exec(
  [[
    let g:vim_markdown_folding_disabled = 1
  ]],
  false
)

-- Vim-instant-markdown
vim.api.nvim_exec(
  [[
    let g:instant_markdown_autostart = 0
  ]],
  false
)
vim.api.nvim_set_keymap("n", "<leader>md", ":InstantMarkdownPreview<CR>", opt_silent)

-- Vim-gutentags
vim.api.nvim_exec(
  [[
    let g:gutentags_cache_dir = '~/.tags_cache'
    let g:gutentags_ctags_exclude = ['*/node_modules/*', '*/mozilla-central/*']
  ]],
  false
)

-- Telescope
require('telescope').setup{ defaults = { file_ignore_patterns = {"node_modules", "book"} } }
require('telescope').load_extension('fzf')
vim.api.nvim_set_keymap("n", "<leader>tf", [[<cmd>Telescope find_files<CR>]], opt_silent_noremap)
vim.api.nvim_set_keymap("n", "<leader>tg", [[<cmd>Telescope live_grep<CR>]], opt_silent_noremap)
vim.api.nvim_set_keymap("n", "<leader>tb", [[<cmd>Telescope buffers<CR>]], opt_silent_noremap)
vim.api.nvim_set_keymap("n", "<leader>th", [[<cmd>Telescope help_tags<CR>]], opt_silent_noremap)
vim.api.nvim_set_keymap("n", "<leader>tt", [[<cmd>Telescope grep_string<CR>]], opt_silent_noremap)
vim.api.nvim_set_keymap("n", "<leader>tr", [[<cmd>Telescope lsp_references<CR>]], opt_silent_noremap)

-- Gitsigns
require("gitsigns").setup {
  signs = {
    add = { hl = "GitGutterAdd", text = "+" },
    change = { hl = "GitGutterChange", text = "~" },
    delete = { hl = "GitGutterDelete", text = "_" },
    topdelete = { hl = "GitGutterDelete", text = "‾" },
    changedelete = { hl = "GitGutterChange", text = "~" },
  },
}

-- TreeSitter
require('nvim-treesitter.configs').setup {
  ensure_installed = { "bash", "c", "haskell", "json", "latex", "lua", "python", "rust", "toml", "yaml" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  -- ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    -- disable = { "c", "rust" },  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

-- Bufferline
vim.o.termguicolors = true
require("bufferline").setup {
  options = {
    numbers = "none",
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    buffer_close_icon = "",
    close_command = "bdelete! %d",
    right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
    modified_icon = "",
    -- close_icon = "%@NvChad_bufferline_quitvim@%X",
    close_icon = "",
    show_close_icon = true,
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 18,
    max_prefix_length = 15,
    tab_size = 18,
    show_tab_indicators = true,
    enforce_regular_tabs = false,
    view = "multiwindow",
    show_buffer_close_icons = true,
    separator_style = "slant",
    always_show_bufferline = true,
    diagnostics = "nvim_lsp", -- "or nvim_lsp"
    custom_filter = function(buf_number)
       -- Func to filter out our managed/persistent split terms
       local present_type, type = pcall(function()
          return vim.api.nvim_buf_get_var(buf_number, "term_type")
       end)

       if present_type then
          if type == "vert" then
             return false
          elseif type == "hori" then
             return false
          else
             return true
          end
       else
          return true
       end
    end,
    tree_indent_marks = 1,
   },
}

-- Nvim-tree.lua
require"nvim-tree".setup {
   diagnostics = {
      enable = false,
      icons = {
         hint = "",
         info = "",
         warning = "",
         error = "",
      },
   },
   filters = {
      dotfiles = false,
      custom = {},
   },
   disable_netrw = true,
   hijack_netrw = true,
   ignore_ft_on_setup = { "dashboard" },
   open_on_tab = false,
   hijack_cursor = true,
   update_cwd = true,
   update_focused_file = {
      enable = true,
      update_cwd = false,
   },
   view = {
      side = "left",
      width = 35,
   },
   renderer = {
     highlight_git = true,
     add_trailing = false,
     highlight_opened_files = "none",
     root_folder_modifier = ":~",
     icons = {
       webdev_colors = true,
       git_placement = "before",
       padding = " ",
       symlink_arrow = " ➛ ",
       show = {
         file = true,
         folder = true,
         folder_arrow = true,
         git = true,
       },
       glyphs = {
         default = "",
         symlink = "",
         folder = {
           arrow_closed = "",
           arrow_open = "",
           default = "",
           open = "",
           empty = "",
           empty_open = "",
           symlink = "",
           symlink_open = "",
         },
         git = {
           unstaged = "✗",
           staged = "✓",
           unmerged = "",
           renamed = "➜",
           untracked = "★",
           deleted = "",
           ignored = "◌",
         },
       },
     },
     special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
   },
   actions = {
     open_file = {
       quit_on_open = false,
     },
   },
}

-- nvim-cmp

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- luasnip setup
local luasnip = require 'luasnip'
-- snippets for luasnip
require("luasnip.loaders.from_vscode").lazy_load()
-- lspkind-nvim
local lspkind = require 'lspkind'

-- nvim-cmp setup
local cmp = require 'cmp'

cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
    ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  }, {
    { name = 'path' }
  }),
  formatting = {
    format = function(entry, vim_item)
      -- load lspkind icons
      vim_item.kind = string.format(
        "%s %s",
        lspkind.symbol_map[vim_item.kind],
        vim_item.kind
      )

      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        nvim_lua = "[Lua]",
        buffer = "[BUF]",
        luasnip = "[SNP]",
      })[entry.source.name]

      return vim_item
    end,
  },
}

-- Use buffer source for `/`.
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':'.
-- cmp.setup.cmdline(':', {
  -- sources = cmp.config.sources({
    -- { name = 'path' }
  -- }, {
    -- { name = 'cmdline' }
  -- })
-- })

require("mason").setup()
local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup({
  ensure_installed = {
    "bashls", "clangd", "eslint", "gopls", "hls", "jsonls", "marksman",
    "pyright", "rust_analyzer", "sumneko_lua", "terraformls", "texlab",
    "tflint", "tsserver", "yamlls"
  }
})
mason_lspconfig.setup_handlers({
  function(server_name)
    -- Skip rust_analyzer as we manually configure them.
    -- Otherwise the following `setup()` would override our config.
    if server_name ~= "rust_analyzer" then
      require("lspconfig")[server_name].setup({
        on_attach = function(client, bufnr)
          require("settings/shared").on_attach(client, bufnr)
          require("illuminate").on_attach(client)
        end
      })
    end
  end
})

-- LSP settings
local nvim_lsp = require "lspconfig"

-- Rust-tools
local opts = {
  tools = {
      autoSetHints = true,
      inlay_hints = {
        -- automatically set inlay hints (type hints)
        -- default: true
        auto = true,

        -- Only show inlay hints for the current line
        only_current_line = false,

        -- whether to show parameter hints with the inlay hints or not
        -- default: true
        show_parameter_hints = true,

        -- prefix for parameter hints
        -- default: "<-"
        parameter_hints_prefix = "<- ",

        -- prefix for all the other hints (type, chaining)
        -- default: "=>"
        other_hints_prefix = "=> ",

        -- whether to align to the length of the longest line in the file
        max_len_align = false,

        -- padding from the left if max_len_align is true
        max_len_align_padding = 1,

        -- whether to align to the extreme right or not
        right_align = false,

        -- padding from the right if right_align is true
        right_align_padding = 7,

        -- The color of the hints
        highlight = "Comment",
      },
  },

  server = {
    -- on_attach = on_attach,
    on_attach = function(client, bufnr)
      require("settings/shared").on_attach(client, bufnr)
      require("illuminate").on_attach(client)
    end,
    capabilities = capabilities,
    settings = {
      ["rust-analyzer"] = {
        assist = {
          importGranularity = "module",
          importPrefix = "by_self",
        },
        cargo = {
          loadOutDirsFromCheck = true,
        },
        procMacro = {
          enable = true,
        },
      },
    },
  },
}

require('rust-tools').setup(opts)

-- LSP: Lua
local USER = vim.fn.expand "$USER"
local sumneko_root_path = ""
local sumneko_binary = ""

if vim.fn.has "mac" == 1 then
  sumneko_root_path = "/Users/" .. USER .. "/Projects/github/lua-language-server"
  sumneko_binary = "/Users/" .. USER .. "/Projects/github/lua-language-server/bin/macOS/lua-language-server"
elseif vim.fn.has "unix" == 1 then
  sumneko_root_path = "/home/" .. USER .. "/Projects/github/lua-language-server"
  sumneko_binary = "/home/" .. USER .. "/Projects/github/lua-language-server/bin/Linux/lua-language-server"
else
  print "Unsupported system for sumneko"
end

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

nvim_lsp.sumneko_lua.setup {
  cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

-- LSP: Haskell
-- nvim_lsp.hls.setup {
  -- on_attach = on_attach,
  -- root_dir = vim.loop.cwd,
  -- settings = {
    -- rootMarkers = {"./git/"}
  -- }
-- }
