vim.api.nvim_exec(
  [[
    " Disable default mappings
    let g:EasyMotion_do_mapping = 0
    let g:EasyMotion_smartcase = 1
    " Make 's' as the trigger
    nmap s <Plug>(easymotion-overwin-f)
  ]],
  false
)

