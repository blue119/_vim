return {
    "stevearc/conform.nvim", -- Lightweight yet powerful formatter plugin for Neovim
    event = "BufWritePre",
    cmd = "ConformInfo",
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format({ async = true, lsp_format = "fallback" })
            end,
            mode = "",
            desc = "[F]ormat buffer",
        },
    },
    opts = {
        -- Conform will notify you when a formatter errors
        notify_on_error = true,

        format_on_save = function(bufnr)
            -- Keep saves responsive; use <leader>f for slower, asynchronous formatting.
            -- Preserve the existing exclusions for LSP fallback formatting.
            local disable_filetypes = { proto = true, c = true, cpp = true }
            local filetype = vim.bo[bufnr].filetype
            return {
                timeout_ms = 1000,
                lsp_format = disable_filetypes[filetype] and "never" or "fallback",
            }
        end,

        formatters_by_ft = {
            lua = { "stylua" },
            cpp = { "clang_format" },
            c = { "clang_format" },
            json = { "jq" },
            -- Conform can also run multiple formatters sequentially
            python = { "ruff_organize_imports", "ruff_format" },
            -- You can use a sub-list to tell conform to run *until* a formatter
            -- is found.
            javascript = { "prettier" },
            rust = { "rustfmt" },
            -- Use the "*" filetype to run formatters on all filetypes.
            -- ["*"] = { "codespell" },
            -- Use the "_" filetype to run formatters on filetypes that don't
            -- have other formatters configured.
            ["_"] = { "trim_whitespace" },
        },
        formatters = {
            stylua = {
                prepend_args = { "--indent-type", "Spaces" },
            },
            --             black = {
            --                 prepend_args = { "--fast" },
            --             },
        },
        log_level = vim.log.levels.ERROR,
    },
    --    config = function() end,
}
