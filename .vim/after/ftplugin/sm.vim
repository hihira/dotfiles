setlocal shiftwidth=2 tabstop=2 expandtab wrap

let g:quickrun_config['sm'] = {
    \ 'exec'                            : '%c %o %s:p',
    \ 'command'                         : 'java',
    \ 'cmdopt'                          : '-jar ~/java/lib/Smc.jar -graph',
    \ 'runner'                          : 'vimproc',
    \ 'outputter/buffer/close_on_empty' : 1,
    \ }
