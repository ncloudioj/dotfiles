require("mason").setup()
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
  automatic_enable = {
    exclude = {'rust_analyzer', 'basedpyright'},
  },
  ensure_installed = {
    -- "basedpyright",
    "bashls",
    "clangd",
    "eslint",
    -- "hls",
    "marksman",
    "rust_analyzer",
    "lua_ls",
    "terraformls",
    "texlab",
    "tflint",
    "gopls",
    "zls",
  },
  function(server_name)
    -- Skip rust_analyzer and pyright as we manually configure them.
    -- Otherwise the following `setup()` would override our config.
    if server_name ~= "rust_analyzer" or server_name ~= "basedpyright" then
      require("lspconfig")[server_name].setup({
        on_attach = function(client, bufnr)
          require("config.shared").on_attach(client, bufnr)
          require("illuminate").on_attach(client)
        end,
      })
    end
  end,
})
