" JavaScript {{{
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 omnifunc=javascriptcomplete#CompleteJS
" }}}

" HTML {{{
autocmd FileType html,xhtml setlocal ts=2 sts=2 sw=2 omnifunc=htmlcomplete#CompleteTags
" }}}

" XML {{{
autocmd FileType xml setlocal ts=2 sts=2 sw=2 omnifunc=xmlcomplete#CompleteTags
" }}}

" golang {{{
" Go はハードタブ。4スペースの方が見やすい
autocmd FileType go setl noexpandtab tabstop=4 shiftwidth=4
autocmd FileType go :highlight goErr guifg=#ffd700 ctermfg=196
autocmd FileType go :match goErr /\<err\>/

" Go では ctags の代わりに gotags を使用する
autocmd FileType go call denite#custom#var('outline', 'command', ['gotags'])
autocmd FileType go call denite#custom#var('outline', 'file_opt', '-f')

let $GOPATH = expand("~/dev/go")
let $PATH = expand("$GOPATH/bin") . ":" . $PATH

" 未インポートも補完可能にする
let g:go_gocode_unimported_packages = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:syntastic_go_checkers = [ 'go', 'golint', 'govet']
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"

autocmd FileType go nmap <Leader>t <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go nmap <Leader>d <Plug>(go-def)
autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
autocmd FileType go nmap <Leader>n <Plug>(go-rename)
" }}}
