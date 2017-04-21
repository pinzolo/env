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

" deoplete {{{
let g:deoplete#enable_at_startup = 1
" }}}

" neoterm {{{
let g:neoterm_position = 'vertical'
let g:neoterm_automap_keys = ';tt'
"}}}

" ctrlp {{{
" キャッシュディレクトリ
let g:ctrlp_cahce_dir = '~/.cache/ctrlp'
" キャッシュを終了時にクリアしない
let g:ctrlp_clear_cache_on_exit = 0
" 遅延再描画
let g:ctrlp_lazy_update = 1
let g:ctrlp_working_path_mode = 'ra'
" 新規ファイルは current window に表示
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20'
"}}}
