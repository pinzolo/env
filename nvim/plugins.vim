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
let g:deoplete#enable_smart_case = 1
inoremap <expr><C-SPACE> deoplete#mappings#manual_complete()
" }}}

" denite {{{
call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

call denite#custom#map('insert', "<ESC>", '<denite:enter_mode:normal>', 'noremap')
call denite#custom#map('insert', "<C-h>", '<denite:do_action:split>', 'noremap')
call denite#custom#map('insert', "<C-j>", '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', "<C-k>", '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', "<C-v>", '<denite:do_action:vsplit>', 'noremap')
call denite#custom#map('normal', "<ESC>", '<denite:quit>', 'noremap')
call denite#custom#map('normal', "<C-h>", '<denite:do_action:split>', 'noremap')
call denite#custom#map('normal', "<C-v>", '<denite:do_action:vsplit>', 'noremap')

nnoremap [denite] <Nop>
nmap ;; [denite]
nnoremap <silent> [denite]b :<C-u>Denite buffer<CR>
nnoremap <silent> [denite]d :<C-u>DeniteBufferDir file_rec<CR>
nnoremap <silent> [denite]f :<C-u>Denite file_rec<CR>
nnoremap <silent> [denite]g :<C-u>Denite grep<CR>
nnoremap <silent> [denite]m :<C-u>Denite file_mru<CR>
nnoremap <silent> [denite]o :<C-u>Denite outline<CR>
nnoremap <silent> [denite]r :<C-u>Denite -resume<CR>
nnoremap <silent> [denite]w :<C-u>DeniteCursorWord grep<CR>

nnoremap [denite-rails] <Nop>
nmap ;r [denite-rails]
nnoremap <silent> [denite-rails]a :<C-u>Denite file_rec:app/assets<CR>
nnoremap <silent> [denite-rails]m :<C-u>Denite file_rec:app/models<CR>
nnoremap <silent> [denite-rails]c :<C-u>Denite file_rec:app/controllers<CR>
nnoremap <silent> [denite-rails]v :<C-u>Denite file_rec:app/views<CR>

"}}}

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
" .gitignoreに登録されているファイルを無視する
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
"}}}
