require("lazy").setup({
    -- UI
    --------------------------------------------------------------------------
    --
    --    { "rebelot/kanagawa.nvim" },
    require("ypwang.plugins.ui"),

    -- Gears
    --------------------------------------------------------------------------
    require("ypwang.plugins.git"),
    require("ypwang.plugins.mark"),
    require("ypwang.plugins.vim-quickrun"),
    require("ypwang.plugins.enh-commentify"),
    require("ypwang.plugins.vim-localvimrc"),

    -- basic cscope settings and key mappings
    require("ypwang.plugins.cscope"),
    require("ypwang.plugins.nvim-tree"),
    require("ypwang.plugins.nvim-treesitter"),
    require("ypwang.plugins.which-key"),

    -- Fuzzy Finder (files, lsp, etc)
    require("ypwang.plugins.telescope"),

    -- " LSP for vim
    require("ypwang.plugins.lsp"),
    require("ypwang.plugins.nvim-cmp"),
    --    require("ypwang.plugins.lsp_vim"),

    -- Check syntax in Vim asynchronously and fix files, with Language Server Protocol (LSP) support
    --    { "dense-analysis/ale" },

    -- Lightweight yet powerful formatter plugin for Neovim
    require("ypwang.plugins.conform"),

    -- About the completion ------------------------------------------------
    -- Dark powered asynchronous completion framework for neovim/Vim8
    --    require("ypwang.plugins.deoplete"),

    -- Dark powered asynchronous unite all interfaces for Neovim/Vim8
    --    require("ypwang.plugins.denite"),

    -- async completion in pure vim script for vim8 and neovim
    --    {
    --        "prabirshrestha/asyncomplete.vim",
    --        dependencies = {
    --            { "prabirshrestha/asyncomplete-lsp.vim" },
    --            { "keremc/asyncomplete-racer.vim" },
    --            { "prabirshrestha/async.vim" },
    --            { "keremc/asyncomplete-clang.vim" },
    --            { "andreypopp/asyncomplete-ale.vim" },
    --        },
    --    },

    -- Github copilot
    require("ypwang.plugins.copilot"),

    -- Filetype
    -- -----------------------------------------------------------------------
    -- c
    -- { 'rhysd/vim-clang-format' },
    -- python The Uncompromising Code Formatter
    -- { 'ambv/black' },
    -- golang
    require("ypwang.plugins.vim-go"),
    -- rust
    require("ypwang.plugins.rust"),
    -- beancount
    require("ypwang.plugins.vim-beancount"),
    --  cli-ledge
    require("ypwang.plugins.vim-ledger"),
    -- editconfig
    require("ypwang.plugins.editorconfig-vim"),

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
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "netrwPlugin",
                "netrw",
                "tarPlugin",
                "tar",
                "matchit",
                "tohtml",
                "tutor",
                "zipPlugin",
                "zip",
            },
        },
    },
})
