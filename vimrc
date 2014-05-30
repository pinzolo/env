" -------------------------------------------------- pre settings
" vi互換をoff
set nocompatible
autocmd!

" NeoBundle {{{
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle'))
endif

" plugins {{{
NeoBundle 'Shougo/vimproc.vim', {
  \ 'build' : {
    \ 'mac'  : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak'
  \ },
\ }
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/junkfile.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'edsono/vim-matchit'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-haml'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'vim-scripts/sudo.vim'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'groenewege/vim-less'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'ujihisa/unite-rake'
NeoBundle 'basyura/unite-rails'
NeoBundle 'thinca/vim-ref'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'bling/vim-airline'
NeoBundle 'osyo-manga/unite-fold'
NeoBundle 'rcmdnk/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'kmnk/vim-unite-giti'
NeoBundle 'todesking/ruby_hl_lvar.vim'
NeoBundle 'pangloss/vim-javascript'
" }}}

" colorschemes {{{
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle '29decibel/codeschool-vim-theme'
"NeoBundle 'altercation/vim-colors-solarized'
"NeoBundle 'croaker/mustang-vim'
"NeoBundle 'jeffreyiacono/vim-colors-wombat'
"NeoBundle 'vim-scripts/Lucius'
"NeoBundle 'vim-scripts/Zenburn'
"NeoBundle 'therubymug/vim-pyte'
"NeoBundle 'tomasr/molokai'
"NeoBundle 'endel/vim-github-colorscheme'
"NeoBundle 'baskerville/bubblegum'
"NeoBundle 'mitsuhiko/fruity-vim-colorscheme'
"NeoBundle 'vim-scripts/phd'
"NeoBundle 'vim-scripts/twilight'
"NeoBundle 'vim-scripts/rdark'
"NeoBundle 'mrkn/mrkn256.vim'
" }}}
" }}}

" -------------------------------------------------- common settings

" base {{{
syntax on
filetype plugin indent on
" エンコーディングをUTF-8に
set encoding=utf8
" ファイル内容が変更されると自動的に読み込む
set autoread
" 覚えておく履歴の数
set history=1024
" ビープを鳴らさない
set vb t_vb=
" システムのクリップボードを使用する
set clipboard+=unnamed
" ヤンクした場合、システムのクリップボードに入れる
set clipboard=unnamed
" テキスト整形オプションにマルチバイト系を追加
set formatoptions=lmoq
" Exploreの初期ディレクトリをバッファに
set browsedir=buffer
" 改行時にコメントしない
autocmd FileType * set formatoptions-=ro
" }}}

" display {{{
" 行番号を表示する
set number
" 対応する括弧をハイライト表示する
set showmatch
" 不可視文字を表示する
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%
" カーソル行をハイライト表示する
set cursorline
" 現在のウィンドウのみカーソル行をハイライト表示する
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END
" 特殊文字を全角表示
set ambiwidth=double
" コマンド実行中は再描画しない
set lazyredraw
" }}}

" edit {{{
" insertモードを抜けるとIMEオフ
set noimdisable
set iminsert=0 imsearch=0
set noimcmdline
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
" 日時入力
inoremap <expr> ;df strftime('%Y-%m-%d %H:%M:%S')
inoremap <expr> ;dd strftime('%Y-%m-%d')
inoremap <expr> ;dt strftime('%H:%M:%S')
nmap ;df a;df<ESC>
nmap ;dd a;dd<ESC>
nmap ;dt a;dt<ESC>
" 保存時に行末の空白を削除する（ただし Markdown は除外）
autocmd BufWritePre * if &filetype !=? 'markdwon' | %s/\s\+$//ge | endif
" insertモード時に C-v でペースト
inoremap <C-v> <C-r>+
" }}}

" cursor {{{
" インサートモードでのカーソル移動(暫定的にポップアップ対応)
inoremap <C-j> <DOWN>
inoremap <C-k> <UP>
inoremap <C-h> <LEFT>
inoremap <C-l> <RIGHT>
"imap <expr><C-j> pumvisible() ? "\<BS><DOWN>"  : "\<DOWN>"
"imap <expr><C-k> pumvisible() ? "\<BS><UP>"    : "\<UP>"
"imap <expr><C-h> pumvisible() ? "\<BS><LEFT>"  : "\<LEFT>"
"imap <expr><C-l> pumvisible() ? "\<BS><RIGHT>" : "\<RIGHT>"
" ペア入力時のカーソル移動
inoremap {} {}<LEFT>
inoremap [] []<LEFT>
inoremap () ()<LEFT>
inoremap <> <><LEFT>
inoremap "" ""<LEFT>
inoremap '' ''<LEFT>
inoremap <%%> <% %><LEFT><LEFT><LEFT>
" ページ移動時のカーソルをページ中央に
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz
" }}}

" buffer {{{
" バッファ移動
nnoremap <silent> <SPACE><SPACE> :<C-u>bn<CR>
nnoremap <silent> <BS><BS> :<C-u>bp<CR>
" }}}

" tab {{{
" タブの代わりに空白を挿入する
set expandtab
"行頭の余白内でTabを打ち込むと、'shiftwidth'の数だけインデントする
set smarttab
" タブを空白2文字で表示
set tabstop=2
set shiftwidth=2
set softtabstop=2
" }}}

" search {{{
" インクリメンタルサーチを行う
set incsearch
" 検索結果をハイライトする
set hlsearch
" 検索時に文字の大小を区別しない
set ignorecase
" 検索文字に大文字を含んでいたら文字の大小を区別する
set smartcase
" 検索をファイルの先頭へループする
set wrapscan
" ESCを2回で検索のハイライトを非表示にする
nnoremap <silent> <ESC><ESC> :<C-u>set nohlsearch<CR><ESC>
nnoremap / :<C-u>set hlsearch<CR>/
" 検索箇所を常に中央に
nnoremap n nzz
nnoremap N Nzz
" grep 設定
let Grep_Skip_Dirs='.svn .git'
let Grep_Skip_Files='*.bak *~ *.swp *.log *.class'
" }}}

" backup {{{
set backupdir=~/.vim/temp
set directory=~/.vim/temp
set undodir=~/.vim/temp
" }}}

" folding {{{
" フォールディングを可能にする
set foldenable
" ブレース3つでのフォールディングを行う
set foldmethod=marker
" }}}

" -------------------------------------------------- plugin settings

" neocomplete {{{
" vim起動時に有効にする
let g:neocomplete#enable_at_startup=1
" 補完が自動で開始される文字数
let g:neocomplete#auto_completion_start_length=3
" smarrt case有効化。 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplete#enable_smart_case=1
" シンタックスをキャッシュするときの最小文字長を3に
let g:neocomplete#sources#syntax#min_keyword_length=3
" 補完候補の一番先頭を選択状態にする
let g:neocomplete#enable_auto_select=1
"ポップアップメニューで表示される候補の数。初期値は100
let g:neocomplete#max_list=30
" tabで補完候補をの移動を行う
inoremap <expr><TAB>   pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
" 改行で確定(今のところデフォルトで機能している)
"inoremap <expr><C-CR> pumvisible() ? neocomplete#close_popup() : "\<C-CR>"
" BSでは補完候補のウィンドウを閉じる
inoremap <expr><BS> pumvisible() ? neocomplete#cancel_popup() : "\<BS>"
" Ctrl+Space で補完開始
inoremap <expr><C-SPACE> neocomplete#start_manual_complete()
if !exists('g:neocomplete#sources#omni#functions')
  let g:neocomplete#sources#omni#functions={}
endif
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns={}
endif
" }}}

" neosnippet {{{
imap <C-f> <Plug>(neosnippet_expand_or_jump)
" }}}

" unite.vim {{{
" 垂直分割にする
let g:unite_enable_split_vertically = 1
let g:unite_winwidth = 120
" unite.vim の prefix key
nnoremap [unite] <Nop>
nmap ;; [unite]
" バッファ
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
" ファイル
nnoremap <silent> [unite]f :<C-u>Unite -buffer-name=files file<CR>
" ファイル(再帰)
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=files file_rec<CR>
" 現在開いているファイルと同じディレクトリから選択
nnoremap <silent> [unite]c :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" 最近使用したファイルから選択
nnoremap <silent> [unite]m :<C-u>Unite buffer file_mru<CR>
" アウトラインから選択
nnoremap <silent> [unite]o :<C-u>Unite outline<CR>
" 折りたたみから選択
nnoremap <silent> [unite]l :<C-u>Unite fold<CR>
" grep
nnoremap <silent> [unite]g :<C-u>Unite grep<CR>

" unite-rails {{{
nnoremap [unite-rails] <Nop>
nmap ;r [unite-rails]
" model 選択
nnoremap <silent> [unite-rails]m :<C-u>Unite rails/model<CR>
" controller 選択
nnoremap <silent> [unite-rails]c :<C-u>Unite rails/controller<CR>
" view 選択
nnoremap <silent> [unite-rails]v :<C-u>Unite rails/view<CR>
" helper 選択
nnoremap <silent> [unite-rails]h :<C-u>Unite rails/helper<CR>
" db 選択
nnoremap <silent> [unite-rails]d :<C-u>Unite rails/db<CR>
" }}}

" unite-giti {{{
nnoremap [unite-giti] <Nop>
nmap ;g [unite-giti]
nnoremap <silent> [unite-giti]b :<C-u>Unite giti/branch<CR>
nnoremap <silent> [unite-giti]s :<C-u>Unite giti/status<CR>
nnoremap <silent> [unite-giti]r :<C-u>Unite giti/remote<CR>
nnoremap <silent> [unite-giti]l :<C-u>Unite giti/log<CR>
" }}}
" }}}

" emmet.vim {{{
" <C-y>, は打ちにくいので<C-y>2回で展開できるようにする
imap <C-y><C-y> <C-y>,
" }}}

" vim-airline {{{
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_theme = 'dark'
let g:airline_branch_empty_message = "[!git]"
" }}}

" quickrun {{{
let g:quickrun_config = {}
let g:quickrun_config._ = {'runner' : 'vimproc'}
let g:quickrun_config['ruby.rspec'] = { 'command': 'rspec', 'cmdopt': 'bundle exec', 'exec': '%o %c %s' }
" }}}

" vimshell {{{
let g:vimshell_prompt_expr = 'getcwd()." % "'
let g:vimshell_prompt_pattern = '^\f\+ % '
"let g:vimshell_split_command = "split"
nnoremap [vimshell] <Nop>
nmap ;s [vimshell]
nnoremap <silent> [vimshell]s :<C-u>VimShell<CR>
nnoremap <silent> [vimshell]r :<C-u>VimShellInteractive irb<CR>
" }}}

" vimfiler {{{
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_as_default_explorer = 1
nnoremap [vimfiler] <Nop>
nmap ;f [vimfiler]
nnoremap [vimfiler]f :<C-u>VimFiler<CR>
nnoremap <silent> [vimfiler]e :<C-U>VimFiler -buffer-name=explorer -split -simple -winwidth=40 -toggle -no-quit<CR>
" }}}

" vim-markdown {{{
let g:vim_markdown_folding_disabled=1
" }}}

" ruby_hl_lvar {{{
let g:ruby_hl_lvar_hl_group = 'rubyLocalVariable'
" }}}

" jellybeans {{{
let g:jellybeans_overrides = {
\    'rubyLocalVariable': { 'guifg': 'c59f6f', 'guibg': '',
\              'ctermfg': '', 'ctermbg': 'Yellow',
\              'attr': '' },
\}
" }}}

" -------------------------------------------------- language settings

" Ruby {{{
autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
let g:rubycomplete_rails = 0
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_include_object = 1
let g:rubycomplete_include_object_space = 1
let g:neocomplete#sources#omni#input_patterns.ruby='[^. *\t]\.\w*\|\h\w*::'

autocmd FileType ruby,haml,eruby,sass,cucumber,mason setlocal ts=2 sts=2 sw=2 nowrap
augroup RSpec
  autocmd!
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END

" RubyではRsenseを使用した補完を行う
"let g:rsenseHome='/usr/local/Cellar/rsense/0.3/libexec'
"let g:rsenseUseOmniFunc=1
"let g:neocomplcache_omni_functions.ruby='RSenseCompleteFunction'

" マジックコメント自動追加関数
function! s:AddMagicComment()
  let pos = getpos('.')
  let line_index = 1
  let magic_comment = '# coding: utf-8'
  if &filetype == 'ruby'
    let line = getline(line_index)
    if line[0:1] == '#!'
      let line_index = 2
    endif
  endif
  let line = getline(line_index)
  if line =~ 'coding:'
    return
  endif
  call cursor(line_index, 0)
  execute ':normal O' . magic_comment
  call setpos('.', pos)
  execute ':normal j'
endfunction
" 暫定解除（しばらく様子見る）
"autocmd BufWritePre *.rb call s:AddMagicComment()
" }}}

" Java {{{
autocmd FileType java setlocal ts=4 sts=4 sw=4
au BufNewFile,BufRead *.ftl setlocal ft=jsp
" }}}

" sh {{{
autocmd FileType sh setlocal ts=2 sts=2 sw=2
" }}}

" SQL {{{
autocmd FileType sql setlocal ts=2 sts=2 sw=2
" }}}

" css {{{
autocmd FileType css setlocal ts=2 sts=2 sw=2 omnifunc=csscomplete#CompleteCSS
" }}}

" scss {{{
autocmd FileType scss setlocal ts=2 sts=2 sw=2
" }}}

" JavaScript {{{
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 omnifunc=javascriptcomplete#CompleteJS
" }}}

" coffee script {{{
autocmd FileType coffee setlocal ts=2 sts=2 sw=2
" }}}

" HTML {{{
autocmd FileType html,xhtml setlocal ts=2 sts=2 sw=2 omnifunc=htmlcomplete#CompleteTags
" }}}

" XML {{{
autocmd FileType xml setlocal ts=2 sts=2 sw=2 omnifunc=xmlcomplete#CompleteTags
" }}}

" -------------------------------------------------- functions

" 現在開いているファイルのディレクトリをカレントディレクトリにする
command! -nargs=? -complete=dir CCD call s:ChangeCurrentDir('<args>')
function! s:ChangeCurrentDir(directory)
  if a:directory == ''
    lcd %:p:h
  else
    execute 'lcd ' . a:directory
  endif

  pwd
endfunction

" 指定のデータをレジスタに登録する
function! s:Clip(data)
  let @*=a:data
  echo "clipped: " . a:data
endfunction

" 現在開いているファイルのパスをレジスタへ
command! -nargs=0 ClipPath call s:Clip(expand('%:p'))
" 現在開いているファイルのファイル名をレジスタへ
command! -nargs=0 ClipFile call s:Clip(expand('%:t'))
" 現在開いているファイルのディレクトリパスをレジスタへ
command! -nargs=0 ClipDir  call s:Clip(expand('%:p:h'))
