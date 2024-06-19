-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- UI
    --------------------------------------------------------------------------
    --
    { "rebelot/kanagawa.nvim" },

    -- lean & mean status/tabline for vim that's light as air
    {
        "bling/vim-airline",
        dependencies = {
            -- A collection of themes for vim-airline
            { "vim-airline/vim-airline-themes" },
        },
    },

    -- Gears
    --------------------------------------------------------------------------
    -- to highlight several words in different colors simultaneously
    { "mbriggs/mark.vim" },

    -- Run commands quickly
    { "thinca/vim-quickrun" },

    -- comment lines in a program
    { "blue119/EnhCommentify.vim" },

    -- A Git wrapper so awesome, it should be illegal
    { "tpope/vim-fugitive", dependencies = {
        { "tpope/vim-rhubarb" },
    } },

    -- A Vim plugin which shows git diff markers in the sign column and stages/previews/undoes hunks and partial hunks.
    { "airblade/vim-gitgutter" },

    -- searches for local vimrc files in the file system tree of the currently opened file.
    { "embear/vim-localvimrc" },

    -- VIM as IDE
    --------------------------------------------------------------------------
    -- deno
    -- An ecosystem for Vim/Neovim enabling developers to write plugins in Deno.
    --
    --{
    --    "vim-denops/denops.vim",
    --    dependencies = {
    --        { "vim-denops/denops-shared-server.vim", build = ":call denops_shared_server#install()" },
    --        { "vim-denops/denops-helloworld.vim" },
    --    },
    --},

    -- Dark Power Series
    --{
    --    -- https://zenn.dev/vim_jp/articles/20231020step-by-step-ddu
    --    "Shougo/ddu.vim",
    --    dependencies = {
    --        "vim-denops/denops.vim",
    --        -- source : Generate an Item list.
    --        -- file_recursiveの略です。
    --        "Shougo/ddu-source-file_rec",
    --        "4513ECHO/ddu-source-colorscheme",
    --        -- filter : Receive input from users and process UI
    --        "Shougo/ddu-filter-matcher_substring",
    --        "uga-rosa/ddu-filter-converter_devicon",
    --        -- kind : Define the action to be performed on the Item.
    --        "Shougo/ddu-kind-file",
    --        -- UI : Display the Item list.
    --        -- fuzzy_finder(あいまい検索)
    --        "Shougo/ddu-ui-ff",
    --    },
    --    config = function()
    --        vim.fn["ddu#custom#patch_global"]({
    --            ui = "ff",
    --            -- floating window
    --            --                uiParams = {
    --            --                    ff = {
    --            --                        filterFloatingPosition = "bottom",
    --            --                        filterSplitDirection = "floating",
    --            --                        floatingBorder = "rounded",
    --            --                        previewFloating = true,
    --            --                        previewFloatingBorder = "rounded",
    --            --                        previewFloatingTitle = "Preview",
    --            --                        previewSplit = "horizontal",
    --            --                        prompt = "> ",
    --            --                        split = "floating",
    --            --                        startFilter = true,
    --            --                    },
    --            --                },
    --            sourceOptions = {
    --                _ = {
    --                    matchers = {
    --                        "matcher_substring",
    --                    },
    --                    ignoreCase = true,
    --                },
    --            },
    --        })

    --        -- :call ddu#start(#{name:"file_recursive"})
    --        vim.fn["ddu#custom#patch_local"]("file_recursive", {
    --            sources = {
    --                {
    --                    name = { "file_rec" },
    --                    options = {
    --                        converters = {
    --                            "converter_devicon",
    --                        },
    --                    },
    --                    params = {
    --                        ignoredDirectories = { "node_modules", ".git", ".vscode" },
    --                    },
    --                },
    --            },

    --            kindOptions = {
    --                file = {
    --                    defaultAction = "open",
    --                },
    --            },
    --        })

    --        -- :call ddu#start(#{name:"colorscheme"})
    --        vim.fn["ddu#custom#patch_local"]("colorscheme", {
    --            sources = {
    --                {
    --                    name = { "colorscheme" },
    --                },
    --            },
    --            kindOptions = {
    --                colorscheme = {
    --                    defaultAction = "set",
    --                },
    --            },
    --        })

    --        vim.api.nvim_create_autocmd("FileType", {
    --            pattern = "ddu-ff",
    --            callback = function()
    --                local opts = { noremap = true, silent = true, buffer = true }
    --                vim.keymap.set({ "n" }, "q", [[<Cmd>call ddu#ui#do_action('quit')<CR>]], opts)
    --                vim.keymap.set({ "n" }, "<CR>", [[<Cmd>call ddu#ui#do_action('itemAction')<CR>]], opts)
    --                vim.keymap.set({ "n" }, "i", [[<Cmd>call ddu#ui#do_action('openFilterWindow')<CR>]], opts)
    --                vim.keymap.set({ "n" }, "P", [[<Cmd>call ddu#ui#do_action("togglePreview")<CR>]], opts)
    --            end,
    --        })

    --        vim.api.nvim_create_autocmd("FileType", {
    --            pattern = "ddu-ff-filter",
    --            callback = function()
    --                local opts = { noremap = true, silent = true, buffer = true }
    --                vim.keymap.set({ "n", "i" }, "<CR>", [[<Esc><Cmd>close<CR>]], opts)
    --            end,
    --        })
    --    end,
    --},

    -- Multiple Plug commands can be written in a single line using | separators
    {
        "SirVer/ultisnips",
        dependencies = {
            { "honza/vim-snippets" },
            -- Perform all your vim insert mode completions with Tab
            { "ervandew/supertab" },
        },
    },

    -- basic cscope settings and key mappings
    {
        "dhananjaylatkar/cscope_maps.nvim",
        dependencies = {
            { "blue119/cs-mgmt.vim" },
        },
        config = function()
            require("cscope_maps").setup({})
        end,
    },

    -- A file explorer tree for neovim written in lua
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
        },
        config = function()
            require("nvim-tree").setup({
                sort = {
                    sorter = "case_sensitive",
                },
                view = {
                    width = 30,
                },
                renderer = {
                    group_empty = true,
                },
                filters = {
                    dotfiles = true,
                },
            })
        end,
    },
    --
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            -- A list of parser names, or "all" (the five listed parsers should always be installed)
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,

            -- List of parsers to ignore installing (or "all")
            ignore_install = { "javascript" },

            ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
            -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

            highlight = {
                enable = true,

                -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
                -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
                -- the name of the parser)
                -- list of language that will be disabled
                disable = { "c", "rust" },
                -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
                disable = function(lang, buf)
                    local max_filesize = 100 * 1024 -- 100 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,

                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
            },
        },
        config = function(_, opts)
            require("nvim-treesitter.install").prefer_git = true
            require("nvim-treesitter.configs").setup(opts)
        end,
    },

    -- " LSP for vim
    {
        "prabirshrestha/vim-lsp",
        dependencies = {
            { "mattn/vim-lsp-settings" },
            { "folke/lsp-colors.nvim" },
        },
    },

    -- Check syntax in Vim asynchronously and fix files, with Language Server Protocol (LSP) support
    { "dense-analysis/ale" },

    -- Lightweight yet powerful formatter plugin for Neovim
    {
        "stevearc/conform.nvim",
        opts = {
            notify_on_error = false,

            format_on_save = function(bufnr)
                -- Disable "format_on_save lsp_fallback" for languages that don't
                -- have a well standardized coding style. You can add additional
                -- languages here or re-enable it for the disabled ones.
                local disable_filetypes = { c = true, cpp = true }
                return {
                    timeout_ms = 500,
                    lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
                }
            end,

            formatters_by_ft = {
                lua = { "stylua" },
                -- Conform can also run multiple formatters sequentially
                python = { "isort", "black" },
                -- You can use a sub-list to tell conform to run *until* a formatter
                -- is found.
                -- javascript = { { "prettierd", "prettier" } },
            },
        },
        config = function() end,
    },

    -- About the completetion ------------------------------------------------
    -- Dark powered asynchronous completion framework for neovim/Vim8
    {
        "Shougo/deoplete.nvim",
        build = ":UpdateRemotePlugins",
        dependencies = {
            -- deoplete for C/C++/Obj-C/Obj-C++
            { "zchee/deoplete-clang" },
            -- deoplete for python
            { "zchee/deoplete-jedi" },
            -- deoplete for golang
            { "zchee/deoplete-go", build = "make" },
            -- Lua file type plug-in for the Vim text editor
            {
                "xolox/vim-lua-ftplugin",
                -- Miscellaneous auto-load Vim scripts
                dependencies = { "xolox/vim-misc" },
            },
        },
    },

    -- Dark powered asynchronous unite all interfaces for Neovim/Vim8
    {
        "Shougo/denite.nvim",
        -- MRU plugin includes unite.vim/denite.nvim MRU sources
        dependencies = {
            { "Shougo/neomru.vim" },
        },
    },

    -- async completion in pure vim script for vim8 and neovim
    {
        "prabirshrestha/asyncomplete.vim",
        dependencies = {
            { "prabirshrestha/asyncomplete-lsp.vim" },
            { "keremc/asyncomplete-racer.vim" },
            { "prabirshrestha/async.vim" },
            { "keremc/asyncomplete-clang.vim" },
            { "andreypopp/asyncomplete-ale.vim" },
        },
    },

    -- Github copilot
    { "github/copilot.vim" },

    -- Filetype
    -- -----------------------------------------------------------------------
    -- c
    -- { 'rhysd/vim-clang-format' },
    -- python The Uncompromising Code Formatter
    -- { 'ambv/black' },
    -- golang
    {
        "fatih/vim-go",
        ft = "go",
        build = ":GoUpdateBinaries",
        -- dependencies = {
        -- { 'jstemmer/gotags' },
        -- },
    },
    -- rust
    { "rust-lang/rust.vim", ft = "rust", dependencies = {
        { "mattn/webapi-vim" },
    } },
    -- beancount
    { "nathangrigg/vim-beancount", ft = "beancount" },
    --  cli-ledge
    { "ledger/vim-ledger", ft = "ledger" },
    -- editconfig
    { "editorconfig/editorconfig-vim", ft = "editorconfig" },
    -- rst
    { "Rykka/riv.vim", ft = "rst" },

    -- MISC
    -- -----------------------------------------------------------------------
}, {
    ui = {
        -- If you are using a Nerd Font: set icons to an empty table which will use the
        -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
        icons = vim.g.have_nerd_font and {} or {
            cmd = "⌘",
            config = "🛠",
            event = "📅",
            ft = "📂",
            init = "⚙",
            keys = "🗝",
            plugin = "🔌",
            runtime = "💻",
            require = "🌙",
            source = "📄",
            start = "🚀",
            task = "📌",
            lazy = "💤 ",
        },
    },
})
