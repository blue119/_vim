-- emulate the behaviour of the Cursor AI IDE

return {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
    opts = {
        -- debug = true,
        -- https://github.com/yetone/avante.nvim/wiki/Custom-providers
        provider = "copilot",
        providers = {
            -- OpenRouter providers (access to multiple models via single API)
            or_gemini_free = {
                __inherited_from = "openai",
                endpoint = "https://openrouter.ai/api/v1",
                api_key_name = "OPENROUTER_API_KEY",
                model = "google/gemini-2.0-flash-exp:free",
            },
            or_gpt_4o = {
                __inherited_from = "openai",
                endpoint = "https://openrouter.ai/api/v1",
                api_key_name = "OPENROUTER_API_KEY",
                model = "openai/gpt-4o-mini",
            },
            or_claude_3_5 = {
                __inherited_from = "openai",
                endpoint = "https://openrouter.ai/api/v1",
                api_key_name = "OPENROUTER_API_KEY",
                model = "anthropic/claude-3-5-sonnet",
            },
            or_llama_3 = {
                __inherited_from = "openai",
                endpoint = "https://openrouter.ai/api/v1",
                api_key_name = "OPENROUTER_API_KEY",
                model = "meta-llama/llama-3-70b-instruct",
            },
            moonshot_or = {
                __inherited_from = "openai",
                endpoint = "https://openrouter.ai/api/v1",
                api_key_name = "OPENROUTER_API_KEY",
                model = "moonshotai/kimi-k2:free",
                disable_tools = true,
            },

            -- Cloud-based providers
            -- OpenAI
            openai = {
                endpoint = "https://api.openai.com/v1",
                model = "gpt-4.1-nano", -- your desired model (or use gpt-4o, etc.)
                timeout = 30000, -- timeout in milliseconds
                extra_request_body = {
                    temperature = 0, -- adjust if needed
                    max_tokens = 4096,
                },
            },
            openai_4o = {
                __inherited_from = "openai",
                model = "gpt-4o",
                extra_request_body = {
                    temperature = 0,
                    max_tokens = 8192,
                },
            },

            -- Anthropic Claude
            claude = {
                endpoint = "https://api.anthropic.com/v1/messages",
                model = "claude-3-5-sonnet-20240620",
                api_key_name = "ANTHROPIC_API_KEY",
                timeout = 60000,
                extra_request_body = {
                    temperature = 0.1,
                    max_tokens = 4096,
                },
            },

            -- Google Gemini
            gemini = {
                model = "gemini-2.5-flash",
            },
            gemini_pro = {
                __inherited_from = "gemini",
                model = "gemini-2.5-pro",
            },

            -- Groq (fast inference)
            groq = {
                __inherited_from = "openai",
                api_key_name = "GROQ_API_KEY",
                endpoint = "https://api.groq.com/openai/v1/",
                model = "llama-3.1-70b-versatile",
                timeout = 30000,
                extra_request_body = {
                    temperature = 0.1,
                    max_tokens = 4096,
                },
            },

            -- Perplexity
            perplexity = {
                __inherited_from = "openai",
                api_key_name = "PERPLEXITY_API_KEY",
                endpoint = "https://api.perplexity.ai",
                model = "llama-3.1-sonar-large-128k-online",
                timeout = 60000,
                extra_request_body = {
                    temperature = 0.1,
                    max_tokens = 4096,
                },
            },

            -- Deepseek (code-focused models)
            deepseek = {
                __inherited_from = "openai",
                api_key_name = "DEEPSEEK_API_KEY",
                endpoint = "https://api.deepseek.com",
                model = "deepseek-coder",
                timeout = 60000,
                extra_request_body = {
                    temperature = 0.1,
                    max_tokens = 8192,
                },
            },

            -- Qwen/Qianwen (Alibaba)
            qianwen = {
                __inherited_from = "openai",
                api_key_name = "DASHSCOPE_API_KEY",
                endpoint = "https://dashscope.aliyuncs.com/compatible-mode/v1",
                model = "qwen-coder-plus-latest",
                timeout = 60000,
            },

            -- Mistral
            mistral = {
                __inherited_from = "openai",
                api_key_name = "MISTRAL_API_KEY",
                endpoint = "https://api.mistral.ai/v1/",
                model = "mistral-large-latest",
                timeout = 30000,
                extra_request_body = {
                    temperature = 0.1,
                    max_tokens = 4096,
                },
            },

            -- Together AI
            together = {
                __inherited_from = "openai",
                api_key_name = "TOGETHER_API_KEY",
                endpoint = "https://api.together.xyz/v1",
                model = "mixtral-8x7b-instruct-v0.1",
                timeout = 60000,
                extra_request_body = {
                    temperature = 0.1,
                    max_tokens = 4096,
                },
            },

            -- Moonshot
            moonshot = {
                endpoint = "https://api.moonshot.ai/v1",
                model = "kimi-k2-0711-preview",
                api_key_name = "MOONSHOT_API_KEY",
                timeout = 30000, -- Timeout in milliseconds
                extra_request_body = {
                    temperature = 0.75,
                    max_tokens = 32768,
                },
            },

            -- Morph
            morph = {
                model = "morph-v3-large",
            },

            -- Local/self-hosted providers
            -- Ollama (local models)
            ollama = {
                endpoint = "http://127.0.0.1:11434", -- Note: no /v1 at the end
                model = "llama3", -- default model, change to your preferred local model
                timeout = 120000, -- longer timeout for local inference
                extra_request_body = {
                    temperature = 0.1,
                    max_tokens = 4096,
                },
            },
            ollama_codellama = {
                __inherited_from = "ollama",
                model = "codellama",
            },
            ollama_mistral = {
                __inherited_from = "ollama",
                model = "mistral",
            },
        },
        behaviour = {
            enable_fastapply = true, -- Enable Fast Apply feature
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
                    format_response_body = function(body) -- Extracts the answer from the Tavily API response
                        return body.answer, nil
                    end,
                },
                -- You can add other search providers here
                brave = {
                    api_key_name = "BRAVE_API_KEY",
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
