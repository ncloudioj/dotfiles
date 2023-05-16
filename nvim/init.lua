-- Install packer
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

require("options")
require("plugins")
require("mappings")

require("settings.plugin.ale")
require("settings.plugin.bufferline")
require("settings.plugin.dap")
require("settings.plugin.easymotion")
require("settings.plugin.fzf")
require("settings.plugin.gitsigns")
require("settings.plugin.lspconfig")
require("settings.plugin.markdown")
require("settings.plugin.mason")
require("settings.plugin.nerdcommenter")
require("settings.plugin.nullls")
require("settings.plugin.nvimcmp")
require("settings.plugin.nvimtree")
require("settings.plugin.rusttools")
require("settings.plugin.telescope")
require("settings.plugin.treesitter")
require("settings.plugin.vimairline")
require("settings.plugin.vimtex")
