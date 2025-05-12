local shared = require("config.shared")

local nvim_lsp = require("lspconfig")
local util = require("lspconfig.util")

-- LSP: Lua
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

nvim_lsp.lua_ls.setup({
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

-- LSP: basedpyright
nvim_lsp.basedpyright.setup({
  on_attach = function(client, bufnr)
    shared.on_attach(client, bufnr)
    require("illuminate").on_attach(client)
  end,
  capabilities = shared.capabilities,
  settings = {
    basedpyright = {
      analysis = {
        autoImportCompletion = true,
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",
        useLibraryCodeForTypes = true,
        typeCheckingMode = "off", -- off|basic|strict
      },
    },
  }
})

-- LSP: gopls
nvim_lsp.gopls.setup({
  on_attach = shared.on_attach,
  capabilities = shared.capabilities,
  cmd = {"gopls"},
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      completeUnimported = true,
      usePlaceholders = true,
      staticcheck = true,
      -- gofumpt = true,
    },
  },
})

-- LSP: zls
nvim_lsp.zls.setup({
  on_attach = shared.on_attach,
  capabilities = shared.capabilities,
  cmd = {"zls"},
  settings = {
    zls = {},
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
