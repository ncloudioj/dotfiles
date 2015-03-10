set nocompatible               " be iMproved
filetype off                   " required!

" enable the pathogen
call pathogen#infect()
call pathogen#helptags()

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
au BufRead,BufNewFile Makefile* set noexpandtab
au BufRead,BufNewFile *.snippets set noexpandtab
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.rb,*.erb,*.R,*.erl,*.go set textwidth=79
set expandtab           " enter spaces when tab is pressed
set textwidth=80        " break lines when line length increases
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line

" map <F4> tp TlistToggle
map <F4> :TagbarToggle<CR>
map <F3> :NERDTreeToggle<CR>
set pastetoggle=<F5>

" Enhance command-line completion
set wildmenu
set background=dark
let g:solarized_termcolors=256
color jellybeans  " wombat256
set cursorline
set t_Co=256

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
" open a new file
map <leader>fn :enew<CR>
" speedup the buffer navigation
noremap ;; <Esc>:bp<CR>
noremap '' <Esc>:bn<CR>
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

" python-mod
" enable/disable python folding
let g:pymode_options = 0
let g:pymode_folding = 1
let g:pymode_rope = 0
let g:pymode_lint = 0
let g:pymode_lint_write = 0
let g:pymode_link_checker="pyflakes,pep8"
let g:pymode_rope_goto_definition_cmd = 'e'
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
nnoremap <silent> <leader>gg :call pymode#rope#goto_definition()<CR>

" Powerline
" let g:Powerline_colorscheme = 'solarized256'
let g:Powerline_symbols = 'fancy'

" Syntastic
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': [] }
let g:syntastic_python_flake8_args = '--ignore=E123,E251,E501'
let g:syntastic_c_include_dirs = ['../include', 'include', '../Include', 'Include']
let g:syntastic_c_compiler_options = ' -std=c99'
let g:syntastic_cpp_include_dirs = ['../include', 'include', '../Include', 'Include']
let g:syntastic_cpp_compiler_options = '-std=c++11'
" let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler = 'g++-mp-4.8'

" YouCompleteMe
nnoremap <silent> <leader>dd :YcmCompleter GoToDefinitionElseDeclaration<CR>
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
nnoremap <leader>ll :CtrlP .<CR>
set wildignore+=*/tmp/*,*/build/*
let g:ctrlp_custom_ignore = {
    \ 'file': '\v\.(pyc|o|so)$',
    \ 'dir': '\v[\/]\.(git|hg)$',
    \ }

" NerdCommenter
let NERDSpaceDelims = 1
let NERDRemoveExtraSpaces = 1

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_detect_modified = 1
let g:airline_detect_paste = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='jellybeans'

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

syntax on
filetype plugin indent on
