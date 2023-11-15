require("lualine").setup({
  options = {
    theme = "dracula",
    section_separators = "",
    component_separators = "",
  },
  extensions = {
    "fugitive",
    "lazy",
    "mason",
    "nvim-tree",
    "nvim-dap-ui",
    "quickfix",
    "trouble",
  },
})
