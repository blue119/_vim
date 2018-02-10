
" =============================================================================
" [ Functions & autocmd ]                                                  {{{
"
    " -------------------------------------------------------------------------
    " set vim to chdir for each file                                       {{{
    " if exists('+autochdir')
        " set autochdir
    " else
        " augroup MyAutoCmd
            " autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
        " augroup END
    " endif
    " }}}

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

                        " \ strftime('%a %b %d, %Y  %I:%M%p') . '#e'
    " augroup MyAutoCmd
        " autocmd BufWritePre * call LastModified()
    " augroup End

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

    " -------------------------------------------------------------------------
    " vim macro to jump to devhelp topics. {{{
    "
    "function! DevHelpCurrentWord()
    "    let word = expand("<cword>")
    "    exe "!devhelp -s " . word
    "endfunction
    "
    "nmap hdh :call DevHelpCurrentWord()<CR>
    " }}}

"
" [ Functions & autocmd ]                                                  }}}
" =============================================================================

" =============================================================================
" [ MISC ]                                                                 {{{
"
    "  Search code sample from Google code                                 {{{
    "
    "function! OnlineDoc()
    "    let s:browser = "google-chrome"
    "    let s:wordUnderCursor = expand("<cword>")
    "
    "    if &ft == "cpp" || &ft == "c" || &ft == "ruby" || &ft == "php" || &ft == "python"
    "        let s:url = "http://www.google.com/codesearch?q=".s:wordUnderCursor."+lang:".&ft
    "    elseif &ft == "vim"
    "        let s:url = "http://www.google.com/codesearch?q=".s:wordUnderCursor
    "    else
    "        return
    "    endif
    "
    "    let s:cmd = "silent !" . s:browser . " " . s:url
    "    "echo  s:cmd
    "    execute  s:cmd
    "    redraw!
    "endfunction

    " online doc search
    " map <LocalLeader>k :call OnlineDoc()<CR>
    " }}}

    " vim as a calcuator"                                                  {{{
    :command! -nargs=+ Calc :py3 print(<args>)
    :py3 from math import *
    " }}}

    " Script test                                                          {{{
    "
    " function! CapitalizeCenterAndMoveDown()
        " s/\<./\u&/g "Built-in substitution capitalizes each word
        " center      "Built-in center command centers entire line
        " +1          "Built-in relative motion (+1 line down)
    " endfunction

    " nmap <silent><LocalLeader>C :call CapitalizeCenterAndMoveDown()<CR>
    " }}}
"
" [ MISC ]                                                                 }}}
" =============================================================================
