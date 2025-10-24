set encoding=utf-8
scriptencoding utf-8

if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

setlocal shiftwidth=8 tabstop=8 softtabstop=8 noexpandtab nolist

" 構文ベースの折り畳み
" if, for ごとに折り畳まれると、細かすぎてストレスなのでやめる
"setlocal foldmethod=syntax
" Fold only functions for Go
setlocal foldmethod=expr
setlocal foldexpr=GoFoldExpr(v:lnum)

function! GoFoldExpr(lnum)
  let line = getline(a:lnum)
  " funcで始まる行だけfold start
  if line =~? '^\s*func\s\+'
    return '>1'
  endif

  " 関数内部はfold継続
  if indent(a:lnum) > indent(search('^\s*func\s\+', 'bnW'))
    return 1
  endif

  return 0
endfunction

augroup go_fmt
  autocmd!
  autocmd BufWritePre *.go :silent! execute '%!gofmt'
augroup END
