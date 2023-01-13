local export = {}

function export.on_attach(_, bufnr)
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

  -- if client.supports_method("textDocument/formatting") then
    -- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
      -- group = vim.api.nvim_create_augroup("SharedLspFormatting", { clear = true }),
      -- pattern = "*",
      -- command = "lua vim.lsp.buf.format()",
    -- })
  -- end

  -- if client.server_capabilities.documentSymbolProvider then
    -- -- WARNING: ../plugins/lsp.lua must be loaded first to avoid error loading navic plugin.
    -- require("nvim-navic").attach(client, bufnr)

    -- vim.api.nvim_set_hl(0, "NavicIconsFile", { default = true, bg = "#000000", fg = "#83a598" })
    -- vim.api.nvim_set_hl(0, "NavicIconsModule", { default = true, bg = "#000000", fg = "#83a598" })
    -- vim.api.nvim_set_hl(0, "NavicIconsNamespace", { default = true, bg = "#000000", fg = "#83a598" })
    -- vim.api.nvim_set_hl(0, "NavicIconsPackage", { default = true, bg = "#000000", fg = "#83a598" })
    -- vim.api.nvim_set_hl(0, "NavicIconsClass", { default = true, bg = "#000000", fg = "#83a598" })
    -- vim.api.nvim_set_hl(0, "NavicIconsMethod", { default = true, bg = "#000000", fg = "#83a598" })
    -- vim.api.nvim_set_hl(0, "NavicIconsProperty", { default = true, bg = "#000000", fg = "#83a598" })
    -- vim.api.nvim_set_hl(0, "NavicIconsField", { default = true, bg = "#000000", fg = "#83a598" })
    -- vim.api.nvim_set_hl(0, "NavicIconsConstructor", { default = true, bg = "#000000", fg = "#83a598" })
    -- vim.api.nvim_set_hl(0, "NavicIconsEnum", { default = true, bg = "#000000", fg = "#83a598" })
    -- vim.api.nvim_set_hl(0, "NavicIconsInterface", { default = true, bg = "#000000", fg = "#83a598" })
    -- vim.api.nvim_set_hl(0, "NavicIconsFunction", { default = true, bg = "#000000", fg = "#83a598" })
    -- vim.api.nvim_set_hl(0, "NavicIconsVariable", { default = true, bg = "#000000", fg = "#83a598" })
    -- vim.api.nvim_set_hl(0, "NavicIconsConstant", { default = true, bg = "#000000", fg = "#83a598" })
    -- vim.api.nvim_set_hl(0, "NavicIconsString", { default = true, bg = "#000000", fg = "#83a598" })
    -- vim.api.nvim_set_hl(0, "NavicIconsNumber", { default = true, bg = "#000000", fg = "#83a598" })
    -- vim.api.nvim_set_hl(0, "NavicIconsBoolean", { default = true, bg = "#000000", fg = "#83a598" })
    -- vim.api.nvim_set_hl(0, "NavicIconsArray", { default = true, bg = "#000000", fg = "#83a598" })
    -- vim.api.nvim_set_hl(0, "NavicIconsObject", { default = true, bg = "#000000", fg = "#83a598" })
    -- vim.api.nvim_set_hl(0, "NavicIconsKey", { default = true, bg = "#000000", fg = "#83a598" })
    -- vim.api.nvim_set_hl(0, "NavicIconsNull", { default = true, bg = "#000000", fg = "#83a598" })
    -- vim.api.nvim_set_hl(0, "NavicIconsEnumMember", { default = true, bg = "#000000", fg = "#83a598" })
    -- vim.api.nvim_set_hl(0, "NavicIconsStruct", { default = true, bg = "#000000", fg = "#83a598" })
    -- vim.api.nvim_set_hl(0, "NavicIconsEvent", { default = true, bg = "#000000", fg = "#83a598" })
    -- vim.api.nvim_set_hl(0, "NavicIconsOperator", { default = true, bg = "#000000", fg = "#83a598" })
    -- vim.api.nvim_set_hl(0, "NavicIconsTypeParameter", { default = true, bg = "#000000", fg = "#83a598" })
    -- vim.api.nvim_set_hl(0, "NavicText", { default = true, bg = "#000000", fg = "#ffffff" })
    -- vim.api.nvim_set_hl(0, "NavicSeparator", { default = true, bg = "#000000", fg = "#fabd2f" })

    -- vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
  -- end
end

return export
