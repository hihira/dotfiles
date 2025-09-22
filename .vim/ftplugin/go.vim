if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

setlocal shiftwidth=8 tabstop=8 softtabstop=8 noexpandtab nolist

" 構文ベースの折り畳み
setlocal foldmethod=syntax

augroup go_fmt
  autocmd!
  autocmd BufWritePre *.go :silent! execute '%!goimports'
augroup END
