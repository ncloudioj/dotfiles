vim.api.nvim_exec(
  [[
    let g:airline_powerline_fonts = 1
    let g:airline_detect_modified = 1
    let g:airline_detect_paste = 1
    let g:airline#extensions#whitespace#enabled = 1
    let g:airline#extensions#tabline#enabled = 0
    let g:airline#extensions#tabline#show_buffers = 1
    let g:airline#extensions#tabline#show_tab_type = 1
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline#extensions#tabline#buffer_nr_show = 1
    let g:airline#extensions#tabline#buffer_nr_format = '%s.'
    let g:airline_theme='dracula'
    let g:airline_section_y=''
    let g:airline#extensions#ale#enabled = 1
  ]],
  false
)
