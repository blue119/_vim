-- return {}
return {
    "mfussenegger/nvim-lint",
    event = {
        "BufReadPre",
        "BufNewFile",
    },
    config = function()
        local lint = require("lint")

        -- vim.g.nvim_lint_debug = true
        vim.diagnostic.config({
            severity_sort = true,
            virtual_text = {
                severity = { min = vim.diagnostic.severity.WARN },
            },
        })
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
                lint.try_lint()
            end
        end
        vim.keymap.set({ "n" }, "<leader>l", toggle_lint, { noremap = true, desc = "Lint" })

        -- Set pylint to work in virtualenv
        lint.linters.pylint.cmd = "python"
        lint.linters.pylint.args = { "-m", "pylint", "-f", "json" }

        lint.linters.golangcilint.args = {
            "run",
            "--output.json.path=stdout",
            "--issues-exit-code=0",
            "--show-stats=false",
            "--output.text.print-issued-lines=false",
            "--output.text.print-linter-name=false",
            function()
                return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":h")
            end,
        }

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
