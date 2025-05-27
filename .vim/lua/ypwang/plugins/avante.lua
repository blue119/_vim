-- emulate the behaviour of the Cursor AI IDE

return {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
    opts = {
        -- debug = true,
        -- https://github.com/yetone/avante.nvim/wiki/Custom-providershttps://github.com/yetone/avante.nvim/wiki/Custom-providers
        -- provider = "openai",
        -- provider = "gemini_free",
        provider = "openrouter",
        vendors = {
            -- copilot = {
            --     model = "claude-3.7-sonnet",
            --     endpoint = "https://api.githubcopilot.com",
            --     allow_insecure = false,
            --     timeout = 10 * 60 * 1000,
            --     temperature = 0,
            --     max_completion_tokens = 10000,
            --     reasoning_effort = "high",
            -- },
            gemini_free = {
                __inherited_from = "openai",
                endpoint = "https://openrouter.ai/api/v1",
                api_key_name = "OPENROUTER_API_KEY",
                model = "google/gemini-2.0-flash-exp:free",
            },
            openrouter = {
                __inherited_from = "openai",
                endpoint = "https://openrouter.ai/api/v1",
                api_key_name = "OPENROUTER_API_KEY",
                model = "openai/gpt-4o-mini",
            },
            openai = {
                endpoint = "https://api.openai.com/v1",
                model = "gpt-4o-mini", -- your desired model (or use gpt-4o, etc.)
                timeout = 30000, -- timeout in milliseconds
                temperature = 0, -- adjust if needed
                max_tokens = 4096,
            },
        },
        rag_service = {
            enabled = false, -- Enables the RAG service
            -- host_mount = os.getenv("HOME"), -- Host mount path for the rag service
            host_mount = "/home/blue119/iData/Sync/hyread_done", -- Host mount path for the rag service
            provider = "openai", -- The provider to use for RAG service (e.g. openai or ollama)
            llm_model = "4o-mini", -- The LLM model to use for RAG service
            embed_model = "text-embedding-ada-002", -- The embedding model to use for RAG service
        },
        web_search_engine = {
            provider = "tavily",
            proxy = nil,
            providers = {
                tavily = {
                    api_key_name = "TAVILY_API_KEY",
                    extra_request_body = {
                        include_answer = "basic",
                    },
                    ---@type WebSearchEngineProviderResponseBodyFormatter
                    format_response_body = function(body)
                        return body.answer, nil
                    end,
                },
            },
        },
        system_prompt = function()
            local hub = require("mcphub").get_hub_instance()
            return hub:get_active_servers_prompt()
        end,
        -- The custom_tools type supports both a list and a function that returns a list. Using a function here prevents requiring mcphub before it's loaded
        custom_tools = function()
            return {
                require("mcphub.extensions.avante").mcp_tool(),
            }
        end,
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        --- The below dependencies are optional,
        "echasnovski/mini.pick", -- for file_selector provider mini.pick
        "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
        "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
        "ibhagwan/fzf-lua", -- for file_selector provider fzf
        "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
        "ravitemer/mcphub.nvim", -- for mcphub
        "zbirenbaum/copilot.lua", -- for providers='copilot'
        {
            -- support for image pasting
            "HakonHarnes/img-clip.nvim",
            event = "VeryLazy",
            opts = {
                -- recommended settings
                default = {
                    embed_image_as_base64 = false,
                    prompt_for_file_name = false,
                    drag_and_drop = {
                        insert_mode = true,
                    },
                    -- required for Windows users
                    use_absolute_path = true,
                },
            },
        },
        {
            -- Make sure to set this up properly if you have lazy=true
            "MeanderingProgrammer/render-markdown.nvim",
            opts = {
                file_types = { "markdown", "Avante" },
            },
            ft = { "markdown", "Avante" },
        },
    },
}
