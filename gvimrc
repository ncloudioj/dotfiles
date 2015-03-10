set guioptions-=T " hide toolbar
set guioptions-=r
set guioptions-=L

set mouse=a		" Enable mouse usage
set lines=40 columns=120 
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h14

" Move line up and down
nnoremap <silent> <D-j> :m .+1<CR>==
nnoremap <silent> <D-k> :m .-2<CR>==
inoremap <silent> <D-j> <Esc>:m .+1<CR>==gi
inoremap <silent> <D-k> <Esc>:m .-2<CR>==gi
vnoremap <silent> <D-j> :m '>+1<CR>gv=gv
vnoremap <silent> <D-k> :m '<-2<CR>gv=gv
