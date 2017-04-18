" emmet.vim {{{
" <C-y>, は打ちにくいので<C-y>2回で展開できるようにする
imap <C-y><C-y> <C-y>,
" }}}

" vim-airline {{{
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_theme = 'dark'
let g:airline#extensions#branch#empty_message = "[!git]"
set laststatus=2
set cmdheight=3
" }}}

