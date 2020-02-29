set nocompatible              " be iMproved, required
filetype off                  " required

""" Vundle stuff
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'hdima/python-syntax'
Plugin 'bling/vim-airline'
" Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
Plugin 'vivien/vim-linux-coding-style'

Plugin 'Valloric/YouCompleteMe'

Plugin 'w0rp/ale'

" Buffers and tabs
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'kien/ctrlp.vim'

" Bundles
Bundle 'flazz/vim-colorschemes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"""

set laststatus=2

set omnifunc=jedi#completions
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

syntax enable
colorscheme molokai

set sw=4 sts=4 et
set lcs=tab:▸\ ,trail:· list
set colorcolumn=80
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

""" Airline stuff
" From https://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
"""

""" Ale stuff 
" Perl::Critic violations as warnings (see https://stackoverflow.com/questions/\
" 46080490/forcing-ale-to-display-perlcritic-violations-as-warnings-rather-\
" than-errors) 
let g:ale_type_map = {
\    'perl': {'ES': 'WS'}, 
\    'perlcritic': {'ES': 'WS', 'E': 'W'},
\}
"""

""" Functions
" Return indent (all whitespace at start of a line), converted from
" tabs to spaces if what = 1, or from spaces to tabs otherwise.
" When converting to tabs, result has no redundant spaces.
function! Indenting(indent, what, cols)
    let spccol = repeat(' ', a:cols)
    let result = substitute(a:indent, spccol, '\t', 'g')
    let result = substitute(result, ' \+\ze\t', '', 'g')
    if a:what == 1
        let result = substitute(result, '\t', spccol, 'g')
    endif
    return result
endfunction
" Convert whitespace used for indenting (before first non-whitespace).
" what = 0 (convert spaces to tabs), or 1 (convert tabs to spaces).
" cols = string with number of columns per tab, or empty to use 'tabstop'.
" The cursor position is restored, but the cursor will be in a different
" column when the number of characters in the indent of the line is changed.
function! IndentConvert(line1, line2, what, cols)
    let savepos = getpos('.')
    let cols = empty(a:cols) ? &tabstop : a:cols
    execute a:line1 . ',' . a:line2 . 's/^\s\+/\=Indenting(submatch(0), a:what, cols)/e'
    call histdel('search', -1)
    call setpos('.', savepos)
endfunction
command! -nargs=? -range=% Space2Tab call IndentConvert(<line1>,<line2>,0,<q-args>)
command! -nargs=? -range=% Tab2Space call IndentConvert(<line1>,<line2>,1,<q-args>)
command! -nargs=? -range=% RetabIndent call IndentConvert(<line1>,<line2>,&et,<q-args>)
