vim.api.nvim_exec(
  [[
    let g:ale_open_list = 0
    let g:ale_lint_on_text_changed = 'never'
    let g:ale_lint_on_insert_leave = 0
    let g:ale_lint_on_enter = 0
    let g:ale_linter_aliases = {'jsx': ['css', 'javascript']}
    let g:ale_linters = {
      \  'dockerfile': ['hadolint'],
      \  'jsx': ['stylelint', 'eslint'],
      \  'javascript': ['prettier', 'eslint'],
      \  'python': ['flake8', 'mypy'],
      \  'rust': ['analyzer'],
      \  'haskell': ['hlint'],
      \  'sh': ['shellcheck'],
      \  'yaml': [],
      \ }
    let g:ale_fixers = {
      \  'python': ['black', 'autopep8', 'isort'],
      \  'javascript': ['prettier', 'eslint']
      \ }
  ]],
  false
)
