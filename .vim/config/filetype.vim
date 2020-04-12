
" =============================================================================
" [ Programming Related ]                                  {{{

    " -------------------------------------------------------------------------
    " [ General ] {{{
    "
    " Remove unnecessary spaces in the end of line
    " augroup MyAutoCmd
        " autocmd FileType vala,perl,python,html,js autocmd FileWritePre,BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
    " augroup End

    function! YPRemoveTailingSpace()
        :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
    endfunction
    command! YPRemoveTailingSpace call YPRemoveTailingSpace()
    " }}}

    " -------------------------------------------------------------------------
    " [ sh ]                                                                {{{
    "
    function! s:sh_custom()
        noremap <F2> :% w !bash<CR>
        " autocmd MyAutoCmd FileWritePre,BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
    endfunction

    if has("autocmd")
        augroup MyAutoCmd
            autocmd Filetype sh call s:sh_custom()
        augroup END
    endif
    " }}}

    " -------------------------------------------------------------------------
    " [ csv ]                                                               {{{
    "
    function! s:csv_custom()
        setlocal cc=0
    endfunction

    if has("autocmd")
        augroup MyAutoCmd
            autocmd Filetype csv call s:csv_custom()
        augroup END
    endif
    " }}}

    " -------------------------------------------------------------------------
    " [ help ]                                                              {{{
    "
    function! s:help_custom()
        nnoremap q :q<CR>
    endfunction

    if has("autocmd")
        augroup MyAutoCmd
            autocmd Filetype help call s:help_custom()
        augroup END
    endif
    " }}}

    " -------------------------------------------------------------------------
    " [ python ]                                                            {{{
    "
    function! s:python_custom()
        function! s:man(keyword)
            execute '!pydoc ' . a:keyword
        endfunction
        command! -nargs=1 Man call s:man(<f-args>)
        nnoremap K :!pydoc <cword><CR>

        setlocal tabstop=4 shiftwidth=4
        setlocal foldmethod=indent foldcolumn=4 foldlevel=3 foldnestmax=3

        iabbr iii import IPython; IPython.embed()
        iabbr ddd import ipdb; ipdb.set_trace()

        noremap <F2> :% w !python<CR>
        " let g:pymode_lint_write = 0
        let g:syntastic_python_checkers = 0
    endfunction

    if has("autocmd")
        augroup MyAutoCmd
            autocmd Filetype python call s:python_custom()
        augroup END
    endif
    " }}}

    " -------------------------------------------------------------------------
    " [ golang ]                                                                {{{
    "
    function! s:go_custom()
        noremap <F2> :% w !go run %<CR>
        au FileType go map <leader>t :Tmux go test<CR>
    endfunction

    if has("autocmd")
        augroup MyAutoCmd
            autocmd Filetype go call s:go_custom()
        augroup END
    endif
    " }}}

    " -------------------------------------------------------------------------
    " [ ls ]                                                                {{{
    "
    function! s:ls_custom()
        set expandtab      " Use spaces for tabs
        noremap <F2> :% w !lsc %<CR>
        augroup MyAutoCmd
            " autocmd FileType ls autocmd FileWritePre,BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
        augroup END
    endfunction

    if has("autocmd")
        augroup MyAutoCmd
            autocmd Filetype ls call s:ls_custom()
        augroup END
    endif
    " }}}

    " -------------------------------------------------------------------------
    " [ haskell ]                                                                 {{{
    "

    autocmd BufEnter *.hs compiler ghc
    let g:ghc="/usr/bin/ghc"
    let g:haddock_browser="/home/blue119/iOpt/stow/firefox-bin/bin/firefox"

    function! s:hs_custom()
        " Tab specific option
        set tabstop=8                   "A tab is 8 spaces
        set expandtab                   "Always uses spaces instead of tabs
        set softtabstop=4               "Insert 4 spaces when tab is pressed
        set shiftwidth=4                "An indent is 4 spaces
        set shiftround                  "Round indent to nearest shiftwidth multiple

    endfunction

    if has("autocmd")
        augroup MyAutoCmd
            autocmd Filetype hs,haskell call s:hs_custom()
        augroup END
    endif
    " }}}

    " -------------------------------------------------------------------------
    " [ c ]                                                                 {{{
    "
    function! s:c_custom()
        " http://stackoverflow.com/questions/729249/how-to-efficiently-make-with-vim
        "set makeprg=make
        "set errorformat=%f:%l:\ %m
        setlocal equalprg=indent
        setlocal expandtab

        let g:syntastic_cpp_compiler_options = ' -std=c++14 -stdlib=libc++'

        " color/paged man
        runtime! ftplugin/man.vim
        nmap K :Man <c-r><c-w><cr>
    endfunction

    if has("autocmd")
        augroup MyAutoCmd
            autocmd Filetype c,cpp call s:c_custom()
        augroup END
    endif
    " }}}

    " -------------------------------------------------------------------------
    " [ Javascript ]                                                       {{{
    "
    " json = javascript syntax highlight
    " if has("autocmd")
        " augroup MyAutoCmd
            " autocmd FileType json setlocal syntax=javascript
        " augroup END
    " endif
    " }}}
    "
    " -------------------------------------------------------------------------
    " [ Javascript ]                                                       {{{
    let g:jsx_ext_required = 0

    " }}}

    " -------------------------------------------------------------------------
    " [ vim-cpp-enhanced-highlight ]                                                       {{{
    "
    let g:cpp_class_scope_highlight = 1
    " let g:cpp_experimental_template_highlight = 1
    " }}}

    " -------------------------------------------------------------------------
    " [ HTML/xHTML]                                                       {{{
    "
    function! s:html_custom()
        set makeprg=wkhtmltopdf\ %\ /tmp/%<.pdf
    endfunction

    if has("autocmd")
        augroup MyAutoCmd
            autocmd Filetype html,xhtml call s:html_custom()
        augroup END
    endif
    " }}}

    " -------------------------------------------------------------------------
    " [ vala ]                                                             {{{
    "
    augroup MyAutoCmd
        autocmd BufRead *.vala set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
        autocmd BufRead *.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
    augroup END
    au BufRead,BufNewFile *.vala    setfiletype vala
    au BufRead,BufNewFile *.vapi    setfiletype vala
    " Disable valadoc syntax highlight
    "let vala_ignore_valadoc = 1

    " Enable comment strings
    let vala_comment_strings = 1

    " Highlight space errors
    let vala_space_errors = 1
    " Disable trailing space errors
    "let vala_no_trail_space_error = 1
    " Disable space-tab-space errors
    let vala_no_tab_space_error = 1

    " Minimum lines used for comment syncing (default 50)
    "let vala_minlines = 120
    " }}}

    " -------------------------------------------------------------------------
    " [ Hex/Binary Edit ]                                       {{{
    "
    " autocmds to automatically enter hex mode and handle file writes properly
    if has("autocmd")
    " vim -b : edit binary using xxd-format!
        augroup MyAutoCmd
            au BufReadPre *.bin,*.hex,*.pkg,*.img,*.out setlocal binary
            au BufReadPost *
                \ if &binary | Hexmode | endif
            au BufWritePre *
                \ if exists("b:editHex") && b:editHex && &binary |
                \  let oldro=&ro | let &ro=0 |
                \  let oldma=&ma | let &ma=1 |
                \  exe "%!xxd -r" |
                \  let &ma=oldma | let &ro=oldro |
                \  unlet oldma | unlet oldro |
                \ endif
            au BufWritePost *
                \ if exists("b:editHex") && b:editHex && &binary |
                \  let oldro=&ro | let &ro=0 |
                \  let oldma=&ma | let &ma=1 |
                \  exe "%!xxd" |
                \  exe "set nomod" |
                \  let &ma=oldma | let &ro=oldro |
                \  unlet oldma | unlet oldro |
                \ endif
        augroup END
    endif

    " ex command for toggling hex mode - define mapping if desired
    command! -bar Hexmode call ToggleHex()

    " helper function to toggle hex mode
    function! ToggleHex()
        " hex mode should be considered a read-only operation
        " save values for modified and read-only for restoration later,
        " and clear the read-only flag for now
        let l:modified=&mod
        let l:oldreadonly=&readonly
        let &readonly=0
        let l:oldmodifiable=&modifiable
        let &modifiable=1
        if !exists("b:editHex") || !b:editHex
            " save old options
            let b:oldft=&ft
            let b:oldbin=&bin
            " set new options
            setlocal binary " make sure it overrides any textwidth, etc.
            let &ft="xxd"
            " set status
            let b:editHex=1
            " switch to hex editor
            %!xxd
        else
            " restore old options
            let &ft=b:oldft
            if !b:oldbin
                setlocal nobinary
            endif
            " set status
            let b:editHex=0
            " return to normal editing
            %!xxd -r
        endif
        " restore values for modified and read only state
        let &mod=l:modified
        let &readonly=l:oldreadonly
        let &modifiable=l:oldmodifiable
    endfunction
    "nnoremap <C-x> :Hexmode<CR>
    " }}}
    " -------------------------------------------------------------------------
    " [ beancount ]                                                            {{{
    "
    function! s:beancount_custom()
        setlocal tabstop=4 shiftwidth=4
        setlocal foldmethod=indent foldcolumn=4 foldlevel=3 foldnestmax=3

        iabbr tt <c-r>=strftime("%F")<cr>

    endfunction

    if has("autocmd")
        augroup MyAutoCmd
            autocmd Filetype beancount call s:beancount_custom()
        augroup END
    endif
    " }}}

" [ Programming Related ]                                  }}}
" =============================================================================
