"=============================================================================
" File: makecomp.vim
" Author: mopp
" Created: 2014-02-15
"=============================================================================


scriptencoding utf-8

if !exists('g:loaded_makecomp')
    runtime! plugin/makecomp.vim
endif
let g:loaded_makecomp = 1

let s:save_cpo = &cpo
set cpo&vim


function! makecomp#get_make_argument(arg_lead, cmd_line, cursor_pos)
    let fname = getcwd() . '/Makefile'
    echomsg 'filename is '.fname

    if !filereadable(fname)
        echoerr 'Makefile is NOT exist.'
        return
    endif

    let makefile = filter(readfile(fname), "(v:val !~? '^.*=.*$') && (v:val =~? '^.*:.*$') && (v:val !~? '^[.#].*$')")
    return map(makefile, "substitute(v:val, '[[:space:]	]*:.*$', '', '')")
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
