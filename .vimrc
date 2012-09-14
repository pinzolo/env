set nocompatible

" {{{ NeoBundle Settings
filetype off
set rtp+=~/git_repos/env/neobundle.vim

if has('vim_starting')
    set runtimepath+=~/git_repos/env/neobundle.vim
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

filetype plugin indent on
