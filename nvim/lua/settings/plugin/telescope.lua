local opt_silent_noremap = { silent = true, noremap = true }

require("telescope").setup({ defaults = { file_ignore_patterns = { "node_modules", "book", "build" } } })
require("telescope").load_extension("fzf")
vim.api.nvim_set_keymap("n", "<leader>ff", [[<cmd>Telescope find_files<CR>]], opt_silent_noremap)
vim.api.nvim_set_keymap("n", "<leader>fg", [[<cmd>Telescope live_grep<CR>]], opt_silent_noremap)
vim.api.nvim_set_keymap("n", "<leader>fb", [[<cmd>Telescope buffers<CR>]], opt_silent_noremap)
vim.api.nvim_set_keymap("n", "<leader>fh", [[<cmd>Telescope help_tags<CR>]], opt_silent_noremap)
vim.api.nvim_set_keymap("n", "<leader>ft", [[<cmd>Telescope grep_string<CR>]], opt_silent_noremap)
vim.api.nvim_set_keymap("n", "<leader>fr", [[<cmd>Telescope lsp_references<CR>]], opt_silent_noremap)
