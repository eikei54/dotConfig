"dein Scripts-----------------------------
if &compatible
	set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('$HOME/.cache/dein')
    call dein#begin('$HOME/.cache/dein')

    " Let dein manage dein
    " Required:
    call dein#add('$HOME/.cache/dein/repos/github.com/Shougo/dein.vim')

    " Add or remove your plugins here:
    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')
    " You can specify revision/branch/tag.
    call dein#add('Shougo/deol.nvim', { 'rev': '01203d4c9' })

    call dein#add('itchyny/lightline.vim')
    call dein#add('scrooloose/nerdtree')
    call dein#add('kien/ctrlp.vim')
    call dein#add('majutsushi/tagbar')
    call dein#add('godlygeek/tabular')
    call dein#add('rking/ag.vim')
    call dein#add('vim-jp/cpp-vim')
    call dein#add('nathanaelkane/vim-indent-guides')
    call dein#add('tpope/vim-surround')
    call dein#add('kien/rainbow_parentheses.vim')
    call dein#add('vim-scripts/grep.vim')
    call dein#add('tpope/vim-fugitive')
    call dein#add('vim-ctrlspace/vim-ctrlspace')

    " for displaying index searched item
    call dein#add('google/vim-searchindex')
    " " Display diffs in Vim
    call dein#add('airblade/vim-gitgutter')
    "
    " " Search words selected part in visual mode.
    call dein#add('nelstrom/vim-visual-star-search')
    "
    " " Setting for fzf"
    "
    " ファイル末尾の余分なスペースをハイライト表示
    call dein#add('bronson/vim-trailing-whitespace')
    "
    " Easymotion
    call dein#add('easymotion/vim-easymotion')
    "
    " " Hightlight Multiple
    call dein#add('t9md/vim-quickhl')
    "
    " " color scheme
    call dein#add('tomasr/molokai')
    "
    call dein#add('dracula/vim')
    call dein#add('NLKNguyen/papercolor-theme')


    " Required:
    call dein#end()
    call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" vim起動時のみruntimepathにneobundle.vimを追加
if has('vim_starting')
  set nocompatible
  set hidden
endif


" If you want to install not installed plugins on startup.
if dein#check_install()
    call dein#install()
endif

"End dein Scripts-------------------------


set shortmess+=I                                " 起動時のメッセージを消す

set number                                      " 行数を表示
set title

colorscheme molokai
set background=dark




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
" For vim-searchindex setting
" ------------------------------------
let g:searchindex_improved_star = 0
let g:searchindex_star_case = 0

" ------------------------------------
" For Common Setting
" ------------------------------------

set helplang=en                                 " use English version help
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
n  ------
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
  \ }



" ------ Key Setting ------------

"" setting <Leader>key
let mapleader = "\<Space>"

"" for quickfix setting
nnoremap [q :cprevious<CR>   " previous
nnoremap ]q :cnext<CR>       " next
nnoremap [Q :<C-u>cfirst<CR> " Top
nnoremap ]Q :<C-u>clast<CR>  " Last

nnoremap <F5> /IS\sCMD\sALLOWED<Bslash><Bar>QM\stask\scomplete<Bslash><Bar>\cuec\s\+=\s0000[1-9A-F]\{4\}<CR>
nnoremap <S-F5> ?IS\sCMD\sALLOWED<Bslash><Bar>QM\stask\scomplete<Bslash><Bar>\cuec\s\+=\s0000[1-9A-F]\{4\}<CR>
"nnoremap <F5> /opCode<CR>
"nnoremap <S-F5> ?opCode<CR>

nnoremap <S-F6> :vimgrep \cuec\s\+=\s0000[1-9A-F]\{4\} %<CR>
nnoremap <F6> :vimgrep IS\sCMD\sALLOWED<Bslash><Bar>QM\stask\scomplete<Bslash><Bar>\cuec\s\+=\s0000[1-9A-F]\{4\} % <CR>

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

"set clipboard+=autoselect,unnamed

" use cliipboard
nnoremap Y "+Y

" <Leader>i でコードをインデント整形
"map <Leader>i gg=<S-g><C-o><C-o>zz

"" highlight the current word withoug moving the cursor
nnoremap <silent> <Leader>h "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>
"nnoremap * *``

"" turn off hilight part by pushing esc key twice
nnoremap <ESC><ESC> :nohlsearch<CR>
nnoremap <Leader>o :nohlsearch<CR>

" 最後に変更した場所へ戻る(便利)
map <C-m> `.

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

" ----------------------------
" input mode setting
" ----------------------------
"" back to command mode by pushing j key twice
inoremap <silent> jj <ESC>

cnoremap { {}<Left>
cnoremap [ []<Left>
cnoremap ( ()<Left>
cnoremap " ""<Left>
cnoremap ' ''<Left>
cnoremap <> <><Left>

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

set grepprg=ag\ -n\ -iS

if has("win32")
    " Windows環境用のコード
    "grep.vim用にGitbashのgrepにパスを通す"
    let Grep_Path = 'C:\tools\bin_win32\grep.exe'
    let Grep_Xargs_Path = 'C:\tools\bin_win32\xargs.exe'
    let Grep_Find_Path = 'C:\tools\bin_win32\find.exe'
    let Grep_Shell_Quote_Char = '"'
endif

""let g:Grep_Default_Filelist = '*.cpp *.ipp *.c *.hpp *.h *hh *.spp *.tcl *.dao *.dat *.mak *.seq *.cmake *.txt'
let Grep_Skip_Dirs = '.svn'
let Grep_Default_Options = '-I'   "バイナルファイルをgrepしない
let Grep_Skip_Files = '*.bak *~ *.out tags'  "バックアップファイルを無視する




" ------------------------------------
" for quickhl Setting
" ------------------------------------
nmap ht <Plug>(quickhl-manual-this)
xmap ht <Plug>(quickhl-manual-this)
nmap hm <Plug>(quickhl-manual-toggle)
xmap hm <Plug>(quickhl-manual-toggle)

nmap hr <Plug>(quickhl-manual-reset)
xmap hr <Plug>(quickhl-manual-reset)

nmap hc <Plug>(quickhl-cword-toggle)

nmap h] <Plug>(quickhl-tag-toggle)

map H <Plug>(operator-quickhl-manual-this-motion)

" Highlight cword
let g:quickhl_cword_enable_at_startup = 1

" Highlight Keyword
let g:quickhl_manual_enable_at_startup = 1
let g:quickhl_manual_keywords = [
   \ {"pattern": '[uU]ec\s\+=\s0000[1-9A-F]\{4\}', "regexp": 1 },
   \ {"pattern": 'errorCode\s\+=\s0000[1-9A-F]\{4\}', "regexp": 2 },
   \ {"pattern": 'CE\sIS\sCMD\sALLOWED\s\+opCode\s\+', "regexp": 3 },
   \ ]

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



