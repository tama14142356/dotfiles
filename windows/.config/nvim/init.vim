"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~\.cache\dein\repos\github.com\Shougo\dein.vim

" Let dein manage dein
" Required:
if dein#load_state('~\.cache\dein')
  call dein#begin('~\.cache\dein')

  " Let dein manage dein
  " Required:
  "call dein#add('~\.cache\dein\repos\github.com\Shougo\dein.vim')

  let g:dein_dir = expand('~\.config\nvim')
  let s:toml = g:dein_dir . '\dein.toml'
  let s:lazy_toml = g:dein_dir . '\dein_lazy.toml'

  " You can specify revision/branch/tag.

  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml,{'lazy': 1})

  " Required:
  call dein#end()
  call dein#save_state()
endif



" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------

"補完候補切り替え方法
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction
"
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"定義元ジャンプ
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"UTF-8でファイルを読み込み、ダメだったらShift_JISを試す
"set fileencodings=utf-8,sjis
"UTF-8でファイルを書き込む
"set fileencodings=utf-8
"クリップボードとVimの無名レジスタを結合する
"set clipboard+=unnamed
"コマンドモードでtabを使ってファイル名を補完するときに、1回目は最大共通文字列、次からは順番にファイル名を完全補完する
"set wildmode=longest,full
"
""Ctrl+J,Ctrl+Kでパラグラフ一つ分移動
nnoremap <C-j> }
nnoremap <C-k> {
"「s*」でカーソル下の単語からの置換を途中まで記述
"nnoremap <expr> s* ':%s/\<' . expand('<cword>') . '\>/'
" Vim起動時に画面下側にターミナルを立ち上げ、いいぐらいの高さにしておく(resizeの値は適宜調整)
"if has('vim_starting')
"    split
"    wincmd j
"    resize 15
"    terminal
"    wincmd k
"endif

"エディタとターミナルの操作をCtrl+Tで切り替え
tnoremap <C-t> <C-\><C-n><C-w>k
nnoremap <C-t> <C-w>j i
"ターミナルモード中にEscでターミナルノーマルモードに移行
tnoremap <Esc> <C-\><C-n>

"コメントはダブルクォーテーション

"シンタックスハイライトをon
"syntax on
syntax enable
filetype plugin indent on
set ruler
"set nofixeol
set binary noeol 
"VimではUTF-8で文字を表示する
set encoding=utf-8
scriptencoding=utf-8
"行番号を表示
"set number
set title
"tabの代わりにスペースを使用
set expandtab
set tabstop=2
"tabキーで挿入されるスペースの数
set shiftwidth=4
"インデント周りの各種機能で操作されるスペースの数
set softtabstop=0
set hlsearch
"検索結果をハイライト表示(:nohで消す)
set showmatch
set cindent
set showcmd
set ignorecase
set smartcase
"行末まで検索した後行頭に戻って検索
set wrapscan
"set nowrapscan
set noincsearch
set nobackup
set backspace=indent,eol,start
set cursorline
"中括弧を始めた後などの改行のあと自動的にインデントを入れる
set smartindent
"set mouse=a
inoremap { {}<Left>
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
"nnoremap <C-b> :wall<Enter>:copen<Enter>:make<Enter>
"nnoremap <C-u> :copen<Enter>:make run<Enter>

"htmlのカッコ補間
"augroup fileTypeIndent
"    autocmd!
"    autocmd BufNewFile,BufRead *.html inoremap < <><Left>
"augroup END
"mdの$補完
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.md inoremap $ $$<Left>
augroup END

autocmd BufNewFile *.js 0r %USERPROFILE%\.vim\template\javascript.js
"autocmd BufNewFile *.cpp 0r %USERPROFILE%\.vim\template\cpp.cpp
"autocmd BufNewFile *.c 0r %USERPROFILE%\.vim\template\cpp.cpp
"autocmd BufNewFile *.cpp :27
"set dictionary=\usr\share\dict\cracklib-small
"set path+=\usr\include\c++\7.1.1\x86_64-pc-linux-gnu\

autocmd BufNewFile,BufRead *.vue set filetype=html

autocmd BufNewFile,BufRead *.inc set filetype=cpp

"インサートから抜けるときにIMEがOFFになる https://qiita.com/hoshitocat/items/a80d613ef73b7a06ec50
function! ImInActivate()
  call system('fcitx-remote -c')
endfunction
inoremap <silent> <C-[> <ESC>:call ImInActivate()<CR>
inoremap <silent> <C-c> <ESC>:call ImInActivate()<CR>

"compile_commands.jsonを生成する
function MakeCompilationDatabase()
  let temp = expand('%:p')
  let dir = expand('%:p:h')
  echo system('echo ''[{"directory": " ' . dir . '","command": "\usr\bin\c++  ' . temp . ' -std=c++11","file": "' . temp . '"}]'' > compile_commands.json')
endfunction

set hidden

set termguicolors
"colorscheme NeoSolarized
"let g:neosolarized_contrast = "normal"
"let g:neosolarized_visibility = "normal"
"let g:neosolarized_vertSplitBgTrans = 1
"let g:neosolarized_bold = 1
"let g:neosolarized_underline = 1
"let g:neosolarized_italic = 0

autocmd FileType c ClangFormatAutoEnable
autocmd FileType cpp ClangFormatAutoEnable
