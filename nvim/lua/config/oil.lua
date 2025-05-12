require("oil").setup({
  keymaps = {
    ["<C-l>"] = false,
    ["<C-h>"] = false,
  },
})
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
