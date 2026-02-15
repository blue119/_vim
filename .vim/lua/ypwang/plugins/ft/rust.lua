return {
    -- {
    --     "rust-lang/rust.vim",
    --     ft = "rust",
    --     dependencies = {
    --         { "mattn/webapi-vim" },
    --     },
    --     config = function()
    --         vim.cmd([[
    --             let g:rustfmt_autosave = 1
    --             let g:rust_clip_command = 'xclip -selection clipboard'
    --         ]])
    --     end,
    -- },
    -- {
    --     "mrcjkb/rustaceanvim", -- Supercharge your Rust experience in Neovim! A heavily modified fork of rust-tools.nvim
    --     version = "^5", -- Recommended
    --     lazy = false, -- This plugin is already lazy
    --     ft = { "rust" },
    --     -- config = function()
    --     --     local mason_registry = require("mason-registry")
    --     --     local ra_binary

    --     --     if mason_registry.is_installed("rust-analyzer") then
    --     --         ra_binary = mason_registry.get_package("rust-analyzer"):get_install_path()
    --     --             .. "/rust-analyzer-x86_64-unknown-linux-gnu"
    --     --     else
    --     --         ra_binary = "rust-analyzer"
    --     --     end

    --     --     print(ra_binary)
    --     --     vim.g.rustaceanvim = {
    --     --         server = {
    --     --             cmd = { ra_binary }, -- You can add args to the list, such as '--log-file'
    --     --         },
    --     --     }
    --     -- end,
    -- },
}
