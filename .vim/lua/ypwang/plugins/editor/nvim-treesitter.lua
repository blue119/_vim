return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master", -- This config uses the legacy configs.setup API.
    lazy = false,
    build = ":TSUpdate",
    config = function()
        -- Register directives used by this version's bundled queries, even if
        -- another start package already set g:loaded_nvim_treesitter.
        require("nvim-treesitter.query_predicates")

        local languages = {
            "c",
            "cpp",
            "go",
            "rust",
            "lua",
            "vim",
            "vimdoc",
            "query",
            "bash",
            "html",
            "javascript",
            "json",
            "markdown",
            "markdown_inline",
            "python",
            "regex",
            "tsx",
            "typescript",
            "yaml",
        }

        require("nvim-treesitter.configs").setup({
            ensure_installed = languages,
            auto_install = true,
            highlight = {
                enable = true,
                disable = function(_, buffer)
                    local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buffer))
                    return ok and stats ~= nil and stats.size > 100 * 1024
                end,
            },
        })
    end,
}
