if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

setlocal shiftwidth=2 tabstop=2 expandtab wrap

set foldmethod=syntax
set foldlevelstart=1

let javaScript_fold=1         " JavaScript

let g:quickrun_config['javascript.mocha'] = {
    \ 'exec'      : '%c %o %s:p',
    \ 'command'   : 'mocha',
    \ 'cmdopt'    : '--no-colors -R spec',
    \ 'runner'    : 'vimproc',
    \ }
