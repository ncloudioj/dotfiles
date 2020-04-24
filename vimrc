set nocompatible               " be iMproved
filetype off                   " required!

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mileszs/ack.vim'
Plug 'Raimondi/delimitMate'
Plug 'tomasr/molokai'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'
Plug 'rust-lang/rust.vim'
Plug 'majutsushi/tagbar'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go'
Plug 'terryma/vim-multiple-cursors'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'pangloss/vim-javascript'
Plug 'kien/rainbow_parentheses.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'nanotech/jellybeans.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Yggdroot/indentLine'
Plug 'Valloric/MatchTagAlways'
Plug 'mxw/vim-jsx'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'qpkorr/vim-bufkill'
Plug 'ryanoasis/vim-devicons'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-repeat'
Plug 'suan/vim-instant-markdown'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mattn/webapi-vim'
Plug 'Konfekt/FastFold'
Plug 'romainl/vim-qf'
Plug 'prabirshrestha/async.vim'
Plug 'morhetz/gruvbox'
Plug 'puremourning/vimspector'
" Mac OS X
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
" Linux
" Plug '~/.fzf' | Plug 'junegunn/fzf.vim'

call plug#end()
filetype plugin indent on

set showcmd		    " Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set hlsearch        " Highlight all searches
nnoremap <silent> <F2> :nohl<CR>
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden          " Hide buffers when they are abandoned
set mouse=a         " Enable mouse in all modes

set nocompatible
set ai " auto indent
set ci " c indent
set tabstop=4
set nu
" filetype plugin indent on
set shiftwidth=4
set ruler
set fencs=utf-8,cp936
set laststatus=2
set encoding=utf-8
set splitright
set backspace=indent,eol,start

" configure expanding of tabs for various file types
set expandtab           " enter spaces when tab is pressed
" set textwidth=80        " break lines when line length increases
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line
au BufRead,BufNewFile Makefile* set noexpandtab
au BufRead,BufNewFile *.snippets, *.tsv set noexpandtab
au BufRead,BufNewFile *.c,*.h,*.rb,*.erb,*.R,*.erl,*.go set textwidth=79
au Filetype javascript setlocal ts=2 sts=2 sw=2
au Filetype json setlocal ts=2 sts=2 sw=2
au Filetype cpp,idl,yaml setlocal ts=2 sts=2 sw=2
autocmd Filetype json let g:indentLine_enabled = 0

" enable matchit
if !exists('g:loaded_matchit')
  runtime macros/matchit.vim
endif

map <F3> :NERDTreeToggle<CR>
map <F4> :TagbarToggle<CR>
set pastetoggle=<F1>

" Enhance command-line completion
set wildmenu
set background=dark
" color jellybeans
color gruvbox
set nocursorline
set t_Co=256
" Clearing the background color
set t_ut=y

let mapleader = ","
nnoremap Y y$
" in the visual model, yank the selection to the '*' register
set clipboard=unnamed
vnoremap <leader>yy "*y
noremap <leader>pp "*p
" Bash, Emacs bindings
inoremap <C-a> <C-o>I
inoremap <C-e> <C-o>A
inoremap jj <Esc>
nnoremap <space> :
" Speedup the C-like curly bracket inserts
imap <C-c> <CR><Esc>O
" speedup the buffer navigation
noremap ;; <Esc>:bp<CR>
noremap '' <Esc>:bn<CR>
" Don't lose selection when shifting sidewards
xnoremap <  <gv
xnoremap >  >gv
" Ack
" let g:ackprg = 'ag --path-to-ignore ~/.agignore --nogroup --column'
let g:ackprg = 'rg --no-heading --with-filename --column'
nnoremap <leader>ft :Ack! 
nnoremap <leader>ff :Ack! <C-R><C-W><CR>
" find current term in a sepcified directory
nnoremap <leader>fd :Ack! <C-R><C-W> 
" find the exact term
nnoremap <leader>fe /\<<C-R><C-W>\>
" replace current term
nnoremap <leader>fr :%s/<C-R><C-W>/
" search in m-c/newtab
nnoremap <leader>fm :Ack! <C-R><C-W> browser/components/newtab/<CR>
nnoremap <leader>fn :Ack!  browser/components/newtab/<S-Left><S-Left>
" avoid leaking search result to the terminal
" set t_ti= t_te=
" trim trailing spaces
nnoremap <silent> <leader>ts :%s/\s\+$//e<CR>

" navigate windows
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

" quick move in insert mode
imap <C-h> <C-o>h
imap <C-j> <C-o>j
imap <C-k> <C-o>k
imap <C-l> <C-o>l

" Tlist internal variables.
let Tlist_Use_Right_Window=1
let Tlist_File_Fole_Auto_Close=1

" NerdTree
let NERDTreeIgnore=['\.pyc$', '\.o$']
let g:NERDTreeRespectWildIgnore = 1

" Ale
let g:ale_open_list = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_linter_aliases = {'jsx': ['css', 'javascript']}
let g:ale_linters = {
    \ 'jsx': ['stylelint', 'eslint'],
    \ 'javascript': ['prettier', 'eslint'],
    \ }
let g:airline#extensions#ale#enabled = 1

" NerdCommenter
let NERDSpaceDelims = 1
let NERDRemoveExtraSpaces = 0
let g:NERDCustomDelimiters = {
    \ 'c': { 'left': '/* ', 'right': '*/', 'leftAlt': '//', 'rightAlt': '//' },
    \ 'rust': { 'left': '//', 'leftAlt': '///' }
    \ }

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_detect_modified = 1
let g:airline_detect_paste = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s.'
let g:airline_theme='gruvbox'
let g:airline_section_y=''
let g:airline#extensions#ale#enabled = 1

" Move line up and down
" nnoremap <silent> <C-S-d> :m .+1<CR>==
" nnoremap <silent> <C-S-u> :m .-2<CR>==
inoremap <silent> <C-S-d> <Esc>:m .+1<CR>==gi
inoremap <silent> <C-S-u> <Esc>:m .-2<CR>==gi
vnoremap <silent> <C-S-d> :m '>+1<CR>gv=gv
vnoremap <silent> <C-S-u> :m '<-2<CR>gv=gv

" vim-go
let g:go_fmt_command = "goimports"
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

" vim-jsx
let g:jsx_ext_required = 0

" vim-devicon
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
let g:webdevicons_enable_ctrlp = 1

" vim-jsx
" Allow JSX in normal JS files"
let g:jsx_ext_required = 0

" EasyMotion
" Disable default mappings
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
" Make 's' as the trigger
nmap s <Plug>(easymotion-overwin-f)
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" rust.vim
let g:rustfmt_autosave = 0
let g:rust_clip_command = 'pbcopy'
let g:rust_fold = 1

" Vim-instant-markdown
let g:instant_markdown_autostart = 0
nnoremap <silent> <Leader>md :InstantMarkdownPreview<CR>

" vim-markdown
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_folding_disabled = 1

" Vim-fzf
nmap <silent> bb :Buffers<CR>
nmap <silent> <C-p> :Files<CR>

" vim-gutentages
let g:gutentags_cache_dir = '~/.tags_cache'
let g:gutentags_ctags_exclude = ['*/node_modules/*', '*/mozilla-central/*']

" gotags
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

" rusttags
let g:rust_use_custom_ctags_defs = 1  " if using rust.vim
let g:tagbar_type_rust = {
  \ 'ctagsbin' : '/usr/local/bin/ctags',
  \ 'ctagstype' : 'rust',
  \ 'kinds' : [
      \ 'n:modules',
      \ 's:structures:1',
      \ 'i:interfaces',
      \ 'c:implementations',
      \ 'f:functions:1',
      \ 'g:enumerations:1',
      \ 't:type aliases:1:0',
      \ 'v:constants:1:0',
      \ 'M:macros:1',
      \ 'm:fields:1:0',
      \ 'e:enum variants:1:0',
      \ 'P:methods:1',
  \ ],
  \ 'sro': '::',
  \ 'kind2scope' : {
      \ 'n': 'module',
      \ 's': 'struct',
      \ 'i': 'interface',
      \ 'c': 'implementation',
      \ 'f': 'function',
      \ 'g': 'enum',
      \ 't': 'typedef',
      \ 'v': 'variable',
      \ 'M': 'macro',
      \ 'm': 'field',
      \ 'e': 'enumerator',
      \ 'P': 'method',
  \ },
\ }

" FastFold
let g:markdown_folding = 1
let g:vimsyn_folding = 'af'
let g:javaScript_fold = 1
let g:sh_fold_enabled= 7
let g:rust_fold = 1
let g:fastfold_fold_command_suffixes = ['x','X','a','A','o','O','c','C','r','R','m','M','i','n','N']

" vim-qf
nmap qa <Plug>(qf_qf_toggle)
nmap qq <Plug>(qf_loc_toggle)
let g:qf_mapping_ack_style = 1
let g:qf_shorten_path = 0

" gruvbox
let g:gruvbox_contrast_dark = 'hard'

" vimspector
" let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
nmap <F5> <Plug>VimspectorContinue
nmap <F6> <Plug>VimspectorStop
nmap <F7> <Plug>VimspectorRestart
nmap <F8> :VimspectorReset<CR>
nmap <F9> <Plug>VimspectorToggleBreakpoint
nmap <F10> <Plug>VimspectorStepOver
nmap <F11> <Plug>VimspectorStepInto
nmap <F12> <Plug>VimspectorStepOut

" coc.nvim

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" use `:Prettier` to lint the file
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Highlight jsonc comments
autocmd FileType json syntax match Comment +\/\/.\+$+

" end of coc.nvim

" coc-snippets

" Use <C-l> for trigger snippet expand.
imap <leader>se <Plug>(coc-snippets-expand)
" Use <C-S-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<C-S-j>'
" Use <C-S-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<C-S-k>'

" end of coc-snippets

syntax on
filetype plugin indent on
