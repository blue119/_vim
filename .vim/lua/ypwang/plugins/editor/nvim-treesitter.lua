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

        -- Auto-install missing parsers
        local installed = require("nvim-treesitter.config").get_installed()
        local to_install = vim.tbl_filter(function(lang)
            return not vim.list_contains(installed, lang)
        end, languages)
        if #to_install > 0 then
            vim.cmd("TSInstall " .. table.concat(to_install, " "))
        end

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
