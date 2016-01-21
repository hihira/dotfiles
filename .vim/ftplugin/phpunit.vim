let g:quickrun_config['php.phpunit'] = {
\ 'hook/cd/directory'              : '%S:p:h',
\ 'command'                        : 'phpunit.sh',
\ 'cmdopt'                         : '',
\ 'exec'                           : '%c %o %s',
\ 'outputter/quickfix/errorformat' : '%f:%l',
\}

