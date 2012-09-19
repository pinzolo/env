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
NeoBundle 'Shougo/neocomplcache-snippets-complete'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tsaleh/vim-matchit'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-haml'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'm2ym/rsense'
NeoBundle 'vim-scripts/sudo.vim'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'groenewege/vim-less'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'ujihisa/unite-rake'
NeoBundle 'basyura/unite-rails'
NeoBundle 'thinca/vim-ref'
NeoBundle 'taq/vim-rspec'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'taichouchou2/vim-rsense'

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
" ノーマルモードでは ; を : として扱う
nnoremap ; :
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
" インサートモードでのカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
" 日時入力
inoremap <expr> ,df strftime('%Y/%m/%d %H:%M:%S')
inoremap <expr> ,dd strftime('%Y/%m/%d')
inoremap <expr> ,dt strftime('%H:%M:%S')
nmap ,df a,df<ESC>
nmap ,dd a,dd<ESC>
nmap ,dt a,dt<ESC>
" 保存時に行末の空白を削除する
autocmd BufWritePre * :%s/\s\+$//ge
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
noremap n Nzz
noremap N nzz
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
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>"   : "\<S-TAB>"
" 改行で確定
inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"
" C-h, BSでは補完候補のウィンドウを閉じる
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<BS>"
" eclipse や visual studio のように Ctrl+Space で保管できるようにする
inoremap <C-SPACE> <C-x><C-o>
" FileType毎のOmni補完を設定
autocmd FileType python     setlocal omnifunc=pythoncomplete#Complete
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html       setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css        setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType xml        setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php        setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType c          setlocal omnifunc=ccomplete#Complete

" RubyではRsenseを使用する {{{
let g:rsenseHome='/usr/local/Cellar/rsense/0.3/libexec'
let g:rsenseUseOmniFunc=1
function! SetUpRubySetting()
  setlocal completefunc=RSenseCompleteFunction
  nmap <buffer>tj :RSenseJumpToDefinition<CR>
  nmap <buffer>tk :RSenseWhereIs<CR>
  nmap <buffer>td :RSenseTypeHelp<CR>
endfunction
autocmd FileType ruby,eruby,ruby.rspec call SetUpRubySetting()
if !exists('g:neocomplcache_omni_functions')
  let g:neocomplcache_omni_functions={}
endif
let g:neocomplcache_omni_functions.ruby='RSenseCompleteFunction'
" }}}

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns={}
endif
let g:neocomplcache_omni_patterns.ruby='[^. *\t]\.\w*\|\h\w*::'
" }}}

" Ruby {{{
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
  elseif &filetype == 'haml'
    let magic_comment = '-'.magic_comment
  elseif &filetype == 'eruby'
    let magic_comment = '<%'.magic_comment.' %>'
  endif
  let line = getline(line_index)
  if line =~ 'coding:'
    return
  endif
  call cursor(line_index, 0)
  execute ':normal O'.magic_comment
  call setpos('.', pos)
endfunction
autocmd BufWritePre *.rb,*.erb,*.haml call AddMagicComment()<CR>
" }}}
