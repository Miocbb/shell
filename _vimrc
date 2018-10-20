source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

" disable beep
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set encoding=utf-8
set termencoding=cp936
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
language messages zh_CN.UTF-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""Below refered to et-mei .vimrc. The bundle path has changed
""""""to corresponding values.

set guifont=DejaVu_Sans_Mono:h12:cANSI:qDRAFT
"set lines=999 columns=999" set initial vim window size
set nocompatible            " be iMproved, required
set backspace=2
set nobackup
set nowritebackup
set noundofile
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
set foldmethod=expr  " LatexBox_Folding need fold-expr
set nofoldenable
set spelllang=en            " set spell checking with English
set spell                   " trigger on spell checking
let mapleader=";"
let maplocalleader = ";"
syntax enable
syntax on
"
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

filetype off                  " required

" set the runtime path to include Vundle and initialize
"set rtp+=C:\Software_Mei\gvim_8.0.0003_x64\vim/vimfiles/bundle/Vundle.vim
"call vundle#begin('C:\Software_Mei\gvim_8.0.0003_x64\vim/vimfiles/bundle/')
set rtp+=C:\Software\vim/vimfiles/bundle/Vundle.vim
call vundle#begin('C:\Software\vim/vimfiles/bundle/')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox'            " color scheme
Plugin 'SirVer/ultisnips'           " input code blocks. needs 'honza/vim-snippets'
Plugin 'Yggdroot/indentLine'        " indentLine
Plugin 'LaTeX-Box-Team/LaTeX-Box'   " LaTex
Plugin 'Valloric/YouCompleteMe'     " YCM
Plugin 'easymotion/vim-easymotion'  " cursor speed motion


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

colorscheme gruvbox
highlight Comment cterm=italic

" For Python{{{
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=79 expandtab
"}}}
 

" ultisnips{{{
" compitable with YCM
let g:UltiSnipsSnippetDirectories=["vim-snippets"]
let g:UltiSnipsExpandTrigger="<leader><tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsUsePythonVersion = 2

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"}}}


"indentLine
"{{{
"highlight the indentline color 
let g:indentLine_setColors = 0
set list
set showbreak=↪
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
"highlight SpecialKey ctermfg= 
"}}}


"Latex-box{{{
let g:tex_flavor='latex'
let g:LatexBox_viewer="SumatraPDF"
" use the default indent. LaTeX-Box uses two tabs, too wide.
let g:LatexBox_custom_indent=0
" use pdfLaTeX
let g:LatexBox_latexmk_options =
          \ '-pdflatex="pdflatex -synctex=1 %O %S"'
" Inverse search
let g:LatexBox_viewer = 'SumatraPDF -reuse-instance -inverse-search '
          \ . '"gvim --servername ' . v:servername
          \ . ' --remote-send \"^<C-\^>^<C-n^>'
          \ . ':drop \%f^<CR^>:\%l^<CR^>:normal\! zzzv^<CR^>'
          \ . ':call remote_foreground('''.v:servername.''')^<CR^>\""'
" Folding
let g:LatexBox_Folding=1
let g:LatexBox_fold_automatic=0 " use \lf to calculate folding
" \ls to forward search, see ftplugins/tex.vim
let g:tex_conceal = "" "disable vim tex_conceal feature
"}}}


au GUIEnter * simalt ~x "initial the window to full size
