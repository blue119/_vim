-- searches for local vimrc files in the file system tree of the currently opened file.
return {
    "embear/vim-localvimrc",
    config = function()
        vim.cmd([[
                let g:localvimrc_enable = 1
                let g:localvimrc_debug = 0
                let g:localvimrc_name = [ '.lvimrc' ]
            ]])
    end,
}
