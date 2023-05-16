local opt_silent = { silent = true }

-- vim-markdown
vim.api.nvim_exec(
  [[
    let g:vim_markdown_folding_disabled = 1
  ]],
  false
)

-- Vim-instant-markdown
vim.api.nvim_exec(
  [[
    let g:instant_markdown_autostart = 0
  ]],
  false
)
vim.api.nvim_set_keymap("n", "<leader>md", ":InstantMarkdownPreview<CR>", opt_silent)
