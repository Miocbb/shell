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
set termguicolors " set true color
set spelllang=en  " set spell checking with English
set spell         " trigger on spell checking
set splitbelow
set splitright

set list
set showbreak=↪
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨



let mapleader=";"
let maplocalleader=";"
syntax enable
syntax on

"*********************************************
"*              vim setting
"*********************************************
" Compatible with tmux setting{{{
" easier split navigation
if !exists('$TMUX') " make it compatible with tmux
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>
else
    " reqired to enable reszie vim split windows with mouse
    " in tmux.
    set ttymouse=xterm2
endif
"}}}

" vim buffer switching{{{
set hidden
nnoremap <Leader>bn :bnext<CR>
nnoremap <Leader>bb :bprev<CR>
nnoremap <Leader>bd :bdelete<CR>
" }}}

" vim clear search highlighting{{{
nnoremap <Leader><space> :noh<cr>
"}}}

" jump between locations{{{
" used by Syntastic to jump between errors.
nnoremap <Leader>en :lnext<CR>
nnoremap <Leader>eb :lprev<CR>
" }}}


autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif


"*********************************************
"*              Vundle Setting               *
"*********************************************

filetype off                              " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" begin of plugin list
Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox'                  " color scheme
Plugin 'altercation/vim-colors-solarized' " color scheme
Plugin 'SirVer/ultisnips'                 " input code blocks
Plugin 'Valloric/YouCompleteMe'           " famous YCM
Plugin 'Yggdroot/indentLine'              " indentLine
Plugin 'yegappan/grep'                    " grep.vim
Plugin 'mileszs/ack.vim'                  " ack.vim
Plugin 'dyng/ctrlsf.vim'                  " a search and view tool for vim
Plugin 'scrooloose/nerdcommenter'         " annotation
Plugin 'easymotion/vim-easymotion'        " speed motion in vim
Plugin 'scrooloose/nerdtree'              " file manage system for vim
Plugin 'vim-airline/vim-airline'          " vim-airline
Plugin 'vim-airline/vim-airline-themes'   " vim-airline-theme
Plugin 'derekwyatt/vim-fswitch'           " fast switch between *.h and *.c
Plugin 'majutsushi/tagbar'                " list tags in a split window
Plugin 'Miocbb/cscope.vim'                " forked from brookhong/cscope.vim
Plugin 'LaTeX-Box-Team/LaTeX-Box'         " latex plugin
Plugin 'iamcco/mathjax-support-for-mkdp'
Plugin 'iamcco/markdown-preview.vim'
Plugin 'plasticboy/vim-markdown'          " needed to disabel vim conceal (can not `set conceallevel=0` due to the indentline plugin)
Plugin 'rakr/vim-one'                     " vim colorscheme
Plugin 'christoomey/vim-tmux-navigator'   " seamlessly navigation for both vim and tmux
Plugin 'vim-syntastic/syntastic'          " syntastic checking plugin


"Plugin 'lervag/vimtex'                   " latex plugin support more PDF viewers
" end of plugin list

call vundle#end()                         " required
filetype plugin indent on                 " required

"*********************************************
" Put your Plugin seting after this line
"*********************************************

"set term=xterm-256color
" gruvbox{{{
colorscheme gruvbox
"}}}

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
let g:ycm_global_ycm_extra_conf='~/.vim/ycm_global_extra_conf.py'
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
" disable syntastic checking to be
" competitive with Syntastic
let g:ycm_show_diagnostics_ui = 0
"}}}

" Syntastic checking{{{
" enable Syntastic checking will active a bug in Cscope.vim,
" that is, calling CscopeFind will make a error if the fould
" file is not opened in vim buffer. Once hit <enter>, CscopeFind
" will continue to work as expected. Although Cscope.vim still
" can function, this little bug is annoying every time.
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_c_remove_include_errors = 1
let g:syntastic_enable_balloons = 1
let g:syntastic_loc_list_height = 5

" set gcc checker
let g:syntastic_c_checkers = ['gcc']
let g:syntastic_c_compiler_options = "-std=gnu99 -c -Wall"
let g:syntastic_c_config_file = "/home/yuncai/Documents/Server/qm4d.config"
" set flake8 checker
let g:syntastic_python_checkers = ['flake8']
" }}}


"indentline{{{
"highlight the indentline color 
let g:indentLine_setColors = 0
"}}}


"CtrlSF{{{
nnoremap <Leader>sp :CtrlSF<CR>
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


"cscope.vim{{{
"bug: if it is the first time to use cscope.vim function in a project,
"     the vim window will be black after refresh buffer. Once the database
"     is created, it works well.
" can not jump to declaration.
nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
nnoremap <leader>l :call ToggleLocationList()<CR>
" g: global: find global definition(s) of the token under cursor
nnoremap  <leader>fg :call CscopeFind('g', expand('<cword>'))<CR> :<CR>
nnoremap  <leader>fvg :vsp <CR>:call CscopeFind('g', expand('<cword>'))<CR> :<CR>
nnoremap  <leader>fhg :sp  <CR>:call CscopeFind('g', expand('<cword>'))<CR> :<CR>
" d: called: find functions that function under cursor calls
nnoremap  <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
" c: calls:  find functions calling this function
nnoremap  <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
" f: file: find file under cursor
nnoremap  <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
nnoremap  <leader>fvf :vsp <CR>:call CscopeFind('f', expand('<cword>'))<CR>
nnoremap  <leader>fhf :sp <CR>:call CscopeFind('f', expand('<cword>'))<CR>

" t: text: find all instances of the text under cursor
nnoremap  <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
" e: egrep: egrep search for the word under cursor
nnoremap  <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
" i: includes: find files that include the filename under cursor
nnoremap  <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>
" s: symbol: find all reference to the token under cursor
nnoremap  <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
"let g:cscope_open_location = 0
let g:cscope_silent = 1
"}}}


"Latex-box{{{
let g:tex_flavor='latex'
"let g:LatexBox_viewer="SumatraPDF"
" use the default indent. LaTeX-Box uses two tabs, too wide.
let g:LatexBox_custom_indent=0
" use pdfLaTeX
let g:LatexBox_latexmk_options =
          \ '-pdflatex="pdflatex -synctex=1 %O %S"'
" Inverse search
"let g:LatexBox_viewer = 'SumatraPDF -reuse-instance -inverse-search '
"          \ . '"gvim --servername ' . v:servername
"          \ . ' --remote-send \"^<C-\^>^<C-n^>'
"          \ . ':drop \%f^<CR^>:\%l^<CR^>:normal\! zzzv^<CR^>'
"          \ . ':call remote_foreground('''.v:servername.''')^<CR^>\""'
" Folding
let g:LatexBox_Folding=1
let g:LatexBox_fold_automatic=0 " use \lf to calculate folding
" \ls to forward search, see ftplugins/tex.vim
let g:tex_conceal = "" "disable vim tex_conceal feature
"}}}

"{{{vim-markdown
let g:vim_markdown_conceal=0
"}}}

autocmd BufWritePost $MYVIMRC source $MYVIMRC " make changes effective instantly
