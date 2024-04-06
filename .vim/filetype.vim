if exists("did_load_filetypes")
    finish
endif

augroup filetypedetect
    au BufRead,BufNewFile *.tpl,*.phtml set filetype=php
    au BufRead,BufNewFile *Test.php setlocal filetype=php.phpunit
    au BufRead,BufNewFile *.json set filetype=javascript
    au BufRead,BufNewFile .eslintrc set filetype=javascript
    au BufRead,BufNewFile *test.js set filetype=javascript.mocha
    au BufRead,BufNewFile *.md set filetype=markdown
    au BufRead,BufNewFile *.sm set filetype=sm
augroup END

if filereadable(expand('~/git/dotfiles/yenv/vim/filetype.vim'))
  source ~/git/dotfiles/yenv/vim/filetype.vim
endif
