" vi互換をoff
set nocompatible

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
inoremap <expr> ;df strftime('%Y/%m/%d %H:%M:%S')
inoremap <expr> ;dd strftime('%Y/%m/%d')
inoremap <expr> ;dt strftime('%H:%M:%S')
nmap ;df a;df<ESC>
nmap ;dd a;dd<ESC>
nmap ;dt a;dt<ESC>
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
