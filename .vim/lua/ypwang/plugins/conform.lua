return {
    "stevearc/conform.nvim",
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
            local disable_filetypes = { proto = true }
            return {
                timeout_ms = 500,
                --                 lsp_fallback = true,
                lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
            }
        end,

        formatters_by_ft = {
            lua = { "stylua" },
            cpp = { "clang_format" },
            c = { "clang_format" },
            -- Conform can also run multiple formatters sequentially
            python = { "isort", "black" },
            -- You can use a sub-list to tell conform to run *until* a formatter
            -- is found.
            -- javascript = { { "prettierd", "prettier" } },
            -- Use the "*" filetype to run formatters on all filetypes.
            ["*"] = { "codespell" },
            -- Use the "_" filetype to run formatters on filetypes that don't
            -- have other formatters configured.
            ["_"] = { "trim_whitespace" },
        },
        formatters = {
            stylua = {
                prepend_args = { "--indent-type", "Spaces" },
            },
        },
    },
    --    config = function() end,
}
