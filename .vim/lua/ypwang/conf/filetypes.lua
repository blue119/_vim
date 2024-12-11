local au = vim.api.nvim_create_autocmd

au("FileType", {
    pattern = "help",
    callback = function()
        vim.cmd([[
        nnoremap q :q<CR>
        ]])
    end,
})

au("FileType", {
    pattern = "python",
    callback = function()
        vim.cmd([[
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
        ]])
    end,
})

au("FileType", {
    pattern = { "hs", "haskell" },
    callback = function()
        vim.cmd([[
        set tabstop=8                   "A tab is 8 spaces
        set expandtab                   "Always uses spaces instead of tabs
        set softtabstop=4               "Insert 4 spaces when tab is pressed
        set shiftwidth=4                "An indent is 4 spaces
        set shiftround                  "Round indent to nearest shiftwidth multiple
        let g:ghc="/usr/bin/ghc"
        let g:haddock_browser="/home/blue119/iOpt/stow/firefox-bin/bin/firefox"
        ]])
    end,
})

au("FileType", {
    pattern = { "c", "cpp" },
    callback = function()
        vim.cmd([[
        setlocal equalprg=indent
        setlocal expandtab

        runtime! ftplugin/man.vim
        nmap K :Man <c-r><c-w><cr>
        ]])
    end,
})

au("FileType", {
    pattern = "beancount",
    callback = function()
        vim.cmd([[
        setlocal tabstop=4 shiftwidth=4
        setlocal foldmethod=indent foldcolumn=4 foldlevel=3 foldnestmax=3

        iabbr tt <c-r>=strftime("%F")<cr>
        ]])
    end,
})

au("FileType", {
    pattern = "rust",
    callback = function()
        vim.cmd([[
        setlocal tabstop=4 shiftwidth=4
        setlocal foldmethod=indent foldcolumn=4 foldlevel=3 foldnestmax=3
        ]])
    end,
})

--     " -------------------------------------------------------------------------
--     " [ Hex/Binary Edit ]                                       {{{
--     "
--     " autocmds to automatically enter hex mode and handle file writes properly
--     if has("autocmd")
--     " vim -b : edit binary using xxd-format!
--         augroup MyAutoCmd
--             au BufReadPre *.bin,*.hex,*.pkg,*.img,*.out setlocal binary
--             au BufReadPost *
--                 \ if &binary | Hexmode | endif
--             au BufWritePre *
--                 \ if exists("b:editHex") && b:editHex && &binary |
--                 \  let oldro=&ro | let &ro=0 |
--                 \  let oldma=&ma | let &ma=1 |
--                 \  exe "%!xxd -r" |
--                 \  let &ma=oldma | let &ro=oldro |
--                 \  unlet oldma | unlet oldro |
--                 \ endif
--             au BufWritePost *
--                 \ if exists("b:editHex") && b:editHex && &binary |
--                 \  let oldro=&ro | let &ro=0 |
--                 \  let oldma=&ma | let &ma=1 |
--                 \  exe "%!xxd" |
--                 \  exe "set nomod" |
--                 \  let &ma=oldma | let &ro=oldro |
--                 \  unlet oldma | unlet oldro |
--                 \ endif
--         augroup END
--     endif

--     " ex command for toggling hex mode - define mapping if desired
--     command! -bar Hexmode call ToggleHex()

--     " helper function to toggle hex mode
--     function! ToggleHex()
--         " hex mode should be considered a read-only operation
--         " save values for modified and read-only for restoration later,
--         " and clear the read-only flag for now
--         let l:modified=&mod
--         let l:oldreadonly=&readonly
--         let &readonly=0
--         let l:oldmodifiable=&modifiable
--         let &modifiable=1
--         if !exists("b:editHex") || !b:editHex
--             " save old options
--             let b:oldft=&ft
--             let b:oldbin=&bin
--             " set new options
--             setlocal binary " make sure it overrides any textwidth, etc.
--             let &ft="xxd"
--             " set status
--             let b:editHex=1
--             " switch to hex editor
--             %!xxd
--         else
--             " restore old options
--             let &ft=b:oldft
--             if !b:oldbin
--                 setlocal nobinary
--             endif
--             " set status
--             let b:editHex=0
--             " return to normal editing
--             %!xxd -r
--         endif
--         " restore values for modified and read only state
--         let &mod=l:modified
--         let &readonly=l:oldreadonly
--         let &modifiable=l:oldmodifiable
--     endfunction
