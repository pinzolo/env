if &compatible
  set nocompatible
endif

source ~/.config/nvim/plug.vim

filetype plugin indent on
syntax enable

source ~/.config/nvim/base.vim
source ~/.config/nvim/terminal.vim
source ~/.config/nvim/theme.vim
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/languages.vim
source ~/.config/nvim/functions.vim
source ~/.config/nvim/print.vim

" エンコーディングをUTF-8に
set encoding=utf-8

" 新規作成時のエンコード
set fileencoding=utf-8

"その他のエンコード
set fileencodings=utf-8,cp932,euc-jp,shift_jis

