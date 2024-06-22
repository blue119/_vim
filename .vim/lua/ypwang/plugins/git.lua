return {
    -- A Git wrapper so awesome, it should be illegal
    {
        "tpope/vim-fugitive",
        dependencies = {
            { "tpope/vim-rhubarb" },
        },
        config = function()
            vim.cmd([[
                autocmd FileType git :setlocal foldlevel=99
                let g:Gitv_TruncateCommitSubjects = 1
                let g:Gitv_DoNotMapCtrlKey = 0
            ]])
        end,
    },

    -- A Vim plugin which shows git diff markers in the sign column and stages/previews/undoes hunks and partial hunks.
    { "airblade/vim-gitgutter" },
}
