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

" plugins
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/rsense'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/junkfile.vim'
NeoBundle 'tsaleh/vim-matchit'
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
NeoBundle 'taq/vim-rspec'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'bling/vim-airline'
NeoBundle 'osyo-manga/unite-fold'

" colorschemes
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'croaker/mustang-vim'
NeoBundle 'jeffreyiacono/vim-colors-wombat'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'vim-scripts/Lucius'
NeoBundle 'vim-scripts/Zenburn'
NeoBundle 'mrkn/mrkn256.vim'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'therubymug/vim-pyte'
NeoBundle 'tomasr/molokai'
NeoBundle 'endel/vim-github-colorscheme'
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
" ノーマルモードでは ; を : として扱う
"nnoremap ; :
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
inoremap <expr> ,df strftime('%Y/%m/%d %H:%M:%S')
inoremap <expr> ,dd strftime('%Y/%m/%d')
inoremap <expr> ,dt strftime('%H:%M:%S')
nmap ,df i,df<ESC>
nmap ,dd i,dd<ESC>
nmap ,dt i,dt<ESC>
" 保存時に行末の空白を削除する
autocmd BufWritePre * :%s/\s\+$//ge
" }}}

" cursor {{{
" インサートモードでのカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
" ペア入力時のカーソル移動
inoremap {} {}<LEFT>
inoremap [] []<LEFT>
inoremap () ()<LEFT>
inoremap "" ""<LEFT>
inoremap '' ''<LEFT>
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
noremap n nzz
noremap N Nzz
" grep 設定
let Grep_Skip_Dirs='.svn .git'
let Grep_Skip_Files='*.bak *~ *.swp *.log'
" }}}

" backup {{{
set backupdir=~/.vim/temp
set directory=~/.vim/temp
set browsedir=buffer
" }}}

" folding {{{
" フォールディングを可能にする
set foldenable
" ブレース3つでのフォールディングを行う
set foldmethod=marker
" }}}

" -------------------------------------------------- plugin settings

" NeoComplCache {{{
" vim起動時にNeoComplCacheを有効にする
let g:neocomplcache_enable_at_startup=1
" 補完が自動で開始される文字数
let g:neocomplcache_auto_completion_start_length=3
" smarrt case有効化。 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplcache_enable_smart_case=1
" アンダースコア区切りの補完を有効にする
let g:neocomplcache_enable_underbar_completion=1
" シンタックスをキャッシュするときの最小文字長を3に
let g:neocomplcache_min_syntax_length=3
" -入力による候補番号の表示
let g:neocomplcache_enable_quick_match=-2
" 補完候補の一番先頭を選択状態にする
let g:neocomplcache_enable_auto_select=1
"ポップアップメニューで表示される候補の数。初期値は100
let g:neocomplcache_max_list=20
" ユーザー定義スニペットの保存先
let g:neocomplcache_snippets_dir='~/.vim/snippets'
" tabで補完高をの移動を行う
inoremap <expr><TAB>   pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
" 改行で確定
inoremap <expr><C-CR> pumvisible() ? neocomplcache#close_popup() : "\<C-CR>"
" BSでは補完候補のウィンドウを閉じる
inoremap <expr><BS> pumvisible() ? neocomplcache#smart_close_popup() : "\<BS>"
" eclipse や visual studio のように Ctrl+Space で保管できるようにする
inoremap <C-SPACE> <C-x><C-o>
if !exists('g:neocomplcache_omni_functions')
  let g:neocomplcache_omni_functions={}
endif
" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns={}
endif
" FileType毎のOmni補完を設定
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html       setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css        setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType xml        setlocal omnifunc=xmlcomplete#CompleteTags

" }}}

" unite.vim {{{
" 垂直分割にする
let g:unite_enable_split_vertically = 1
" unite.vim の prefix key
nnoremap [unite] <Nop>
nmap ; [unite]
" バッファ
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
" ファイル
nnoremap <silent> [unite]f :<C-u>Unite -buffer-name=files file<CR>
" 現在開いているファイルと同じディレクトリから選択
nnoremap <silent> [unite]c :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" 最近使用したファイルから選択
nnoremap <silent> [unite]m :<C-u>Unite buffer file_mru<CR>
" アウトラインから選択
nnoremap <silent> [unite]o :<C-u>Unite outline<CR>
" 折りたたみから選択
nnoremap <silent> [unite]l :<C-u>Unite fold<CR>
" unite-rails {{{
" model 選択
nnoremap <silent> [unite]rm :<C-u>Unite rails/model<CR>
" controller 選択
nnoremap <silent> [unite]rc :<C-u>Unite rails/controller<CR>
" view 選択
nnoremap <silent> [unite]rv :<C-u>Unite rails/view<CR>
" helper 選択
nnoremap <silent> [unite]rh :<C-u>Unite rails/helper<CR>
" db 選択
nnoremap <silent> [unite]rd :<C-u>Unite rails/db<CR>
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

" -------------------------------------------------- language settings

" Ruby {{{

autocmd FileType ruby,haml,eruby,sass,cucumber,mason setlocal ts=2 sts=2 sw=2 nowrap
augroup RSpec
  autocmd!
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END

" RubyではRsenseを使用した補完を行う
let g:rsenseHome='/usr/local/Cellar/rsense/0.3/libexec'
let g:rsenseUseOmniFunc=1
let g:neocomplcache_omni_functions.ruby='RSenseCompleteFunction'
let g:neocomplcache_omni_patterns.ruby='[^. *\t]\.\w*\|\h\w*::'

" マジックコメント自動追加関数
function! AddMagicComment()
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
  execute ':normal O'.magic_comment
  call setpos('.', pos)
endfunction
autocmd BufWritePre *.rb :silent! call AddMagicComment()<CR>
" }}}

" Java {{{
autocmd FileType java setlocal ts=4 sts=4 sw=4
" }}}

" sh {{{
autocmd FileType sh setlocal ts=2 sts=2 sw=2
" }}}

" SQL {{{
autocmd FileType sql setlocal ts=2 sts=2 sw=2
" }}}

" css {{{
autocmd FileType css setlocal ts=2 sts=2 sw=2
" }}}

" scss {{{
autocmd FileType scss setlocal ts=2 sts=2 sw=2
" }}}

" JavaScript {{{
autocmd FileType javascript setlocal ts=2 sts=2 sw=2
" }}}

" coffee script {{{
autocmd FileType coffee setlocal ts=2 sts=2 sw=2
" }}}

" HTML {{{
autocmd FileType html,xhtml setlocal ts=2 sts=2 sw=2
" }}}

" XML {{{
autocmd FileType xml setlocal ts=2 sts=2 sw=2
" }}}
