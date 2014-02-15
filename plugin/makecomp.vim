"=============================================================================
" File: makecomp.vim
" Author: mopp
" Created: 2014-02-15
"=============================================================================


scriptencoding utf-8
if exists('g:loaded_makecomp')
    finish
endif
let g:loaded_makecomp = 1

let s:save_cpo = &cpo
set cpo&vim


command! -nargs=1 -complete=customlist,makecomp#get_make_argument Make make <args>


let &cpo = s:save_cpo
unlet s:save_cpo
