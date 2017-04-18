" 行末空白削除
command! -nargs=0 RemoveTrailings call s:removeTrailings()
function! s:removeTrailings()
  :%s/\s\+$//ge
endfunction

" 現在開いているファイルのディレクトリをカレントディレクトリにする
command! -nargs=? -complete=dir CCD call s:ChangeCurrentDir('<args>')
function! s:ChangeCurrentDir(directory)
  if a:directory == ''
    lcd %:p:h
  else
    execute 'lcd ' . a:directory
  endif

  pwd
endfunction

" 指定のデータをレジスタに登録する
function! s:Clip(data)
  let @*=a:data
  echo "clipped: " . a:data
endfunction

" 現在開いているファイルのパスをレジスタへ
command! -nargs=0 ClipPath call s:Clip(expand('%:p'))

" 現在開いているファイルのファイル名をレジスタへ
command! -nargs=0 ClipFile call s:Clip(expand('%:t'))

" 現在開いているファイルのディレクトリパスをレジスタへ
command! -nargs=0 ClipDir  call s:Clip(expand('%:p:h'))

" UpでもUPでも保存する
command! -nargs=0 Up execute 'update'
command! -nargs=0 UP execute 'update'
