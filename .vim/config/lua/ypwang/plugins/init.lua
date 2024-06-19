require("lazy").setup({
    -- UI
    --------------------------------------------------------------------------
    --
    --    { "rebelot/kanagawa.nvim" },
    require("ypwang.plugins.ui"),

    -- Gears
    --------------------------------------------------------------------------
    require("ypwang.plugins.git"),

    -- to highlight several words in different colors simultaneously
    { "mbriggs/mark.vim" },

    -- Run commands quickly
    { "thinca/vim-quickrun" },

    -- comment lines in a program
    { "blue119/EnhCommentify.vim" },

    -- searches for local vimrc files in the file system tree of the currently opened file.
    { "embear/vim-localvimrc" },

    -- VIM as IDE
    --------------------------------------------------------------------------
    --    require("ypwang.plugins.ddu"),

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
    require("ypwang.plugins.cscope"),

    require("ypwang.plugins.nvim-tree"),

    require("ypwang.plugins.nvim-treesitter"),

    require("ypwang.plugins.which-key"),

    -- Fuzzy Finder (files, lsp, etc)
    require("ypwang.plugins.telescope"),

    -- " LSP for vim
    require("ypwang.plugins.lsp"),
    --    require("ypwang.plugins.lsp_vim"),

    -- Check syntax in Vim asynchronously and fix files, with Language Server Protocol (LSP) support
    --    { "dense-analysis/ale" },

    -- Lightweight yet powerful formatter plugin for Neovim
    require("ypwang.plugins.conform"),

    -- About the completetion ------------------------------------------------
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
