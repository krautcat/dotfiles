set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'hdima/python-syntax'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
if !((getcwd() =~ 'kernel/linux*') || (getcwd() =~ 'spi-generic-module'))
    Plugin 'Valloric/YouCompleteMe'
endif
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
Plugin 'joe-skb7/cscope-maps'
Plugin 'vivien/vim-linux-coding-style'
Plugin 'embear/vim-localvimrc'
Plugin 'majutsushi/tagbar'

" Bundles
Bundle 'flazz/vim-colorschemes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" how existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

set laststatus=2
let g:airline_theme='molokai'

set omnifunc=jedi#completions
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

syntax enable

colorscheme molokai

function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf 
endfunction

nmap <silent> <leader>mw :call MarkWindowSwap()<CR>
nmap <silent> <leader>pw :call DoWindowSwap()<CR>

map <F2> :retab <CR> w! <CR>
set pastetoggle=<F3>

" Don't ask when load local vimrcfile and do it not in a sandbox
let g:localvimrc_ask = 0
let g:localvimrc_sandbox = 0

" Allow autoload of local .ycm_extra_conf.py
let g:ycm_confirm_extra_conf = 0

let g:linuxsty_patterns = [ "/home/krautcat/University/diploma/spi-generic-module" ]
