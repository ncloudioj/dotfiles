-- Plugins are managed by Packer.nvim

local use = require("packer").use
require("packer").startup(function()
  use "L3MON4D3/LuaSnip"
  use "Raimondi/delimitMate"
  use "airblade/vim-gitgutter"
  use "christoomey/vim-tmux-navigator"
  use "easymotion/vim-easymotion"
  use "florentc/vim-tla"
  use "hrsh7th/nvim-compe"
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
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

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

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

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

-- LSP: tss
nvim_lsp.tsserver.setup {}

-- Nvim-compe
vim.o.completeopt = "menuone,noselect"
require("compe").setup {
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 1,
  preselect = "enable",
  throttle_time = 80,
  source_timeout = 200,
  resolve_timeout = 800,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  documentation = {
    border = { "", "", "", " ", "", "", "", " " }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  },

  source = {
    path = true,
    buffer = true,
    calc = true,
    nvim_lsp = true,
    nvim_lua = true,
    vsnip = true,
    ultisnips = true,
    luasnip = true,
  },
}

-- Utility functions for compe and luasnip
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col "." - 1
  if col == 0 or vim.fn.getline("."):sub(col, col):match "%s" then
    return true
  else
    return false
  end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
local luasnip = require "luasnip"

_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif luasnip.expand_or_jumpable() then
    return t "<Plug>luasnip-expand-or-jump"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn["compe#complete"]()
  end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif luasnip.jumpable(-1) then
    return t "<Plug>luasnip-jump-prev"
  else
    return t "<S-Tab>"
  end
end

-- Map <Tab> to the above tab complete functions
vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", { expr = true })
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", { expr = true })
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
