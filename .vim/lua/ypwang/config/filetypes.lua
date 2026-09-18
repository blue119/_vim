local group = vim.api.nvim_create_augroup("ypwang-filetypes", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = "help",
    callback = function(event)
        vim.keymap.set("n", "q", "<cmd>quit<CR>", { buffer = event.buf })
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = "python",
    callback = function(event)
        vim.api.nvim_buf_create_user_command(event.buf, "Man", function(args)
            vim.cmd("!pydoc " .. vim.fn.shellescape(args.args))
        end, { nargs = 1 })
        vim.keymap.set("n", "K", ":!pydoc <cword><CR>", { buffer = event.buf })
        vim.keymap.set({ "n", "x", "o" }, "<F2>", ":% w !python<CR>", { buffer = event.buf })

        vim.cmd([[
            setlocal tabstop=4 shiftwidth=4
            setlocal foldmethod=indent foldcolumn=4 foldlevel=3 foldnestmax=3
            iabbrev <buffer> iii import IPython; IPython.embed()
            iabbrev <buffer> ddd import ipdb; ipdb.set_trace()
        ]])
        vim.g.syntastic_python_checkers = 0
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = { "hs", "haskell" },
    callback = function()
        vim.cmd([[
            setlocal tabstop=8 expandtab softtabstop=4 shiftwidth=4 shiftround
        ]])
        vim.g.ghc = "ghc"
        vim.g.haddock_browser = "firefox"
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = { "c", "cpp" },
    callback = function(event)
        vim.cmd([[
            setlocal equalprg=indent expandtab
            runtime! ftplugin/man.vim
        ]])
        vim.keymap.set("n", "K", ":Man <c-r><c-w><CR>", { buffer = event.buf, remap = true })
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = "beancount",
    callback = function()
        vim.cmd([[
            setlocal tabstop=4 shiftwidth=4
            setlocal foldmethod=indent foldcolumn=4 foldlevel=3 foldnestmax=3
            iabbrev <buffer> tt <c-r>=strftime("%F")<cr>
        ]])
    end,
})
