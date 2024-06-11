
" =============================================================================
" [ Functions & autocmd ]                                                  {{{
"
    " -------------------------------------------------------------------------
    " Automatically update 'Modified' field {{{
    " If buffer modified, update any 'Last modified: ' in the first 20 lines.
    "
    function! LastModified()
        " if &modified
            normal ms
            let n = min([20, line("$")])
            exe '1,' . n . 's#^\(.\{,10}:Modified: \).*#\1' .
                        \ strftime('%Y-%m-%d %H:%M') . '#e'
            normal `s
        " endif
    endfun
    command! LastModified call LastModified()


    " }}}

    " -------------------------------------------------------------------------
    " Remember the line number been edited last time {{{
    if has("autocmd")
        augroup MyAutoCmd
            autocmd BufRead *.txt set tw=78
            autocmd BufReadPost *
            \ if line("'\"") > 0 && line ("'\"") <= line("$") |
            \   exe "normal g'\"" |
            \ endif

            autocmd BufWinLeave *
                \   if (v:progname != "vimdiff") &&
                \       expand("%") != "" &&
                \       expand("%") !~ "gitv-" &&
                \       expand("%") !~ ".tmp" &&
                \       expand("%") !~ "__MRU_Files__"
                \
                \|       silent! mkview
                \|  endif

            autocmd BufWinEnter *
                \   if (v:progname != "vimdiff") &&
                \       expand("%") != "" &&
                \       expand("%") !~ "gitv-" &&
                \       expand("%") !~ ".tmp" &&
                \       expand("%") !~ "__MRU_Files__"
                \
                \|      silent! loadview
                \|  endif

            " Restore cursor to file position in previous editing session
            autocmd BufReadPost *
                \   if line ("'\"") > 0 && line ("'\"") <= line("$")
                \|      exe "normal g'\""
                \|  endif
        augroup END
    endif
    " }}}

    " -------------------------------------------------------------------------
    " QUICKFIX WINDOW for :make {{{
    function! QFixToggle(forced)
        if exists("g:qfix_win") && a:forced == 0
            cclose
            unlet g:qfix_win
        else
            copen 6
            let g:qfix_win = bufnr("$")
        endif
    endfunction

    command! -bang -nargs=? QFix call QFixToggle(<bang>0)
    nnoremap <leader>q :QFix<CR>
    " nnoremap <C-n> :cnext<CR>
    " nnoremap <C-p> :cprev<CR>
    " }}}

    " -------------------------------------------------------------------------
    " [Highlight column matching { } pattern], A very cool stuff(Kent) {{{
    let s:hlflag=0

    function! ColumnHighlight()
        let c=getline(line('.'))[col('.') - 1]
        if c=='{' || c=='}'
            set cuc
            let s:hlflag=1
        else
            if s:hlflag==1
                set nocuc
                let s:hlflag=0
            endif
        endif
    endfunction

    autocmd MyAutoCmd CursorMoved * call ColumnHighlight()
    " }}}
