return {
    "stevearc/conform.nvim", -- Lightweight yet powerful formatter plugin for Neovim
    lazy = false,
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format({ async = true, lsp_fallback = true })
            end,
            mode = "",
            desc = "[F]ormat buffer",
        },
    },
    opts = {
        -- Conform will notify you when a formatter errors
        notify_on_error = false,

        format_on_save = function(bufnr)
            -- Disable "format_on_save lsp_fallback" for languages that don't
            -- have a well standardized coding style. You can add additional
            -- languages here or re-enable it for the disabled ones.
            local disable_filetypes = { proto = true, c = true, cpp = true }
            local filetype = vim.bo[bufnr].filetype
            return {
                timeout_ms = filetype == "python" and 15000 or 5000,
                lsp_fallback = not disable_filetypes[filetype],
                -- lsp_fallback = true,
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
        log_level = vim.log.levels.DEBUG,
    },
    --    config = function() end,
}
