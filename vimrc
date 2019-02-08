set nocompatible               " be iMproved
filetype off                   " required!

" if has('python3')
  " silent! python3 1
" endif

call plug#begin('~/.vim/plugged')

Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer'}
Plug 'mileszs/ack.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Raimondi/delimitMate'
Plug 'tomasr/molokai'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'
" Plug 'scrooloose/syntastic'
Plug 'rust-lang/rust.vim'
Plug 'majutsushi/tagbar'
Plug 'SirVer/ultisnips'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go'
Plug 'terryma/vim-multiple-cursors'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'hdima/python-syntax'
Plug 'pangloss/vim-javascript'
Plug 'kien/rainbow_parentheses.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'nanotech/jellybeans.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'klen/python-mode'
Plug 'Valloric/MatchTagAlways'
Plug 'mxw/vim-jsx'
Plug 'vim-scripts/a.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'qpkorr/vim-bufkill'
Plug 'ryanoasis/vim-devicons'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-repeat'
Plug 'suan/vim-instant-markdown'
Plug 'phleet/vim-mercenary'
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'Yggdroot/indentLine'
Plug 'racer-rust/vim-racer'
Plug 'mattn/webapi-vim'
Plug 'mtscout6/syntastic-local-eslint.vim'
Plug 'tenfyzhong/CompleteParameter.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'Konfekt/FastFold'
Plug 'romainl/vim-qf'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'

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
au Filetype cpp,idl setlocal ts=2 sts=2 sw=2

" enable matchit
if !exists('g:loaded_matchit')
  runtime macros/matchit.vim
endif

" map <F4> tp TlistToggle
map <F4> :TagbarToggle<CR>
map <F3> :NERDTreeToggle<CR>
map <F5> :Autoformat<CR>
set pastetoggle=<F6>

" Enhance command-line completion
set wildmenu
set background=dark
color jellybeans
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
nnoremap <leader>rr :%s/<C-R><C-W>/
" avoid leaking search result to the terminal
" set t_ti= t_te=
" trim trailing spaces
nnoremap <silent> <leader>ts :%s/\s\+$//e<CR>

" navigate windows
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

" Open all features of python.vim
let python_highlight_all = 1

" Tlist internal variables.
let Tlist_Use_Right_Window=1
let Tlist_File_Fole_Auto_Close=1

" NerdTree
let NERDTreeIgnore=['\.pyc$', '\.o$']

" Python-Mode
let g:pymode = 0
let g:pymode_options = 0
let g:pymode_folding = 1
let g:pymode_rope = 0
let g:pymode_lint = 0
let g:pymode_lint_write = 0
let g:pymode_link_checker="pyflakes,pep8"
let g:pymode_rope_goto_definition_cmd = 'e'
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_syntax_slow_sync = 0
nnoremap <silent> <leader>gg :call pymode#rope#goto_definition()<CR>

" Powerline
" let g:Powerline_colorscheme = 'solarized256'
let g:Powerline_symbols = 'fancy'

" Syntastic
" let g:syntastic_python_flake8_args = '--ignore=E123,E251,E501'
" let g:syntastic_c_include_dirs = ['../include', 'include', '../Include', 'Include']
" let g:syntastic_c_compiler_options = ' -std=c99'
" let g:syntastic_cpp_include_dirs = ['../include', 'include', '../Include', 'Include']
" let g:syntastic_cpp_compiler_options = '-std=c++11'
" let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
" let g:syntastic_cpp_compiler = 'clang++'

" Ale
let g:ale_open_list = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_linter_aliases = {'jsx': ['css', 'javascript']}
let g:ale_linters = {'jsx': ['stylelint', 'eslint']}
let g:airline#extensions#ale#enabled = 1

" YouCompleteMe
nnoremap <silent> <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
nnoremap <leader>y :let g:ycm_auto_trigger=0<CR>
nnoremap <leader>Y :let g:ycm_auto_trigger=1<CR>

" UltiSnippet
let g:UltiSnipsExpandTrigger = '<leader>se'
let g:UltiSnipsSnippetsDir = ['~/.vim/bundle/vim-snippets']
let g:UltiSnipsSnippetDirectories = ['UltiSnips']

" CtrlP
" Don't reuse window created by other plugins
let g:ctrlp_reuse_window = ''
nnoremap <leader>ll :CtrlP .<CR>
let g:ctrlp_clear_cache_on_exit = 0
set wildignore+=*/tmp/*,*/build/*,*/*-env/*,*/obj-ff/*,*/obj-ff-dbg/*
let g:ctrlp_custom_ignore = {
    \ 'file': '\v\.(pyc|o|so)$',
    \ 'dir': '\v[\/]\.(git|hg)$|node_modules|obj-ff-dbg',
    \ }
" Boost CtrlP if The Silver Searcher is available
if executable('rg')
  " Let's try ripgrep
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'

  " Use ag over grep
  " set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  " let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" For Mozilla-Central Places
nnoremap <leader>mm :CtrlP toolkit/components/places/<CR>

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
let g:airline_theme='jellybeans'
let g:airline_section_y=''
let g:airline#extensions#ale#enabled = 1

" Move line up and down
nnoremap <silent> <C-S-d> :m .+1<CR>==
nnoremap <silent> <C-S-u> :m .-2<CR>==
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

" vim-indent-guides
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

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
let g:vim_markdown_folding_disabled = 1

" Vim-fzf
map bb :Buffers<CR>

" Alchemist
let g:alchemist_tag_disable = 1

" vim-gutentages
let g:gutentags_cache_dir = '~/.tags_cache'

" vim-racer for rust
set hidden
let g:racer_cmd = "~/.cargo/bin/racer"
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)
let g:racer_experimental_completer = 1

" completearguments
" let g:AutoPairs = {'[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
" inoremap <buffer><silent> ) <C-R>=AutoPairsInsert(')')<CR>
inoremap <silent><expr> ( complete_parameter#pre_complete("()")
smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
imap <c-k> <Plug>(complete_parameter#goto_previous_parameter)

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
let g:tagbar_type_rust = {
    \ 'ctagstype' : 'rust',
    \ 'kinds' : [
        \'T:types,type definitions',
        \'f:functions,function definitions',
        \'g:enum,enumeration names',
        \'s:structure names',
        \'m:modules,module names',
        \'c:consts,static constants',
        \'t:traits',
        \'i:impls,trait implementations',
    \ ]
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

syntax on
filetype plugin indent on
