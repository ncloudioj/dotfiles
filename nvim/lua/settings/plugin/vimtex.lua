vim.api.nvim_exec2(
  [[
    " Use Zathura as the VimTeX PDF viewer
    let g:vimtex_view_method = 'zathura'
    let g:vimtex_compiler_latexmk = {
        \ 'build_dir' : 'outputs',
        \ 'callback' : 1,
        \ 'continuous' : 1,
        \ 'executable' : 'latexmk',
        \ 'hooks' : [],
        \ 'options' : [
        \   '-verbose',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}
  ]],
  { output = false }
)
