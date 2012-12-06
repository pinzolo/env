colorscheme jellybeans
set lines=60
set columns=160

" ツールバーの削除
set guioptions-=T
set guioptions-=m

" コマンドラインの高さ
set cmdheight=3

" フォント設定
if has("win32")
  set guifont=M+2VM+IPAG_circle:h10:cSHIFTJIS
else
  "set guifont=M+2VM+IPAG\ circle\ 10
  set guifont=Ricty\ 10
endif

" 印刷用フォント
if has("win32")
  set printfont=M+2VM+IPAG_circle:h10:cSHIFTJIS
else
  "set printfont=M+2VM+IPAG\ circle\ 10
  set printfont=Ricty\ 10
endif
