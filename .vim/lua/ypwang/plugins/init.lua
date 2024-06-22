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
    {
        "mbriggs/mark.vim",
        config = function()
            vim.cmd([[
                function! s:DefaultHighlightings()
                    highlight def MarkWord1  ctermbg=9   ctermfg=Black  guibg=#8CCBEA   guifg=Black
                    highlight def MarkWord2  ctermbg=10  ctermfg=Black  guibg=#A4E57E   guifg=Black
                    highlight def MarkWord3  ctermbg=11  ctermfg=Black  guibg=#FFDB72   guifg=Black
                    highlight def MarkWord4  ctermbg=12  ctermfg=Black  guibg=#FF7272   guifg=Black
                    highlight def MarkWord5  ctermbg=13  ctermfg=Black  guibg=#FFB3FF   guifg=Black
                    highlight def MarkWord6  ctermbg=14  ctermfg=Black  guibg=#9999FF   guifg=Black
                    highlight def MarkWord7  ctermbg=15  ctermfg=Black  guibg=#9999FF   guifg=Black
                    highlight def MarkWord8  ctermbg=178 ctermfg=Black  guibg=#9999FF   guifg=Black
                    highlight def MarkWord9  ctermbg=105 ctermfg=Black  guibg=#9999FF   guifg=Black
                    highlight def MarkWord10 ctermbg=50  ctermfg=Black  guibg=#9999FF   guifg=Black
                endfunction
                call s:DefaultHighlightings()
                autocmd ColorScheme * call <SID>DefaultHighlightings()
            ]])
        end,
    },

    -- Run commands quickly
    { "thinca/vim-quickrun" },

    --     comment lines in a program
    {
        "blue119/EnhCommentify.vim",
        config = function()
            vim.cmd([[
                let g:EnhCommentifyRespectIndent = 'Yes'
                let g:EnhCommentifyPretty = 'Yes'
                let g:EnhCommentifyMultiPartBlocks = 'Yes'
                let g:EnhCommentifyAlignRight = 'Yes'
            ]])
        end,
    },

    -- searches for local vimrc files in the file system tree of the currently opened file.
    {
        "embear/vim-localvimrc",
        config = function()
            vim.cmd([[
                let g:localvimrc_enable = 1
                let g:localvimrc_debug = 0
                let g:localvimrc_name = [ '.lvimrc' ]
            ]])
        end,
    },

    -- VIM as IDE
    --------------------------------------------------------------------------
    --    require("ypwang.plugins.ddu"),

    -- Multiple Plug commands can be written in a single line using | separators
    -- {
    --     "SirVer/ultisnips",
    --     dependencies = {
    --         { "honza/vim-snippets" },
    --         -- Perform all your vim insert mode completions with Tab
    --         { "ervandew/supertab" },
    --     },
    --     config = function()
    --         vim.cmd([[
    --             let g:UltiSnipsExpandTrigger="<tab>"
    --             let g:UltiSnipsJumpForwardTrigger="<tab>"
    --             let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
    --         ]])
    --     end,
    -- },

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
        config = function()
            vim.cmd([[
                let g:go_def_mode = "guru"
                let g:go_autodetect_gopath = 1
                set completeopt+=noselect
            ]])
        end,
    },
    -- rust
    {
        "rust-lang/rust.vim",
        ft = "rust",
        dependencies = {
            { "mattn/webapi-vim" },
        },
        config = function()
            vim.cmd([[
                let g:rustfmt_autosave = 1
                let g:rust_clip_command = 'xclip -selection clipboard'
            ]])
        end,
    },
    -- beancount
    { "nathangrigg/vim-beancount", ft = "beancount" },
    --  cli-ledge
    { "ledger/vim-ledger", ft = "ledger" },
    -- editconfig
    {
        "editorconfig/editorconfig-vim",
        ft = "editorconfig",
        config = function()
            vim.cmd([[
                let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
            ]])
        end,
    },
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
