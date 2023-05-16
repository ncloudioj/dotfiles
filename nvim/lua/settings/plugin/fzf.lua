local opt_silent = { silent = true }

vim.api.nvim_set_keymap("n", "bb", ":Buffers<CR>", opt_silent)
vim.api.nvim_set_keymap("n", "<C-p>", ":Files<CR>", opt_silent)
