set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'mileszs/ack.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'tomasr/molokai'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'rust-lang/rust.vim'
Plugin 'majutsushi/tagbar'
Plugin 'SirVer/ultisnips'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'fatih/vim-go'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'hdima/python-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'nanotech/jellybeans.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'elixir-lang/vim-elixir'
Plugin 'klen/python-mode'
Plugin 'Valloric/MatchTagAlways'
Plugin 'mxw/vim-jsx'
Plugin 'vim-scripts/a.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'qpkorr/vim-bufkill'
Plugin 'ryanoasis/vim-devicons'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-repeat'

call vundle#end()
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

" enable matchit
if !exists('g:loaded_matchit')
  runtime macros/matchit.vim
endif

" map <F4> tp TlistToggle
map <F4> :TagbarToggle<CR>
map <F3> :NERDTreeToggle<CR>
set pastetoggle=<F5>

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
vnoremap <leader>yy "+y
noremap <leader>pp "+p
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
let g:ackprg = 'ag --nogroup --column'
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
let g:syntastic_python_flake8_args = '--ignore=E123,E251,E501'
let g:syntastic_c_include_dirs = ['../include', 'include', '../Include', 'Include']
let g:syntastic_c_compiler_options = ' -std=c99'
let g:syntastic_cpp_include_dirs = ['../include', 'include', '../Include', 'Include']
let g:syntastic_cpp_compiler_options = '-std=c++11'
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
" let g:syntastic_cpp_compiler = 'clang++'

" YouCompleteMe
nnoremap <silent> <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_show_diagnostics_ui = 0
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
set wildignore+=*/tmp/*,*/build/*,*/*-env/*
let g:ctrlp_custom_ignore = {
    \ 'file': '\v\.(pyc|o|so)$',
    \ 'dir': '\v[\/]\.(git|hg)$|node_modules',
    \ }

" NerdCommenter
let NERDSpaceDelims = 1
let NERDRemoveExtraSpaces = 0
let g:NERDCustomDelimiters = {
    \ 'c': { 'left': '/* ', 'right': '*/', 'leftAlt': '//', 'rightAlt': '//' }
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

syntax on
filetype plugin indent on
