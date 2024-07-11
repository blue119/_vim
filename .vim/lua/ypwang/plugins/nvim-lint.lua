return {
    "mfussenegger/nvim-lint",
    event = {
        "BufReadPre",
        "BufNewFile",
    },
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            --             javascript = { "eslint_d" },
            --             typescript = { "eslint_d" },
            --             javascriptreact = { "eslint_d" },
            --             typescriptreact = { "eslint_d" },
            --             svelte = { "eslint_d" },
            python = { "pylint" },
            go = { "golangcilint" },
        }

        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = lint_augroup,
            callback = function()
                lint.try_lint()
            end,
        })

        local lint_on = true
        local toggle_lint = function()
            if lint_on == true then
                lint_on = false
                vim.diagnostic.reset(nil, 0)
            else
                lint_on = true
                require("lint").try_lint()
            end
        end
        vim.keymap.set({ "n" }, "<leader>l", toggle_lint, { noremap = true, desc = "Lint" })

        -- Set pylint to work in virtualenv
        require("lint").linters.pylint.cmd = "python"
        require("lint").linters.pylint.args = { "-m", "pylint", "-f", "json" }

        vim.api.nvim_create_user_command("ActiveLinters", function()
            local ft = vim.bo.filetype
            local active_linters = lint.linters_by_ft[ft] or {}

            if #active_linters == 0 then
                print("No active linters for filetype: " .. ft)
            else
                print("Active linters for " .. ft .. ":")
                for _, linter in ipairs(active_linters) do
                    print("- " .. linter)
                end
            end
        end, {})
    end,
}
