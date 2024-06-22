return {
    "blue119/EnhCommentify.vim",
    config = function()
        vim.cmd([[
                let g:EnhCommentifyRespectIndent = 'Yes'
                let g:EnhCommentifyPretty = 'Yes'
                let g:EnhCommentifyMultiPartBlocks = 'Yes'
                let g:EnhCommentifyAlignRight = 'Yes'
            ]])
    end,
}
