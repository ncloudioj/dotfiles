local shared = require("settings.shared")

-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
require("neodev").setup({
  -- add any options here, or leave empty to use the default settings
  library = { plugins = { "nvim-dap-ui" }, types = true },
})

local nvim_lsp = require("lspconfig")

-- LSP: Lua
local USER = vim.fn.expand("$USER")
local sumneko_root_path = ""
local sumneko_binary = ""

if vim.fn.has("mac") == 1 then
  sumneko_root_path = "/Users/" .. USER .. "/Projects/github/lua-language-server"
  sumneko_binary = "/Users/" .. USER .. "/Projects/github/lua-language-server/bin/macOS/lua-language-server"
elseif vim.fn.has("unix") == 1 then
  sumneko_root_path = "/home/" .. USER .. "/Projects/github/lua-language-server"
  sumneko_binary = "/home/" .. USER .. "/Projects/github/lua-language-server/bin/Linux/lua-language-server"
else
  print("Unsupported system for sumneko")
end

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

nvim_lsp.lua_ls.setup({
  cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace",
      },
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
})

-- LSP: pyright
nvim_lsp.pyright.setup({
  on_attach = function(client, bufnr)
    shared.on_attach(client, bufnr)
    require("illuminate").on_attach(client)
  end,
  capabilities = shared.capabilities,
  settings = {
    pyright = {},
    python = {
      analysis = {
        autoImportCompletion = true,
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",
        useLibraryCodeForTypes = true,
        typeCheckingMode = "off", -- off|basic|strict
      },
    },
  },
})

-- LSP: Haskell
-- nvim_lsp.hls.setup {
-- on_attach = on_attach,
-- root_dir = vim.loop.cwd,
-- settings = {
-- rootMarkers = {"./git/"}
-- }
-- }
