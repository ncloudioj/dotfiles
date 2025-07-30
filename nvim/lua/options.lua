-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

--Incremental live completion
vim.o.inccommand = "nosplit"

--Set highlight on search
vim.o.hlsearch = true

-- Incremental search
vim.o.incsearch = true

--Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

--Do not save when switching buffers
vim.o.hidden = true

--Enable mouse mode
vim.o.mouse = "a"

-- Show (partial) command in status line
vim.o.showcmd = true

-- Show matching brackets
vim.o.showmatch = true

--Enable break indent
vim.o.breakindent = true

-- Clipboard
vim.cmd([[set clipboard+=unnamedplus]])

--Save undo history
vim.cmd([[set undofile]])

-- Language
vim.cmd([[language en_US.utf-8]])

-- De-clutter mess
vim.cmd([[set shortmess+=c]])

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Tabstops
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.bo.softtabstop = 2
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.expandtab = true
vim.bo.expandtab = true

-- Enhanced command line
vim.o.wildmenu = true
vim.o.background = "dark"
vim.cmd([[set nocursorline]])

-- Window spliting
vim.o.splitright = true
vim.o.splitbelow = true

--Decrease update time (default 4000)
vim.o.updatetime = 300

-- Always show signcolumns
vim.wo.signcolumn = "yes"

--Remap space as leader key
vim.api.nvim_set_keymap("n", "<Space>", "", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Do not insert newline at the end of file
vim.cmd([[set nofixendofline]])

-- Special handling on various Filetypes
vim.api.nvim_exec2(
  [[
    augroup MakeFileAutoCmd
      autocmd!
      autocmd BufRead,BufNewFile Makefile* set noexpandtab
    augroup END
  ]],
  { output = false }
)

-- Treat Mozilla jsm as JS
vim.api.nvim_exec2(
  [[
    augroup JSMAutoCmd
      autocmd!
      autocmd BufNewFile,BufRead *.jsm set ft=javascript
      autocmd BufNewFile,BufRead *.mjs set ft=javascript
    augroup END
  ]],
  { output = false }
)

-- Highlight on yank
vim.api.nvim_exec2(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
  ]],
  { output = false }
)
