call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neomru.vim'
Plug 'bling/vim-airline'
Plug 'cohama/lexima.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'fatih/vim-go', { 'for': ['go'] }
Plug 'h1mesuke/vim-alignta'
Plug 'mattn/emmet-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'zchee/deoplete-go', { 'for': ['go'] }
Plug 'w0rp/ale'

call plug#end()
