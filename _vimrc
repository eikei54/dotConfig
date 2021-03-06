
"https://github.com/sonatard/color-theme-molokai

let $LANG='ja_JP.UTF-8'
scriptencoding utf-8

" 改行コードの自動認識

set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac

"set list                                        " 不可視文字を表示
" 表示させる（置き換える）文字を設定
"set listchars=tab:»-,trail:-,nbsp:%,eol:↲

"if has("patch-7.4.710")
"    "set listchars=eol:~,tab:>.,trail:~,extends:>,precedes:<,space:_
"    set listchars=eol:~,tab:»-,trail:~,extends:>,precedes:<,space:_
"else
"    set listchars=eol:~,tab:»-,trail:~,extends:>,precedes:<
"endif

set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
    set ambiwidth=double
endif


" ------------------------------------
" For Plugin List
" ------------------------------------

" vim起動時のみruntimepathにneobundle.vimを追加
if has('vim_starting')
  set nocompatible
  set hidden
  set runtimepath+=~/.vim/bundle/neobundle.vim
  set runtimepath+=~/.vim/after/ftplugin
endif

" neobundle.vimの初期化
" NeoBundleを更新するための設定
call neobundle#begin(expand('~/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'

" 読み込むプラグインを記載
NeoBundle 'Shougo/unite.vim'
"NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/neoyank.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'scrooloose/nerdtree'
"NeoBundle 'scrooloose/syntastic'
NeoBundle 'hari-rangarajan/CCTree'
NeoBundle 'vim-scripts/TagHighlight'
"NeoBundle "vim-scripts/taglist.vim"
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'godlygeek/tabular'
NeoBundle 'rking/ag.vim'
NeoBundle 'vim-jp/cpp-vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'tpope/vim-surround'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'vim-scripts/grep.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'vim-ctrlspace/vim-ctrlspace'
NeoBundle 'inkarkat/vim-mark'
NeoBundle 'inkarkat/vim-ingo-library'

NeoBundle 'guns/xterm-color-table.vim'

" for displaying index searched item
NeoBundle 'google/vim-searchindex'
" Display diffs in Vim
NeoBundle 'airblade/vim-gitgutter'


" Search words selected part in visual mode.
NeoBundle 'nelstrom/vim-visual-star-search'

" Setting for fzf"
NeoBundle 'junegunn/fzf.vim'
" Setting for fzf"
NeoBundle 'jremmen/vim-ripgrep'

"if has('nvim')
"  NeoBundle 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"  NeoBundle 'Shougo/deoplete.nvim'
"  NeoBundle 'roxma/nvim-yarp'
"  NeoBundle 'roxma/vim-hug-neovim-rpc'
"endif
"let g:deoplete#enable_at_startup = 1

" Display only difference part in vimdiff
NeoBundle 'rickhowe/diffchar.vim'

"if v:version >= 800
"    NeoBundle 'w0rp/ale'
"endif

" For Python env
NeoBundle 'davidhalter/jedi-vim'

" Fancy Start Screen
NeoBundle 'mhinz/vim-startify'

" ファイルに変更が加わった際に、NERD treeのツリーに変更を示すアイコンを表示
NeoBundle 'Xuyuanp/nerdtree-git-plugin'

" ファイル末尾の余分なスペースをハイライト表示
NeoBundle 'bronson/vim-trailing-whitespace'

" Vim標準のjやkコマンドによる移動をより速くすること
NeoBundle 'rhysd/accelerated-jk'

" Easymotion
NeoBundle 'easymotion/vim-easymotion'

" Hightlight Multiple
NeoBundle 't9md/vim-quickhl'

" color scheme
NeoBundle 'tomasr/molokai'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'joshdick/onedark.vim'
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'scwood/vim-hybrid'
NeoBundle 'vim-scripts/oceanlight'
NeoBundle 'cocopon/iceberg.vim'
NeoBundle 'dracula/vim'
NeoBundle 'semibran/vim-colors-synthetic'
NeoBundle 'NLKNguyen/papercolor-theme'
NeoBundle 'szorfein/fromthehell.vim'
NeoBundle 'cseelus/vim-colors-tone'
NeoBundle 'eikei54/greent.vim'
NeoBundle 'rudrab/vim-coogle'
NeoBundle 'koirand/tokyo-metro.vim'


"
" vim-deoplete
"
"
if has('nvim')
  NeoBundle 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  NeoBundle 'Shougo/deoplete.nvim'
  NeoBundle 'roxma/nvim-yarp'
  NeoBundle 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

"
" vim-clang
"
" http://engineerspirit.com/2017/02/21/post-830/
" https://qiita.com/koara-local/items/815b08ff5c6673d8a5c6
"
"NeoBundle 'justmao945/vim-clang'

"
"" Insert the function header formatted Doxygen
"
" https://myenigma.hatenablog.com/entry/2016/01/10/215846
"
NeoBundle 'vim-scripts/DoxygenToolkit.vim'

" for PowerLine
"NeoBundle 'https://github.com/powerline/powerline.git', { 'rtp' : 'powerline/bindings/vim'}

call neobundle#end()

" 読み込んだプラグインも含め、ファイルタイプの検出、ファイルタイプ別プラグイン/インデントを有効化する
filetype plugin indent on

" インストールのチェック
NeoBundleCheck


" ------------------------------------
"  Make vimdiff writeable
" ------------------------------------
if &diff
    set noreadonly
endif

" ------------------------------------
" For NERDTree setting
" ------------------------------------

"Delete the buffer which is no more valid (already remove/detelted)
let NERDTreeAutoDeleteBuffer=1


"Close NERDTree Window automatically if it's last window in vim
function! s:CloseIfOnlyControlWinLeft()
  if winnr("$") != 1
    return
  endif
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
        \ || &buftype == 'quickfix'
    q
  endif
endfunction

augroup CloseIfOnlyControlWinLeft
  au!
  au BufEnter * call s:CloseIfOnlyControlWinLeft()
augroup END

" ------------------------------------
" For ale lint settings
" ------------------------------------

" disable lint at start up
let g:ale_lint_on_enter = 0

" ------------------------------------
" For Taglist
" ------------------------------------
let Tlist_Use_Right_Window = 1

" ------------------------------------
" For LightLine Setting
" ------------------------------------

let g:lightline = {
      \   'colorscheme': 'deus',
      \   'active': {
      \     'left': [ [ 'mode', 'paste' ], [ 'readonly', 'fugitive', 'filename', 'funcname', ] ]
      \   },
      \   'component': {
      \     'lineinfo': '⭡ %3l:%-2v',
      \   },
      \   'component_function': {
      \     'modified': 'LightlineModified',
      \     'readonly': 'LightlineReadonly',
      \     'fugitive': 'LightlineFugitive',
      \     'filename': 'LightlineFilename',
      \     'filetype': 'LightlineFiletype',
      \     'fileencoding': 'LightlineFileencoding',
      \     'mode': 'LightlineMode',
      \     'funcname': 'LightlineDispFuncName',
      \   },
      \   'separator': { 'left': "\u2B80", 'right': "\u2B82" },
      \   'subseparator': { 'left': "\u2B81", 'right': "\u2B83" }
      \   }
"let g:lightline.enable = {
"    \ 'tabline': 0
"    \ }
"
function! LightlineModified()
    return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
    return &readonly ? '⭤' : ''
endfunction

function! LightlineFugitive()
    if exists('*fugitive#head')
        let branch = fugitive#head()
        return branch !=# '' ? '⭠ '.branch : ''
    endif
    return ''
endfunction

function! LightlineFilename()
    return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFiletype()
    return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineFileencoding()
    return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
    return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! LightlineDispFuncName()
    return winwidth(0) > 60 ? tagbar#currenttag('%s ','') : ''
endfunction

" ------------------------------------
" For Tagbar Setting
" ------------------------------------
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_previewwin_pos = "aboveleft"
let g:tagbar_autoshowtag = 1


" ------------------------------------
" For tmux color Setting
" ------------------------------------
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" ------------------------------------
" For vim-clang Setting
" ------------------------------------

let g:clang_c_options = '-std=c11'
let g:clang_cpp_options = '-std=c++1z -stdlib=libc++ ?pedantic-errors'
let g:clang_format_auto = 1
let g:clang_format_style = 'Google'
let g:clang_check_syntax_auto = 1


" ------------------------------------
" For vim-searchindex setting
" ------------------------------------
"let g:searchindex_improved_star = 0
"let g:searchindex_star_case = 0

" ------------------------------------
" For Common Setting
" ------------------------------------

set helplang=en                                 " use English version help

syntax on

set updatetime=750

"" for base16 colorscheme setting
let base16colorspace=256  " Access colors present in 256 colorspace

colorscheme molokai
set background=dark

set backspace=indent,eol,start


set shortmess+=I                                " 起動時のメッセージを消す

set number                                      " 行数を表示
set title

"" Visible for Zenkaku Space
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666

augroup vimrc_buffer_conf
    autocmd!
    autocmd BufNewFile,BufRead * match ZenkakuSpace /　/
    " ディレクトリを開いたファイルと同じ場所へ移動
    autocmd BufEnter * execute 'lcd ' fnameescape(expand('%:p:h'))
    " Remove space at line end when saving file
    autocmd BufWritePre * :%s/\s\+$//ge
    " set no indent at leving Insert mode
    autocmd InsertLeave * set nopaste
augroup END

set noswapfile                                  " swap ファイルを作成しない
set nowritebackup                               " swap ファイルを作成しない
set nobackup                                    " バックアップファイルを作成しない


" keep some space from bottom at Scrollling
set scrolloff=5

"検索語が画面の真ん中に来るようにする
"nmap <silent>n nzz
"nmap <silent>N Nzz
"nmap <silent>g* g*zz
"nmap <silent>g# g#zz

set hlsearch                                     " サーチ：検索語をハイライトする
set incsearch                                    " サーチ：インクリメンタルサーチ（検索中に文字を打つと自動で検索していく）
set ignorecase                                   " サーチ：大文字小文字を区別しない
set smartcase                                    " サーチ：大文字で検索されたら対象を大文字限定にする
"set nowrapscan                                   " サーチ：検索がファイル末尾まで進んだらそこで先頭に戻らず止まる

set showcmd                                      " ステータスラインにコマンドを表示
set laststatus=2                                 " ステータスラインを常に表示

set showmatch                                    " カーソル：括弧にカーソルを合わせた時、対応した括弧を表示する
set matchtime=1                                  " カーソル：カーソルが飛ぶ時間を0.1秒で飛ぶようにする

set history=1000                                 "コマンドを1000個分、検索パターンを1000個分、ヒストリ(履歴)として残す。

set undodir=$HOME/.vim/undo

set mouse+=a

set t_Co=256
set termguicolors

"
"" define cursor colr
"
set cursorline
hi clear cursorline

" Underline for GUI
highlight CursorLine gui=bold,underline guifg=NONE guibg=#000000 guisp=#87FF00
" Underline for color terminal
highlight CursorLine cterm=bold,underline ctermfg=NONE ctermbg=0

highlight clear LineNR
highlight clear CursorLineNR
highlight LineNR cterm=NONE ctermfg=237 ctermbg=NONE guifg=#3A3A3A guibg=NONE
highlight CursorLineNr term=bold cterm=NONE ctermfg=118 ctermbg=0 guifg=#87ff00 guibg=#000000

hi clear Cursor
hi Cursor cterm=bold ctermfg=20 ctermbg=50 gui=bold guifg=#F8F8F8 guibg=#00FF00
"hi Cursor ctermfg=NONE ctermbg=300
"hi CursorIM       guifg=#F8F8F8           guibg=#002947"#5F5A60

" GREEN - Purple
"hi Search cterm=NONE ctermfg=grey ctermbg=blue guibg=#AEF359 guifg=#9400D3
" GREEN - RED
"hi Search cterm=NONE ctermfg=grey ctermbg=blue guibg=#16DD38 guifg=#B21F35
" GREEN - GREEN
"hi Search cterm=NONE ctermfg=grey ctermbg=blue guibg=#A9E558 guifg=#006544
" PIONEER - RED
"hi Search cterm=NONE ctermfg=grey ctermbg=blue guibg=#FEC5DE guifg=#EA0337
"hi Search cterm=NONE ctermfg=grey ctermbg=blue guibg=#FFADCE guifg=#EE2F81
" LIGHTBLUE BLUE
"hi Search cterm=NONE ctermfg=grey ctermbg=blue guibg=#C0C0FF guifg=#1414BB
"hi Search cterm=NONE ctermfg=grey ctermbg=blue guibg=#93C2FF guifg=#052D61
hi Search cterm=NONE ctermfg=grey ctermbg=blue guibg=#93C2FF guifg=#000047
"hi Search cterm=NONE ctermfg=grey ctermbg=blue guibg=#93C2FF guifg=#00483A

" Enable underline for only active window
augroup vimrc_set_cursorline_only_active_window
  autocmd!
  autocmd VimEnter,BufWinEnter,WinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

"行を跨いで移動出来る様にする
set whichwrap=b,s,h,l,[,],<,>

set tabstop=4                                    " ファイル内の <Tab> が対応する空白の数

set expandtab                                    " タブの代わりに空白文字を挿入する
set shiftwidth=4


set nowrapscan

"
" https://qiita.com/itmammoth/items/312246b4b7688875d023
"

" hilight the keyword under the cursor
"nnoremap <silent> <Space>h "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>
" fix the typo
inoremap <C-t> <Esc><Left>"zx"zpa

" not yank in x, or s
nnoremap x "_x
nnoremap s "_s

""
" ------ Tab completion  ------
"

" will insert tab at beginning of line,
" will use completion if not at beginningw


set wildmenu
set wildmode=list:longest,list:full
"set wildmode=longest,list

function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" . scan the current buffer, b scan other loaded buffers that are in the buffer list, u scan the unloaded buffers that
" are in the buffer list, w scan buffers from other windows, t tag completion
set complete=.,b,u,t,w,]

" Keyword list
set complete+=k~/.vim/keywords.txt
set dictionary=k~/.vim/dict/words

"
" ------ Tab completion  ------
"
set laststatus=2    " Always display status
set showtabline=2   " Always display the tabline, even if there is only one tab
set noshowmode      " Hide the default mode text (e.g. -- INSERT -- below the statusline)

"------- vim-indent settings -------
set autoindent                  "自動インデントを有効化する
set smartindent                 "改行時に入力された行の末尾に合わせて次の行のインデントを増減する

"------- vim-indent-guides ------
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size=4
let g:indent_guides_color_change_percent = 100

augroup vimrc_vim_diff_setting
    autocmd!
    " set transparency
    autocmd GUIEnter * set transparency=249
    " indent color setting
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=234
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#151515 ctermbg=232
    " vim-diff setting
    autocmd FilterWritePre * if &diff | colorscheme hybrid | endif
augroup END

" ------ CtrlP Setting ------------

let g:ctrlp_regexp = 1
let g:ctrlp_by_filename = 1

" Use cache feature
let g:ctrlp_use_caching=1

" Define cache directory
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

" Do not delete chache at finishing Vim
let g:ctrlp_clear_cache_on_exit = 0

" re-draw
let g:ctrlp_lazy_update = 1

" Define the height at Max
let g:ctrlp_max_height = 20

" Use custom find comand
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|inc)$',
  \ 'link': 'some_bad_symbolic_links',
  \}

" ------ const ------------------

let s:pat_etm_01 = "Initiator_Opcode \= [0-9A-F]{8}"
let s:pat_etm_02 = "(CE )\@<!IS (ATA )?CMD ALLOWED"
let s:pat_etm_03 = "QM\stask\scomplete"
let s:pat_etm_04 = "\cuec\s\+=\s0000[1-9A-F]\{4\}"

let s:pat_etm_99 = s:pat_etm_01."<Bslash><Bar>".s:pat_etm_02."<Bslash><Bar>".s:pat_etm_03."<Bslash><Bar>".s:pat_etm_04

" ------ Key Setting ------------

"" setting <Leader>key
let mapleader = "\<Space>"

"" for quickfix setting
nnoremap [q :cprevious<CR>   " previous
nnoremap ]q :cnext<CR>       " next
nnoremap [Q :<C-u>cfirst<CR> " Top
nnoremap ]Q :<C-u>clast<CR>  " Last

nnoremap <F2> :source $MYVIMRC<CR>:source $MYGVIMRC<CR>
"nnoremap <S-F2> :source $MYVIMRC

"nnoremap <F3> /\vInitiator_Opcode \= [0-9A-F]{8}<CR>
exe "nnoremap <F3> /\v".s:pat_etm_02."<CR>"
"nnoremap <F3> /\vInitiator_Opcode \= [0-9A-F]{8}<CR>

nnoremap <F5> /Initiator_Opcode\s=\s[0-9A-F]\{8\}<Bslash><Bar>\(CE\s\)\@<!IS\s\(.\+\)\?CMD\sALLOWED<Bslash><Bar>QM\stask\scomplete<Bslash><Bar>\cuec\s\+=\s0000[1-9A-F]\{4\}<Bslash><Bar>ShowStopCode\s\+=\s[0-9A-F]\{8\}<CR>
nnoremap <S-F5> ?Initiator_Opcode\s=\s[0-9A-F]\{8\}<Bslash><Bar>\(CE\s\)\@<!IS\s\(.\+\)\?CMD\sALLOWED<Bslash><Bar>QM\stask\scomplete<Bslash><Bar>\cuec\s\+=\s0000[1-9A-F]\{4\}<Bslash><Bar>ShowStopCode\s\+=\s[0-9A-F]\{8\}<CR>
nnoremap <C-F5> /\cuec\s\+=\s0000[1-9A-F]\{4\}<Bslash><Bar>ShowStopCode\s\+=\s[0-9A-F]\{8\}<CR>
"nnoremap <S-F5> ?Initiator_Opcode\s=\s[0-9A-F]\{8\}<Bslash><Bar>IS\sCMD\sALLOWED<Bslash><Bar>QM\stask\scomplete<Bslash><Bar>\cuec\s\+=\s0000[1-9A-F]\{4\}<CR>

"nnoremap <F5> /opCode<CR>
"nnoremap <S-F5> ?opCode<CR>

"nnoremap <F6> :vimgrep Initiator_Opcode\s=\s[0-9A-F]\{8\}<Bslash><Bar>\(CE\s\)\@<!IS\s\(.\+\)\?CMD\sALLOWED<Bslash><Bar>QM\stask\scomplete<Bslash><Bar>\cuec\s\+=\s0000[1-9A-F]\{4\}<Bslash><Bar>ShowStopCode\s\+=\s[0-9A-F]\{8\} %<CR>
nnoremap <F6> :vimgrep Initiator_Opcode\s=\s[0-9A-F]\{8\}<Bslash><Bar>\(CE\s\)\@<!IS\s\(.\+\)\?CMD\sALLOWED<Bslash><Bar>QM\stask\scomplete<Bslash><Bar>\cuec\s\+=\s0000[1-9A-F]\{4\}<Bslash><Bar>ShowStopCode\s\+=\s[0-9A-F]\{8\}<Bslash><Bar>HI\sofb\ssend %<CR>
nnoremap <S-F6> :vimgrep \cuec\s\+=\s0000[1-9A-F]\{4\} %<CR>
nnoremap <C-F6> ?\cuec\s\+=\s0000[1-9A-F]\{4\}<Bslash><Bar>ShowStopCode\s\+=\s[0-9A-F]\{8\}<CR>

autocmd QuickFixCmdPost *grep* cwindow


nnoremap <S-F7> :cold<CR>
nnoremap <S-F8> :cnew<CR>

nnoremap <C-F7> :cfirst<CR>
nnoremap <C-F8> :clast<CR>

" previous
nnoremap <F7>   :cprevious<CR>zz
" next
nnoremap <F8>   :cnext<CR>zz



"" set very magic anytime for pattern search
nnoremap / /\v
nnoremap ? ?\v
vnoremap / /\v
vnoremap ? ?\v


" bind s to grep word under cursor
"nnoremap <Leader>f :Ag! "\b<C-R><C-W>\b" ./%<CR>
" bind g to grep word under cursor
"nnoremap <Leader>s :Ag! <C-R><C-W> ./

" <Space>y で改行なしで1行コピー（\n を含まずに yy）
"noremap <Leader>y 0v$hy

" 最初にヤンクした文字列を繰り返しペースト
"vnoremap <Leader>p "0p

" <Space>y で選択行をコピー
"vnoremap <Leader>y "y*

" for python executing
nnoremap <Leader>z :!python3 %<CR>

set clipboard+=autoselect,unnamed

" use cliipboard
nnoremap Y "+Y

" <Leader>i でコードをインデント整形
"map <Leader>i gg=<S-g><C-o><C-o>zz

"" highlight the current word withoug moving the cursor
nnoremap <silent> <leader>hn :noh<CR>
nnoremap <silent> <leader>hw "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>
"nnoremap * *``

"" turn off hilight part by pushing esc key twice
nnoremap <ESC><ESC> :nohlsearch<CR>
nnoremap <Leader>o :nohlsearch<CR>

" 最後に変更した場所へ戻る(便利)
map <C-m> `.

" j/kによる移動を速くする (need plugin 'accelerated-jk' )
"nmap j <Plug>(accelerated_jk_gj)
"nmap k <Plug>(accelerated_jk_gk)

" acceralate to move in vim
nnoremap <S-h> ^
nnoremap <S-j> }
nnoremap <S-k> {
nnoremap <S-l> $

"
"" original key setting
"
nnoremap wh <C-w>h
nnoremap wj <C-w>j
nnoremap wk <C-w>k
nnoremap wl <C-w>l
nnoremap wJ <C-w>J
nnoremap wK <C-w>K
nnoremap wL <C-w>L
nnoremap wH <C-w>H
nnoremap wT <C-w>T
"nnoremap s <Nop>
nnoremap sn gt
nnoremap sp gT
nnoremap w= <C-w>=
"nnoremap ww <C-w>w
nnoremap wr <C-w>r
nnoremap wx <C-w>x
nnoremap wo <C-w>_<C-w>|
nnoremap wO <C-w>=
nnoremap wt :TagbarToggle<CR>
nnoremap st :tabnew<CR>
nnoremap sq :close<CR>
nnoremap sQ :%bd<CR>
nnoremap sh :sp<CR>
nnoremap sv :vsp<CR>


" auto select function
nnoremap vf ][v[[?^?s*$<CR>

" auto select block like for
nnoremap vb /{<CR>%v%0

"
"
"buffer operations
"
nnoremap <silent> bp :bprevious<CR>
nnoremap <silent> bn :bnext<CR>


" Change window size by Shift + Allow key
" nnoremap <S-Left>  <C-w><<CR>
" nnoremap <S-Right> <C-w>><CR>
" nnoremap <S-Up>    <C-w>-<CR>
" nnoremap <S-Down>  <C-w>+<CR>
nnoremap <C-h> <C-w><
nnoremap <C-l> <C-w>>
nnoremap <C-j> <C-w>-
nnoremap <C-k> <C-w>+

" save vim session in current folder
nnoremap <C-s> :mks!


" for NERDTree setting, open by ctrl+e
nnoremap <silent><C-e> :NERDTreeToggle<CR>

"" for Tab moving
nnoremap <c-1> 1gt
nnoremap <c-2> 2gt
nnoremap <c-3> 3gt
nnoremap <c-4> 4gt
nnoremap <c-5> 5gt
nnoremap <c-6> 6gt
nnoremap <c-7> 7gt
nnoremap <c-8> 8gt
nnoremap <c-9> 9gt
inoremap <c-1> <C-o>1gt
inoremap <c-2> <C-o>2gt
inoremap <c-3> <C-o>3gt
inoremap <c-4> <C-o>4gt
inoremap <c-5> <C-o>5gt
inoremap <c-6> <C-o>6gt
inoremap <c-7> <C-o>7gt
inoremap <c-8> <C-o>7gt
inoremap <c-9> <C-o>8gt
inoremap <c-9> <C-o>9gt

" Command to move among tabs in Konsole-style
map <A-Right> gt
map <A-Left> gT

" ----------------------------
" input mode setting
" ----------------------------
"" back to command mode by pushing j key twice
inoremap <silent> jj <ESC>

""inoremap { {}<Left>
""inoremap [ []<Left>
""inoremap ( ()<Left>
""inoremap " ""<Left>
""inoremap ' ''<Left>
""inoremap < <><Left>
""
""cnoremap { {}<Left>
""cnoremap [ []<Left>
""cnoremap ( ()<Left>
""cnoremap " ""<Left>
""cnoremap ' ''<Left>
""cnoremap < <><Left>

inoremap <C-e> <END>
inoremap <C-a> <HOME>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-f> <C-o>w
inoremap <C-b> <C-o>b
inoremap <C-d> <C-o>x


" delete the part after cursor in the line
"inoremap <expr> <C-k> "\<C-g>u".(col('.') == col('$') ? '<C-o>gJ' : '<C-o>D')

" navigation in command line
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-d> <Delete>
cnoremap <C-j> <Left>
cnoremap <C-l> <Right>
cnoremap <A-f> <C-Right>
cnoremap <A-b> <C-Left>
" delete the part after cursor in the line
cnoremap <C-k> <C-\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos()-2]<CR>
"" Default keymap in Vim
"cnoremap <C-f> <Right>
"cnoremap <C-n> <Down>
"cnoremap <C-p> <Up>
"cnoremap <C-e> <End>


" ----------------------------
" ctags setting
" ----------------------------

set tags+=./tags;tags;$HOME
nnoremap <F9> <C-t>
nnoremap <F10> <C-]>
" Open displayed function in another tab page
nnoremap <S-F9> :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>

nnoremap <F12>   :CopyCurrentLineNum<CR>
vnoremap <F12>   :CopyCurrentLineNum<CR>

nnoremap <C-F12> :CopyFileName<CR>
vnoremap <C-F12> :CopyFileName<CR>

nnoremap <S-F12> :CopyFolderPath<CR>
vnoremap <S-F12> :CopyFolderPath<CR>

function! UpdateTags()
  execute ":!ctags -R --languages=C++ --c++-kinds=+p --fields=+iaS --extra=+q ./"
  echohl StatusLine | echo "C/C++ tag updated" | echohl None
endfunction
nnoremap <F4> :call UpdateTags()


"map  <F12>      :if &list<CR>set nolist<CR>else<CR>set list<CR>endif<CR><CR>
"cmap <F12> <ESC>:if &list<CR>set nolist<CR>else<CR>set list<CR>endif<CR><CR>:<up>
"imap <F12> <ESC>:if &list<CR>set nolist<CR>else<CR>set list<CR>endif<CR><CR>a

"" disable dangerous input type
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>



" -----------------------------
" Quick Fix setting
" -----------------------------

" output the number of the result of make or grep
setlocal statusline+=\ %L

" Type p as preview of quickfix
"nnoremap <buffer> p  <CR>zz<C-w>p

" hook after executing QucikFixCmd in vimgrep
autocmd QuickFixCmdPost grep,vimgrep,cwindow if len(getqflist()) != 0 | copen | endif

" 現在のファイルパスを表示する
nnoremap <C-g> 1<C-g>

"" grep for file set

"set grepprg=ag\ -n\ -iS

if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

"if has("win32")
"    " Windows環境用のコード
"    "grep.vim用にGitbashのgrepにパスを通す"
"    let Grep_Path = 'C:\tools\bin_win32\grep.exe'
"    let Grep_Xargs_Path = 'C:\tools\bin_win32\xargs.exe'
"    let Grep_Find_Path = 'C:\tools\bin_win32\find.exe'
"    let Grep_Shell_Quote_Char = '"'
"endif

""let g:Grep_Default_Filelist = '*.cpp *.ipp *.c *.hpp *.h *hh *.spp *.tcl *.dao *.dat *.mak *.seq *.cmake *.txt'
let Grep_Skip_Dirs = '.svn'
let Grep_Default_Options = '-I'   "バイナルファイルをgrepしない
let Grep_Skip_Files = '*.bak *~ *.out tags'  "バックアップファイルを無視する

" ----------------------------
" cscope setting
" ----------------------------

if has("cscope")
  set csprg=cscope
  "if has("mac")
  "" mac用の設定
  "elseif has("unix")
  "" unix固有の設定
  "  set csprg=/usr/local/bin/cscope
  "elseif has("win64")
  "" 64bit_windows固有の設定
  "  set csprg=C:\tools\bin\cscope.exe
  "elseif has("win32unix")
  "" Cygwin固有の設定
  "elseif has("win32") || has("x86_64")
  "" 32bit_windows固有の設定
  "  set csprg=C:\tools\bin\cscope.exe
  "endif
  set csto=0
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
    cs add cscope.out
  " else add database pointed to by environment
  elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
  endif
  set csverb
  set cscopequickfix=s-,c-,d-,i-,t-,e-
endif

" ----------------------------
" CCTree setting
" ----------------------------

let g:CCTreeOrientation = "rightbelow"
let g:CCTreeRecursiveDepth = 3
let g:CCTreeMinVisibleDepth = 3
let g:CCTreeKeyTraceForwardTree = '<C-\>>'
let g:CCTreeKeyTraceReverseTree = '<C-\><'
let g:CCTreeKeyDepthPlus = '<C-\>='
let g:CCTreeKeyDepthMinus = '<C-\>-'


" ------------------------------------
" For rainbow_parentheses Setting
" ------------------------------------
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

" Dont' set any augroup for RainbowParentheses
autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces

" ------------------------------------
" for Ag Setting
" ------------------------------------

let g:ag_highlight=1

" ------------------------------------
" for Unite Setting
" ------------------------------------

"unite prefix key.
nnoremap    [unite] <Nop>
nmap        <Space>u [unite]

"unite general settings
"インサートモードで開始
let g:unite_enable_start_insert = 1

"現在開いているファイルのディレクトリ下のファイル一覧。
"開いていない場合はカレントディレクトリ
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"バッファ一覧
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
"レジスタ一覧
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
"最近使用したファイル一覧
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
"ブックマーク一覧
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
"ブックマークに追加
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>


" buffer内 grep検索
nnoremap <silent> [unite]g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

" カーソル位置の単語をgrep検索
nnoremap <silent> [unite]gc :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>

" grep検索結果の再呼出
nnoremap <silent> [unite]gr  :<C-u>UniteResume search-buffer<CR>

" Unite history/yank
nnoremap <silent> [unite]yh  :<C-u>Unite history/yank -default-action=append<CR>


"最近開いたファイル履歴の保存数
let g:unite_source_file_mru_limit = 50

"file_mruの表示フォーマットを指定。空にすると表示スピードが高速化される
let g:unite_source_file_mru_filename_format = ''

if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts =
    \ '-i --vimgrep --hidden --ignore ' .
    \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
    let g:unite_source_grep_recursive_opt = ''
"    let g:ctrlp_user_command='ag %s -i --nocolor --nogroup -g ""'
endif

" For Unite vim config
nnoremap sT :Unite tab<CR>
nnoremap <silent> sb :Unite buffer_tab -buffer-name=file<CR>
nnoremap <silent> sB :Unite buffer -buffer-name=file<CR>

"uniteを開いている間のキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
	"ESCでuniteを終了
	nmap <buffer> <ESC> <Plug>(unite_exit)
	"入力モードのときjjでノーマルモードに移動
	imap <buffer> jj <Plug>(unite_insert_leave)
	"入力モードのときctrl+wでバックスラッシュも削除
	imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
	"ctrl+jで下に移動
	nnoremap <silent> <buffer> <C-j> <Down>
	inoremap <silent> <buffer> <C-j> <Down>
    "ctrl+kで上に移動
	nnoremap <silent> <buffer> <C-k> <Up>
	inoremap <silent> <buffer> <C-k> <Up>
    "ctrl+sで横に分割して開く
	nnoremap <silent> <buffer> <expr> <C-s> unite#do_action('split')
	inoremap <silent> <buffer> <expr> <C-s> unite#do_action('split')
	"ctrl+vで縦に分割して開く
	nnoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
	inoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
	"ctrl+oでその場所に開く
	nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
	inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
endfunction

" Added for memod ETM analysis
nnoremap <silent> <Leader>pl O..................<ESC>


" ------------------------------------
" for quickhl Setting
" ------------------------------------
nmap <Leader>ht <Plug>(quickhl-manual-this)
xmap <Leader>ht <Plug>(quickhl-manual-this)
nmap <Leader>hm <Plug>(quickhl-manual-toggle)
xmap <Leader>hm <Plug>(quickhl-manual-toggle)

nmap <Leader>hr <Plug>(quickhl-manual-reset)
xmap <Leader>hr <Plug>(quickhl-manual-reset)

nmap <Leader>hc <Plug>(quickhl-cword-toggle)
"
nmap <Leader>h] <Plug>(quickhl-tag-toggle)

map <Leader>H <Plug>(operator-quickhl-manual-this-motion)


" Highlight cword
let g:quickhl_cword_enable_at_startup = 1

" Highlight Keyword
let g:quickhl_manual_enable_at_startup = 1
let g:quickhl_manual_keywords = [
   \ {"pattern": '\(CE\s\)\@<!IS\s\(.\+\)\?CMD\sALLOWED\s\(EXIT\s\)\?', "regexp": 1 },
   \ {"pattern": 'QM\stask\scomplete', "regexp": 2 },
   \ {"pattern": '\cuec\s\+=\s0000[1-9A-F]\{4\}', "regexp": 3 },
   \ {"pattern": 'errorCode\s\+=\s0000[1-9A-F]\{4\}', "regexp": 4 },
   \ {"pattern": 'ShowStopCode\s\+=\s[-1-9A-F]\{8\}', "regexp": 5 },
   \ {"pattern": '\(Initiator_\)\?\cop\ccode\(PlusATA\)\?\s\+=\s[0-9A-F]\{8\}', "regexp": 6 },
   \ ]


" ------------------------------------
" for git gutter
" ------------------------------------
if has("win32") || has("x86_64")
    let g:gitgutter_git_executable = 'D:\Program Files\Git\bin\git.exe'
elseif has("unix")
    let g:gitgutter_git_executable = '/usr/bin/git'
endif

" ------------------------------------
" for Original Vim Setting
" ------------------------------------

" Copy the path of file being edited into clipboard
function! g:CopyFilePath()
  let @* = expand("%:p")
  echo @*
endfunction

" Copy name of file being edited into clipboard
function! g:CopyFileName()
  "let @* = expand("%:t")." L:".line('.')
  let @* = expand("%:t")
  echo @*
endfunction

" Copy folder path including file being edited into clipboard
function! g:CopyFolderPath()
"  let @* = expand("%:p:h")."/".expand("%:t")
  let @* = expand("%:p")
  echo @*
endfunction

" Copy folder path including file being edited into clipboard
function! g:CopyCurrentLineNum()
  let @* = "L:".line('.')
  echo @*
endfunction


" Make following cmd executable
command! CopyFilePath :call g:CopyFilePath()
command! CopyFileName :call g:CopyFileName()
command! CopyFolderPath :call g:CopyFolderPath()
command! CopyCurrentLineNum :call g:CopyCurrentLineNum()


"Tipsメモ
"
"http://www.ac.cyberhome.ne.jp/~yakahaira/vimdoc/windows.html

"カーソルを一個前の場所(ファイル)に戻す
"C-o
"
"カーソルを一個先の場所(ファイル)に進める
"C-i
"
"カーソル下のファイル名を開く
"gf
"
"現在検索している単語をペースト
"<C-r>/
"
"\di to start DrawIt and
"\ds to stop  DrawIt.
"
"そのままペースト
":a! <Paste>
"
"カレントバッファをBashなどで実行
"w !bash
"
"履歴を参照
":<C-f>
"
"レジスタの中身をコマンドラインへペースト
":<C-R>"
":<C-R><C-W>
"
"レジスタリスト
"0 最後に yank したテキスト
"- 最後の細かい削除
". 最後に挿入したテキスト
"% 現在のファイル名
"# 代替ファイル名
"/ 最後に検索した文字列
": 最後に実行した:
"_ ブラックホール
"= 計算式
"* マウスで選択されたテキスト
"
"指定エンコードで開きなおす
":e ++enc=euc-jp
":e ++ff=unix
"
"上下の行を現在行へコピー
"<C-E> or <C-Y>
"
"uniqやgrepでフィルタ
":%!uniq
":%!grep
"
":eで開くパスの追加
"let &path += "/etc,/var/log,/var/log/httpd"
"
"Bookmark
"http://nanasi.jp/articles/vim/bookmarks_vim.html
"b
"B
"q
"
"DrawItPlugin.vim
"\di
"\ds
"
"インサートモードでインデントする
"<C-t> or <C-d>
"
"EnhCommentify.vim
"\xでコメントアウト/解除
"
"VisualMode再選択
"gv
"
"カーソル上の単語を全体からリストアップ
"[I
"
"大文字<->小文字変換
"gu<select>
"gU<select>
"
"1ライン上方スクロール
"^y
"ウィンドウの先頭から数えて[count]行目から再描画
"z
"現在行をウィンドウの最上位置にして再描画(位置変化無)
"zt
"ウィンドウの高さを{height}にして再描画
"z{height}<CR>
"現在位置を最上にしてウィンドウを再描画(カーソル現在位置)
"z<CR>
"現在位置を中心にしてウィンドウを再描画(カーソル最左非空白へ)
"z.
"現在位置を中心にしてウィンドウを再描画(カーソル現在位置)
"zz
"現在位置を最下にしてウィンドウを再描画(カーソル最左非空白へ)
"z-
"現在位置を最下にしてウィンドウを再描画(カーソル現在位置)
"zb
"wrap off時: [count]文字左にスクロール
"z<right>
""z<right>" と同じ
"zl
"wrap off時: [count]文字右にスクロール
"z<Left>
""z<Left>" と同じ
"zh
"スクリーン幅の半分左スクロール
"zL
"
"直前操作繰り返し
".
"
"現在行の検索
"f<word>
"現在行の検索（後方）
"F<word>
"
"現在行のワード検索
"f<word>
"現在行の検索（後方）
"F<word>
"現在行の次検索
",
"
"検索、置き換え簡単方法
"置き換えたいワードの上にカーソル移動->'*'->cw->入力->n->.->n->.->繰り返し
"
"コントロールコードの入力
"C-V<>
"
"計算結果の入力
"Insterモード->C-R=->2*2*2->Return
"
"コマンドラインでバッファ番号を指定する
"#バッファ番号
"
"多段Undo
"http://www.ac.cyberhome.ne.jp/~yakahaira/vimdoc/usr_32.html
"Undoで前のツリーへ戻る
"g-
"Redoで次のツリーへ戻る
"g+
"
"10分前に戻る
":earlier 10s
"
"一分後に進む
":later 1m
"
"コマンドライン操作
"http://www.kaoriya.net/vimdoc_j/cmdline.txt
"C-R....
"
"名前のない登録、最後の削除やヤンクを含む。
"'"'
"カレントファイル名
"'%'
"代替ファイル名
"'#'
"最後の検索パターン
"'/'
"クリップボードの内容
"'*'
"最後のコマンドライン
"':'
"最後の小さな削除(行単位未満)
"'-'
"最後に挿入されたテキスト
"'.'
"式の登録: 式を入力するよう要求される
"'='
"
"ファイル名補完
"CTRL-X CTRL-F
"行全補完
"CTRL-X CTRL-L
"マクロ定義 (インクルードファイルの中も探す)
"CTRL-X CTRL-D
"カレントファイルとインクルードファイ補完
"CTRL-X CTRL-I
"辞補完
"CTRL-X CTRL-K
"同義語辞書 (シソーラス)
"CTRL-X CTRL-T
"タ補完
"CTRL-X CTRL-]
"Vim のコマンドライ補完
"CTRL-X CTRL-V
"
"Window縦分割/横分割切替
"C-W,H
"C-W,J
"
"暗号化を解除する
":X
"
"空白を挿入しないでjoinする
"gJ
"
"最初の検索パターンが現れたところからもう一段検索する
"http://www.kaoriya.net/vimdoc_j/pattern.txt
":/patarn1/;/patarn2
"
"カーソル位置の単語をManpageで検索
"K
"
"カーソル位置の情報を詳細に表示
"g,C-G
"
"コマンドライン総合
"http://www.ac.cyberhome.ne.jp/~yakahaira/vimdoc/cmdline.html
"
"Fold関係
"foldenable をトグルで on off する
"zi
"fold を閉じる(close)
"zc
"fold を再帰的に閉じる(close)
"zC
"fold を開く(open)
"zo
"fold を再帰的に開く(open)
"zO
"foldlevel をインクリメント、 すなわちすべてのfoldを1level開く
"zr
"foldlevel を最大値にする、すなわちすべてのfoldを開く
"zR
"foldlevel をデクリメント、すんわちすべてのfoldを1level閉じる
"zm
"foldlevel を0にする、すなわちすべてのfoldを閉じる
"zM
"fold をカーソルから4行分設定する
"zf4j
"`a fold をカーソルからaのマーク位置まで設定する
"z
"設定された fold を削除
"zd
"設定された fold を再帰的に削除
"zD
"
"全文をソート
":%!sort
"
"バッファ全体に置き替えを適用
":bufdo %s/aaa/bbb/g
"
"バッファ全体に置き替えを適用して保存
":bufdo %s/aaa/bbb/g | wa!
"
"改行位置で整形
"gq
"
"sudoを忘れて権限のないファイルを編集した時
":w !sudo tee %
"
"カーソルの下の単語をさくっと拾って置換で使う
":%s//New York/g とかやると New York に置換
":%g//dすれば Massachusetts を含む行を削除
"%v//dすれば Massachusetts を含む行だけ残すことができる。
"
"Undo関連
"undolist Undo履歴を参照
"g-     古いテキストの状態戻る
"g+     新しいテキストの状態に戻る
":earlier {N}s   {N}秒前の状態に戻ります
":earlier {N}m  {N}分前の状態に戻ります
":earlier {N}h  {N}時間前の状態に戻ります
":later {N}s    {N}秒後の状態に戻ります
":later {N}m    {N}分後の状態に戻ります
":later {N}h    {N}時間後の状態に戻ります
"
"Massachusetts の上で # を押して、 :%s//New York/g とかやると New York に置換
":%g//dすれば Massachusetts を含む行を削除
"%v//dすれば Massachusetts を含む行だけ残すことができる。
"
"文書中の全てのタブをスペースに変換
":set expandtab
":%retab
"
"文書中の全てのスペースをタブに変換
":set noexpandtab
":%retab!
"
"自動的に改行するようにする
"60文字の場合。 :set textwidth=60
"ただし、これだとスペースなどでしか改行されない。日本語では不便。
"
"日本語を textwidth 桁で折り返したい
"gq
"
"Align系
"<Leader>tsp    空白文字で分割して整形。各フィールドは左揃え。
"<Leader>Tsp    空白文字で分割して整形。各フィールドは右揃え。
"<Leader>tsq    空白文字で分割して整形。ダブルクォートで囲まれたフィールドをサポート。各フィールドは左揃え。
"<Leader>tab    TSVの整形。タブ文字で分割して整形。タブ文字は半角スペースに変換される。
"<Leader>t{セパレータ} 指定したセパレータで分割して整形。各フィールドは左揃え。
"<Leader>T{セパレータ} 指定したセパレータで分割して整形。各フィールドは右揃え。
"<Leader>tml    行末のバックスラッシュの位置の整形。シェルスクリプト用。
"<Leader>Htd    HTMLのテーブルの整形。
"<Leader>tt LaTexのテーブルの整形。
"
"surround系
"http://blog.scimpr.com/2012/09/08/surround-vimチュートリアルをためす/
"Change Surroucol("$")nd
"cs"'
"
"Change Surround x to Tag
"cs'<q>
"
"Change Surround Tag to x
"cst"
"
"Delete Surround
"ds"
"
"You Surround x
"ysiw]
"
"空白つきのカッコで囲む
"cs]{
"
"行全体を囲む
"yss)
"
"削除する
"ds{ds)
"
"You Surround x with Tag
"ysiw<pre>
"
"その他
"http://www.kaoriya.net/testdir/command_list.txt
"http://www.c.csce.kyushu-u.ac.jp/kb/wiki/index.php?%A5%BD%A5%D5%A5%C8%A5%A6%A5%A8%A5%A2%2FVim%2FFAQ
"

