if filereadable('~/.config/autoload/plug.vim')
  call plug#begin('~/.config/nvim/plugged')

  Plug 'Shougo/deoplete.nvim'
  Plug 'bling/vim-airline'
  Plug 'cohama/lexima.vim'
  Plug 'fatih/vim-go', { 'for': ['go'] }
  Plug 'h1mesuke/vim-alignta'
  Plug 'kien/ctrlp.vim'
  Plug 'mattn/emmet-vim'
  Plug 'nanotech/jellybeans.vim'
  Plug 'scrooloose/syntastic'
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'zchee/deoplete-go', { 'for': ['go'] }

  call plug#end()
endif
