local opt_silent_noremap = { silent = true, noremap = true }

vim.api.nvim_set_keymap("n", "bb", "<cmd>FzfLua buffers<CR>", opt_silent_noremap)
vim.api.nvim_set_keymap("n", "<C-p>", "<cmd>FzfLua files<CR>", opt_silent_noremap)

vim.api.nvim_set_keymap("n", "<leader>ff", [[<cmd>FzfLua grep_cword<CR>]], opt_silent_noremap)
vim.api.nvim_set_keymap("n", "<leader>fg", [[<cmd>FzfLua live_grep<CR>]], opt_silent_noremap)
vim.api.nvim_set_keymap("n", "<leader>fb", [[<cmd>FzfLua buffers<CR>]], opt_silent_noremap)
vim.api.nvim_set_keymap("n", "<leader>fh", [[<cmd>FzfLua helptags<CR>]], opt_silent_noremap)
vim.api.nvim_set_keymap("n", "<leader>ft", [[<cmd>FzfLua grep<CR>]], opt_silent_noremap)
vim.api.nvim_set_keymap("n", "<leader>fr", [[<cmd>FzfLua lsp_references<CR>]], opt_silent_noremap)
