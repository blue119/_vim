return {
    "dhananjaylatkar/cscope_maps.nvim",
    dependencies = {
        {
            "blue119/cs-mgmt.vim",
            config = function()
                vim.cmd([[
                    let g:CsMgmtCscopeEnable = 1
                    let g:CsMgmtCtagsEnable = 0
                    let g:CsMgmtReAttach = 1
                    let g:CsMgmtDebugEnable = 0
                ]])
            end,
            dependencies = {
                "vim-scripts/Decho",
            },
        },
    },
    config = function()
        require("cscope_maps").setup({})
    end,
}
