" ファイル内容が変更されると自動的に読み込む
set autoread

" 覚えておく履歴の数
set history=4096

" ビープを鳴らさない
set vb t_vb=

" システムのクリップボードを使用する
set clipboard+=unnamed

" テキスト整形オプションにマルチバイト系を追加
set formatoptions=lmoq

" Exploreの初期ディレクトリをバッファに
set browsedir=buffer

" 改行時にコメントしない
autocmd FileType * set formatoptions-=ro

" 行番号を表示する
set number

" 対応する括弧をハイライト表示する
set showmatch

" 不可視文字を表示する
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%

" 日本語文字化け対応
" see: https://hori-ryota.com/blog/neovim-fix-input-broken-ttimeout/
set ttimeout
set ttimeoutlen=50

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

" insertモードを抜けるとIMEオフ
set noimdisable
set iminsert=0 imsearch=0
set noimcmdline
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

" 日時入力
inoremap [date] <Nop>
imap ;d [date]
nnoremap [date] <Nop>
nmap ;d [date]
inoremap <expr> [date]f strftime('%Y-%m-%d %H:%M:%S')
inoremap <expr> [date]d strftime('%Y-%m-%d')
inoremap <expr> [date]t strftime('%H:%M:%S')
nmap [date]f a;df<ESC>
nmap [date]d a;dd<ESC>
nmap [date]t a;dt<ESC>

" Y で行末までヤンク
nnoremap Y y$

" ページ移動時のカーソルをページ中央に
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz

" タブの代わりに空白を挿入する
set expandtab

"行頭の余白内でTabを打ち込むと、'shiftwidth'の数だけインデントする
set smarttab

" タブを空白2文字で表示
set tabstop=2
set shiftwidth=2
set softtabstop=2

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

" backup ファイルは作成しない
set nobackup
" swap ファイル保存先
set directory=~/.local/share/nvim/swap
" undo ファイル保存先
set undofile
set undodir=~/.local/share/nvim/undo

" フォールディングを可能にする
set foldenable
" ブレース3つでのフォールディングを行う
set foldmethod=marker

" vimdiff
if &diff
  map <leader>1 :diffget LOCAL<CR>
  map <leader>2 :diffget BASE<CR>
  map <leader>3 :diffget REMOTE<CR>
endif

