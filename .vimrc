"
" Author: Yao-Po Wang
" Web:
" Modified: 2015-06-06 15:25
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ============================================================================
" [ General Setting ]                                                      {{{
"
if &compatible
  set nocompatible               " Be iMproved
endif

" let $VIMPATH = fnamemodify(resolve(expand('<sfile>:p')), ':h')
let $VIMPATH = expand('<sfile>:h').'/.vim'
let $VARPATH = expand(($XDG_CACHE_HOME ? $XDG_CACHE_HOME : '~/.cache').'/vim')

function! s:source_file(path, ...) abort
    let use_global = get(a:000, 0, ! has('vim_starting'))
    let abspath = resolve(expand($VIMPATH.'/config/'.a:path))
    if ! use_global
        execute 'source' fnameescape(abspath)
        return
    endif

    let content = map(readfile(abspath),
        \ "substitute(v:val, '^\\W*\\zsset\\ze\\W', 'setglobal', '')")
    let tempfile = tempname()
    try
        call writefile(content, tempfile)
        execute printf('source %s', fnameescape(tempfile))
    finally
        if filereadable(tempfile)
            call delete(tempfile)
        endif
    endtry
endfunction

" Set augroup
augroup MyAutoCmd
    autocmd!
    autocmd CursorHold *? syntax sync minlines=300
augroup END

" Initialize base requirements
if has('vim_starting')
    call s:source_file('init.vim')
    if has('nvim')
        " Neovim settings
        call s:source_file('neovim.vim')
    elseif ! has('gui_running') && ! has('win32') && ! has('win64')
        " Linux terminal settings
        call s:source_file('terminal.vim')
    endif
endif

" load plugin system(package manager)
if has('vim_starting')
    call s:source_file('plugin-init.vim')
endif

call s:source_file('plugins/all.vim')

    filetype plugin indent on
syntax enable

" if ! has('vim_starting')
    " call dein#call_hook('source')
    " call dein#call_hook('post_source')
" endif

" Loading configuration modules
call s:source_file('general.vim')
call s:source_file('filetype.vim')
call s:source_file('mappings.vim')
call s:source_file('theme.vim')

" Load user custom local settings
if filereadable(expand('$VIMPATH/config/local.vim'))
    call s:source_file('local.vim')
endif
set secure

" vim:fdm=marker:et:fdl=0:

