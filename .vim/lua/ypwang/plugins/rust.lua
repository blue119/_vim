return {
    {
        "rust-lang/rust.vim",
        ft = "rust",
        dependencies = {
            { "mattn/webapi-vim" },
        },
        config = function()
            vim.cmd([[
                let g:rustfmt_autosave = 1
                let g:rust_clip_command = 'xclip -selection clipboard'
            ]])
        end,
    },
    { "Rykka/riv.vim", ft = "rst" },
}
