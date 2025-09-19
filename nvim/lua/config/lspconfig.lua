local shared = require("config.shared")

local util = require("lspconfig.util")

local lsps = {
    "basedpyright",
    "bashls",
    "clangd",
    "eslint",
    "hls",
    "marksman",
    "rust_analyzer",
    "lua_ls",
    "terraformls",
    "texlab",
    "tflint",
    "gopls",
    "zls",
}

for _, lsp in ipairs(lsps) do
  vim.lsp.enable(lsp)
end

-- LSP: Lua
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

vim.lsp.config("lua_ls", {
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
vim.lsp.config("basedpyright", {
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
vim.lsp.config("gopls", {
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
vim.lsp.config("zls", {
  on_attach = shared.on_attach,
  capabilities = shared.capabilities,
  cmd = {"zls"},
  settings = {
    zls = {},
  },
})

-- LSP: Haskell
-- vim.lsp.config("hls", {
-- on_attach = on_attach,
-- root_dir = vim.loop.cwd,
-- settings = {
-- rootMarkers = {"./git/"}
-- }
-- }
