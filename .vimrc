set nocompatible              " be iMproved, required
set backspace=2
set nobackup
set nowritebackup
set hlsearch
set wrapscan
set ignorecase
set bg=dark
set wildmenu
set incsearch
set nu
set laststatus=2
set ruler
set cursorline
"set cursorcolumn
set winaltkeys=no
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
set autoindent
set cindent
set mouse=a
set showmode
set foldmethod=syntax
set nofoldenable
set nowrap
set path+=/home/ym95/program/qm4d/source/**2 "set path for go to file (gf)
let mapleader=";"
let maplocalleader=";"
syntax enable
syntax on


autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif


"*********************************************
"*              Vundle Setting               *
"*********************************************

filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" begin of plugin list
Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox'        " color scheme
Plugin 'altercation/vim-colors-solarized' " color scheme
Plugin 'SirVer/ultisnips'       " input code blocks
Plugin 'Valloric/YouCompleteMe' " famous YCM
Plugin 'Yggdroot/indentLine'    " indentLine
Plugin 'yegappan/grep'          " grep.vim
Plugin 'mileszs/ack.vim'        " ack.vim
Plugin 'dyng/ctrlsf.vim'        " a search and view tool for vim
Plugin 'scrooloose/nerdcommenter' " annotation
Plugin 'easymotion/vim-easymotion' " speed motion in vim
Plugin 'scrooloose/nerdtree'    "file manage system for vim
"Plugin 'Lokaltog/vim-powerline' "vim powerline
Plugin 'vim-airline/vim-airline' "vim-airline
Plugin 'vim-airline/vim-airline-themes' "vim-airline-theme
Plugin 'derekwyatt/vim-fswitch' "fast switch between *.h and *.c
Plugin 'majutsushi/tagbar'      "list tags in a split window
Plugin 'fholgado/minibufexpl.vim' "buffer, window manage tool
Plugin 'brookhong/cscope.vim'   "cscope.vim
" end of plugin list

call vundle#end()            " required
filetype plugin indent on    " required

"*********************************************
" Put your non-Plugin stuff after this line
"*********************************************

set term=xterm-256color
colorscheme gruvbox
"colorscheme solarized

highlight Comment cterm=italic
if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://sunaku.github.io/vim-256color-bce.html
    set t_ut=
endif"


"vim-fswitch{{{
"fast switch between *.h and *.c or *.cpp
nmap <silent> <Leader>sw :FSHere<cr>
"}}}


"vim-powerline{{{
"set colorscheme
"let g:Powerline_colorscheme='solarized256'
"show the full path of file in statusline
"let g:Powerline_stl_path_style = 'full'
"Insert the "currhigroup" segment after the filetype segment
"call Pl#Theme#InsertSegment('currhigroup', 'after', 'fileinfo')
"}}}


"vim-airline{{{
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'luna'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline#extensions#default#layout = [
    \ [ 'a', 'b', 'c' ],
    \ [ 'x', 'z' ]
    \ ]
let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
let g:airline#extensions#quickfix#location_text = 'Location'
" tabline setting
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
"}}}


"For Python{{{
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=79 expandtab
"}}}


" UltiSnips{{{
let g:UltiSnipsSnippetDirectories=["vim-snippets"]
" compatible with YCM
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"
"}}}


" YCM{{{
" global conf
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
" complete is enabled in comments
let g:ycm_complete_in_comments=1
" allow vim load .ycm_extra_conf.py
let g:ycm_confirm_extra_conf=0
" turn on YCM tag complete engine
let g:ycm_collect_identifiers_from_tags_files=1
" include tags: already auto loaded by indexer plugin
" YCM OmniCppComplete engine. Set shortcut to ;;
inoremap <leader>; <C-x><C-o>
" show list only
set completeopt-=preview
" start completing from the first character inputed
let g:ycm_min_num_of_chars_for_completion=1
" disable cache
let g:ycm_cache_omnifunc=0
" syntax complete
let g:ycm_seed_identifiers_with_syntax=1
nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
"}}}


"indentline{{{
"highlight the indentline color 
let g:indentLine_setColors = 0
set list
set showbreak=↪
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
"}}}


"CtrlSF{{{
nnoremap <Leader>sp :CtrlSF<CR>
"}}}

"ctags{{{
set tags=/home/ym95/program/qm4d/source/.tags/tags
"open the definition in new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"<ctrl+ w><vd>: open vertical definition (vd)
map <c-w>vt :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
"<ctrl+ w><hd>: open horizontal definition (hd)
map <c-w>ht :sp <CR>:exec("tag ".expand("<cword>"))<CR>
"Ctrl + T: Jump back from the definition.
"}}}


"NERDTree{{{
"use NERDTree to manage files in project. (list file)(lf)
nmap <Leader>lf :NERDTreeToggle<CR>
" set the window size of NERDTree
let NERDTreeWinSize=32
" set the window position of NERDTree
let NERDTreeWinPos="right"
" show hidden files
let NERDTreeShowHidden=1
" NERDTree don't show long information
let NERDTreeMinimalUI=1
" delet buffer at the same time when the files is deleted.
let NERDTreeAutoDeleteBuffer=1
"}}}


"tagsbar{{{
" The Exuberant Ctags are needed, ctags does not work.
" set tagbar windown on the left side
let tagbar_left=1 
" set shotcut for showing tagbar window.(list identifier)(li)
nnoremap <Leader>lg :TagbarToggle<CR>
" set the size of window
let tagbar_width=32 
" hidden useless information
let g:tagbar_compact=1
" show line numbers in the window
let g:tagbar_show_linenumbers=1
" set the targets that ctags generater tags from
let g:tagbar_type_cpp = {
    \ 'kinds' : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0', 
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }
"}}}


"minibufexpl{{{
"show/hide MiniBufExplorer window, (list window)(lw)
map <Leader>lb :MBEToggle<cr>
" tab to switch buffer and window
"forward tab window
map <Leader>bn :MBEbn<cr> 
"backward tab window
map <Leader>bb :MBEbp<cr> 
"delete current buffer
map <Leader>bd :MBEbd<cr>
"eneable cycle tab
let g:miniBufExplCycleArround = 1
let g:miniBufExplorerAutoStart = 0
"}}}


"cscope.vim{{{
nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
nnoremap <leader>l :call ToggleLocationList()<CR>

" g: global: find global definition(s) of the token under cursor
nnoremap  <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
" d: called: find functions that function under cursor calls
nnoremap  <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
" c: calls:  find functions calling this function
nnoremap  <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
" f: file: find file under cursor
nnoremap  <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>

" t: text: find all instances of the text under cursor
nnoremap  <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
" e: egrep: egrep search for the word under cursor
nnoremap  <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
" i: includes: find files that include the filename under cursor
nnoremap  <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>
" s: symbol: find all reference to the token under cursor
nnoremap  <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
"}}}


autocmd BufWritePost $MYVIMRC source $MYVIMRC " make changes effective instantly
