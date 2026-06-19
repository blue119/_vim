return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        -- In the new nvim-treesitter, highlighting/indent/etc. are handled
        -- natively by Neovim (vim.treesitter). The plugin only manages parser
        -- installation. Use :TSInstall to install parsers on demand.
        local languages = {
            "c",
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
        })

        -- Disable treesitter highlighting for large files
        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                local max_filesize = 100 * 1024 -- 100 KB
                local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(args.buf))
                if ok and stats and stats.size > max_filesize then
                    vim.treesitter.stop(args.buf)
                end
            end,
        })
    end,
}
