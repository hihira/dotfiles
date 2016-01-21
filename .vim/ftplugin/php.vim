if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

setlocal shiftwidth=4 tabstop=4 expandtab wrap

let php_sql_query = 1
let php_baselib = 1
let php_htmlInStrings = 1
let php_noShortTags = 0
let php_parent_error_close = 1
let php_parent_error_open = 1
let php_folding = 1
"let php_sync_method = x

" for QuickFix
setlocal makeprg=php\ -l\ %
setlocal errorformat=%m\ in\ %f\ on\ line\ %l

augroup phpsyntaxcheck
  autocmd!
  autocmd BufWritePost <buffer> silent make! -c "%" | redraw!
augroup END

augroup quickfixopen
  autocmd!
  autocmd QuickfixCmdPost make cw
augroup END
