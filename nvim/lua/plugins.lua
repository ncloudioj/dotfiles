-- Plugins are managed by Packer.nvim

local use = require("packer").use
require("packer").startup(function()
  use "L3MON4D3/LuaSnip"
  use "Raimondi/delimitMate"
  use "airblade/vim-gitgutter"
  use "christoomey/vim-tmux-navigator"
  use "easymotion/vim-easymotion"
  use "florentc/vim-tla"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/cmp-path"
  use "hrsh7th/nvim-cmp"
  use "joshdick/onedark.vim"
  use "junegunn/fzf"
  use "junegunn/fzf.vim"
  use "ludovicchabant/vim-gutentags"
  use "lukas-reineke/indent-blankline.nvim"
  use "majutsushi/tagbar"
  use "morhetz/gruvbox"
  use "neovim/nvim-lspconfig"
  use "plasticboy/vim-markdown"
  use "preservim/nerdcommenter"
  use "ryanoasis/vim-devicons"
  use "saadparwaiz1/cmp_luasnip"
  use "scrooloose/nerdtree"
  use "simrat39/rust-tools.nvim"
  use "suan/vim-instant-markdown"
  use "terryma/vim-multiple-cursors"
  use "tpope/vim-commentary"
  use "tpope/vim-endwise"
  use "tpope/vim-fugitive"
  use "vim-airline/vim-airline"
  use "vim-airline/vim-airline-themes"
  use "w0rp/ale"
  use "wbthomason/packer.nvim"
  use { "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } }
  use { "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } } }
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
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
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#show_buffers = 1
    let g:airline#extensions#tabline#show_tab_type = 1
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline#extensions#tabline#buffer_nr_show = 1
    let g:airline#extensions#tabline#buffer_nr_format = '%s.'
    let g:airline_theme='onedark'
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
    let g:ale_linters = { 'jsx': ['stylelint', 'eslint'], 'javascript': ['prettier', 'eslint'], 'python': ['pylint', 'flake8'], 'rust': ['analyzer'] }
    let g:ale_fixers = { 'python': ['yapf', 'autopep8'], 'javascript': ['prettier', 'eslint'] }
    let g:airline#extensions#ale#enabled = 1
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
vim.api.nvim_set_keymap("n", "<leader>tf", [[<cmd>Telescope find_files<CR>]], opt_silent_noremap)
vim.api.nvim_set_keymap("n", "<leader>tg", [[<cmd>Telescope live_grep<CR>]], opt_silent_noremap)
vim.api.nvim_set_keymap("n", "<leader>tb", [[<cmd>Telescope buffers<CR>]], opt_silent_noremap)
vim.api.nvim_set_keymap("n", "<leader>th", [[<cmd>Telescope help_tags<CR>]], opt_silent_noremap)
vim.api.nvim_set_keymap("n", "<leader>tt", [[<cmd>Telescope grep_string<CR>]], opt_silent_noremap)

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
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
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

-- nvim-cmp

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- luasnip setup
local luasnip = require 'luasnip'

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
  }, {
    { name = 'buffer' },
  }, {
    { name = 'luasnip' },
  }, {
    { name = 'path' }
  })
}

-- Use buffer source for `/`.
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- LSP settings
local nvim_lsp = require "lspconfig"
local on_attach = function(_, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  local opts = { noremap = true, silent = true }
  buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  -- buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  buf_set_keymap(
    "n",
    "<leader>wl",
    "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
    opts
  )
  buf_set_keymap("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  -- buf_set_keymap('v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
  buf_set_keymap("n", "<leader>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
  buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  buf_set_keymap("n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
  buf_set_keymap(
    "n",
    "<leader>so",
    "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>",
    opts
  )
  buf_set_keymap('n', '<leader>fm', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Enable the following language servers
local servers = { "clangd", "pyright", "tsserver", "rust_analyzer" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- LSP: Rust

-- Commented out as they are set by rust-tools below
-- nvim_lsp.rust_analyzer.setup {
  -- settings = {
    -- ["rust-analyzer"] = {
      -- assist = {
        -- importGranularity = "module",
        -- importPrefix = "by_self",
      -- },
      -- cargo = {
        -- loadOutDirsFromCheck = true,
      -- },
      -- procMacro = {
        -- enable = true,
      -- },
    -- },
  -- },
-- }

-- Rust-tools

local opts = {
  tools = {
      autoSetHints = true,
      hover_with_actions = true,
      inlay_hints = {
          show_parameter_hints = false,
          parameter_hints_prefix = "<- ",
          other_hints_prefix = "=> ",
      },
  },

  server = {
    on_attach = on_attach,
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
