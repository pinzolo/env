set lines=64
set columns=224

colorscheme jellybeans

" ツールバーの削除
set guioptions-=T
set guioptions-=m

" コマンドラインの高さ
set cmdheight=3

" フォント設定
if has("win32")
  set guifont=Migu_1M:h9:cSHIFTJIS
elseif has("mac")
  set guifont=MyricaM\ Monospace:h12
else
  set guifont=MyricaM\ Monospace\ 10
endif

" 印刷用フォント
if has("win32")
  set printfont=Migu_1M:h9:cSHIFTJIS
elseif has("mac")
  set printfont=MyricaM\ Monospace:h12
else
  set printfont=MyricaM\ Monospace\ 10
endif
