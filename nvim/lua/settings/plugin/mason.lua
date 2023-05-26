require("mason").setup()

local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup({
  ensure_installed = {
    "bashls",
    "clangd",
    "eslint",
    "hls",
    "marksman",
    "pyright",
    "rust_analyzer",
    "lua_ls",
    "terraformls",
    "texlab",
    "tflint",
    "tsserver",
  },
})
mason_lspconfig.setup_handlers({
  function(server_name)
    -- Skip rust_analyzer and pyright as we manually configure them.
    -- Otherwise the following `setup()` would override our config.
    if server_name ~= "rust_analyzer" or server_name ~= "pyright" then
      require("lspconfig")[server_name].setup({
        on_attach = function(client, bufnr)
          require("settings.shared").on_attach(client, bufnr)
          require("illuminate").on_attach(client)
        end,
      })
    end
  end,
})
