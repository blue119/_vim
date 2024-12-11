return {
    { "github/copilot.vim" },
    {
        -- https://github.com/CopilotC-Nvim/CopilotChat.nvim
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "canary",
        dependencies = {
            { "github/copilot.vim" }, -- or github/copilot.vim
            { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
        },
        build = "make tiktoken", -- Only on MacOS or Linux
        opts = {
            debug = true, -- Enable debugging
            -- See Configuration section for rest
        },
        -- See Commands section for default commands if you want to lazy load on them
        -- keys = {
        --     -- Quick chat with Copilot
        --     {
        --         "<leader>ccq",
        --         function()
        --             local input = vim.fn.input("Quick Chat: ")
        --             if input ~= "" then
        --                 require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
        --             end
        --         end,
        --         desc = "CopilotChat - Quick chat",
        --     },
        --     -- Show help actions with telescope
        --     {
        --         "<leader>cch",
        --         function()
        --             local actions = require("CopilotChat.actions")
        --             require("CopilotChat.integrations.telescope").pick(actions.help_actions())
        --         end,
        --         desc = "CopilotChat - Help actions",
        --     },
        --     -- Show prompts actions with telescope
        --     {
        --         "<leader>ccp",
        --         function()
        --             local actions = require("CopilotChat.actions")
        --             require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
        --         end,
        --         desc = "CopilotChat - Prompt actions",
        --     },
        -- },
    },
}
