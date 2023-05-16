vim.api.nvim_exec(
  [[
    let NERDSpaceDelims = 1
    let NERDRemoveExtraSpaces = 0
    let g:NERDCustomDelimiters = { 'c': { 'left': '/* ', 'right': '*/', 'leftAlt': '//', 'rightAlt': '//' }, 'rust': { 'left': '//', 'leftAlt': '///' } }
  ]],
  false
)

