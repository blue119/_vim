return {
    "fatih/vim-go",
    ft = "go",
    build = ":GoUpdateBinaries",
    -- dependencies = {
    -- { 'jstemmer/gotags' },
    -- },
    config = function()
        vim.cmd([[
                let g:go_def_mode = "guru"
                let g:go_autodetect_gopath = 1
                set completeopt+=noselect
            ]])
    end,
}
