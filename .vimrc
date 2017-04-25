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
Plugin 'bling/vim-airline'
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'

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
