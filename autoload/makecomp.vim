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

    if !filereadable(fname)
        echoerr 'Makefile is NOT exist.'
        return []
    endif

    let cmdlist = filter(readfile(fname), "(v:val !~? '^.*=.*$') && (v:val =~? '^.*:.*$') && (v:val !~? '^[.#].*$')")
    let cmdlist = map(cmdlist, "substitute(v:val, '[[:space:]	]*:.*$', '', '')")

    if a:arg_lead != ''
        let cmdlist = filter(cmdlist, "v:val =~? '^" . a:arg_lead . ".*'")
    endif

    return cmdlist
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
