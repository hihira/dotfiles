scriptencoding utf-8

if filereadable(expand('~/.vimrc.bundle'))
  source ~/.vimrc.bundle
endif

filetype plugin indent on     " Required!

syntax on

set encoding=utf-8
set fileencoding=utf8
set fileencodings=ucs-bom,utf8,euc-jp

"set softtabstop=2

"set number
"set smartindent
set list
set ignorecase
set hlsearch
set wrap

"最下ウィンドウにいつステータス行が表示されるかを設定する
"  0: 全く表示しない
"  1: ウィンドウの数が2以上のときのみ表示
"  2: 常に表示
set laststatus=2

"ステータスラインに文字コードと改行文字を表示する
"set statusline=%<%f%=%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%9(\ %m%r\ %)[%4v][%12(\ %5l/%5L%)]

"256色
set t_Co=256
set background=dark
colorscheme hybrid

"タブページの設定 >= v7
"いつタブページのラベルを表示するかを指定する
"  0: 表示しない
"  1: 2個以上のタブページがあるときのみ表示
"  2: 常に表示
set showtabline=1

"コマンド入力時にTabを押すと補完メニューを表示する
set wildmenu

set undodir=~/var/vim/undo
set backupdir=~/var/vim/tmp

" Disable netrw.vim. Use vimfiler.
let g:loaded_netrwPlugin = 1
let g:vimfiler_as_default_explorer = 1

let $VIM_CACHE_DIR = expand('~/.cache/vim')
" アンドゥの履歴をファイルに保存し、Vim を一度終了したとしてもアンドゥやリドゥを行えるようにする
" 開いた時に前回保存時と内容が違う場合はリセットされる
if has('persistent_undo')
  set undofile
  if !isdirectory($VIM_CACHE_DIR.'/undo')
    call mkdir($VIM_CACHE_DIR.'/undo', "p")
  endif
  set undodir=$VIM_CACHE_DIR/undo
endif

if filereadable(expand('~/.vimrc.unite'))
  source ~/.vimrc.unite
endif

if filereadable(expand('~/.vimrc.neocon'))
  source ~/.vimrc.neocon
endif

if filereadable(expand('~/.vimrc.shell'))
  source ~/.vimrc.shell
endif

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

if !exists("g:quickrun_config")
    let g:quickrun_config = {}
endif

let g:quickrun_config['_'] = {
\ 'runner'                                 : 'vimproc',
\ 'runner/vimproc/updatetime'              : 50,
\ 'outputter'                              : 'multi:buffer:quickfix',
\ 'outputter/buffer/split'                 : 'botright 8sp',
\ 'hook/close_quickfix/enable_hook_loaded' : 1,
\ 'hook/close_quickfix/enable_success'     : 1,
\ 'hook/close_buffer/enable_failure'       : 1,
\}

let g:quickrun_no_default_key_mappings = 1
nnoremap \r :write<CR>:QuickRun -mode n<CR>
xnoremap \r :<C-U>write<CR>gv:QuickRun -mode v<CR>

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'MyModified',
      \   'readonly': 'MyReadonly',
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() : 
        \  &ft == 'unite' ? unite#get_status_string() : 
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '⭠ '._ : ''
  endif
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" syntastic
"let g:syntastic_mode_map = {
"  \ 'mode': 'active',
"  \ 'active_filetypes': ['php']
"  \}
"let g:syntastic_auto_loc_list = 0
"let g:syntastic_php_checkers = ['phpcs']
"let g:syntastic_php_phpcs_args='--standard=psr2'
