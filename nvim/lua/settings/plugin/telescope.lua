local opt_silent_noremap = { silent = true, noremap = true }

require("telescope").setup({ defaults = { file_ignore_patterns = { "node_modules", "book" } } })
require("telescope").load_extension("fzf")
vim.api.nvim_set_keymap("n", "<leader>tf", [[<cmd>Telescope find_files<CR>]], opt_silent_noremap)
vim.api.nvim_set_keymap("n", "<leader>tg", [[<cmd>Telescope live_grep<CR>]], opt_silent_noremap)
vim.api.nvim_set_keymap("n", "<leader>tb", [[<cmd>Telescope buffers<CR>]], opt_silent_noremap)
vim.api.nvim_set_keymap("n", "<leader>th", [[<cmd>Telescope help_tags<CR>]], opt_silent_noremap)
vim.api.nvim_set_keymap("n", "<leader>tt", [[<cmd>Telescope grep_string<CR>]], opt_silent_noremap)
vim.api.nvim_set_keymap("n", "<leader>tr", [[<cmd>Telescope lsp_references<CR>]], opt_silent_noremap)
