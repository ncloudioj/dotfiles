--Remap for dealing with word wrap
vim.api.nvim_set_keymap("n", "k", [[v:count == 0 ? 'gk' : 'k']], { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap("n", "j", [[v:count == 0 ? 'gj' : 'j']], { noremap = true, expr = true, silent = true })

local opts = { noremap = true }

-- Y yanks until the end of line
vim.api.nvim_set_keymap("n", "Y", "y$", opts)

-- General shortcuts
vim.api.nvim_set_keymap("i", "jj", "<ESC>", opts)
vim.api.nvim_set_keymap("n", ";;", "<ESC>:bp<CR>", opts)
vim.api.nvim_set_keymap("n", [['']], "<ESC>:bn<CR>", opts)
vim.api.nvim_set_keymap("n", "<F2>", [[:nohl<CR>]], opts)
vim.api.nvim_set_keymap("", "<F3>", [[<cmd>NvimTreeToggle<CR>]], opts)
vim.api.nvim_set_keymap("", "<F4>", [[<cmd>TagbarToggle<CR>]], opts)

-- Navigate windows
vim.api.nvim_set_keymap("", "<C-h>", "<C-W>h", opts)
vim.api.nvim_set_keymap("", "<C-j>", "<C-W>j", opts)
vim.api.nvim_set_keymap("", "<C-k>", "<C-W>k", opts)
vim.api.nvim_set_keymap("", "<C-l>", "<C-W>l", opts)

-- Yank and paste
vim.api.nvim_set_keymap("v", "<leader>yy", [["*y]], opts)
vim.api.nvim_set_keymap("n", "<leader>pp", [["*p]], opts)

-- Mimic Shell bindings
vim.api.nvim_set_keymap("i", "<C-a>", "<C-o>I", opts)
vim.api.nvim_set_keymap("i", "<C-e>", "<C-o>A", opts)

-- Keep selection when shifting sidewards
vim.api.nvim_set_keymap("x", ">", ">gv", opts)
vim.api.nvim_set_keymap("x", "<", "<gv", opts)

-- Move lines up and down in blocks
vim.api.nvim_set_keymap("i", "<C-M-j>", [[<ESC>:m .+1<CR>=gi]], opts)
vim.api.nvim_set_keymap("i", "<C-M-k>", [[<ESC>:m .-2<CR>=gi]], opts)
vim.api.nvim_set_keymap("v", "<C-M-j>", [[:m '>+1<CR>gv=gv]], opts)
vim.api.nvim_set_keymap("v", "<C-M-k>", [[:m '<-2<CR>gv=gv]], opts)

-- Speed up the C-like curly bracket inserts
vim.api.nvim_set_keymap("i", "<C-c>", [[<CR><ESC>O]], opts)
