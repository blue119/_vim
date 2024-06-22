return {
    "editorconfig/editorconfig-vim",
    ft = "editorconfig",
    config = function()
        vim.cmd([[
                let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
            ]])
    end,
}
