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

        local lint_on = true
        local function run_lint(buffer)
            if not lint_on or not vim.api.nvim_buf_is_valid(buffer) then
                return
            end
            if vim.bo[buffer].buftype ~= "" or vim.api.nvim_buf_get_name(buffer) == "" then
                return
            end
            local linters = lint.linters_by_ft[vim.bo[buffer].filetype]
            if linters and #linters > 0 then
                vim.api.nvim_buf_call(buffer, function()
                    lint.try_lint(linters)
                end)
            end
        end

        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
        vim.api.nvim_create_autocmd("BufWritePost", {
            group = lint_augroup,
            desc = "Run external linters after saving",
            callback = function(event)
                run_lint(event.buf)
            end,
        })

        vim.api.nvim_create_user_command("Lint", function()
            if lint_on then
                run_lint(vim.api.nvim_get_current_buf())
            else
                vim.notify("Linting is off; use <leader>l to enable it", vim.log.levels.INFO)
            end
        end, { desc = "Lint the current buffer" })

        vim.keymap.set("n", "<leader>l", function()
            lint_on = not lint_on
            for _, linters in pairs(lint.linters_by_ft) do
                for _, name in ipairs(linters) do
                    local namespace = lint.get_namespace(name)
                    -- Namespace disabling also hides results from in-flight jobs.
                    vim.diagnostic.enable(lint_on, { ns_id = namespace })
                    vim.diagnostic.reset(namespace)
                end
            end
            vim.notify(lint_on and "Linting enabled" or "Linting disabled", vim.log.levels.INFO)
            if lint_on then
                run_lint(vim.api.nvim_get_current_buf())
            end
        end, { desc = "Toggle external linting" })

        -- Set pylint to work in virtualenv
        lint.linters.pylint.cmd = "python"
        lint.linters.pylint.args = vim.list_extend({ "-m", "pylint" }, lint.linters.pylint.args)

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
