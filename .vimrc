set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'hdima/python-syntax'
Plugin 'bling/vim-airline'
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
Plugin 'vivien/vim-linux-coding-style'

" Bundles
Bundle 'flazz/vim-colorschemes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set laststatus=2

set omnifunc=jedi#completions
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

syntax enable
colorscheme molokai

set sw=4 sts=4 et
set lcs=tab:▸\ ,trail:· list

let g:linuxsty_patterns = [ "/home/krautcat/university/diploma/spi-generic-module" ]
