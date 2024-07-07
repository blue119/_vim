return {
    {
        "rebelot/kanagawa.nvim",
        --         "catppuccin/nvim",
        config = function()
            -- Set highlight for Folded text
            vim.api.nvim_set_hl(0, "Folded", { ctermbg = 237 })

            -- Set colorscheme
            vim.cmd("colorscheme kanagawa")
            --             vim.cmd("colorscheme catppuccin-macchiato")
            --             colorscheme catppuccin " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha

            -- Set color column at column 120
            vim.o.colorcolumn = "120"

            -- Enable cursor line
            vim.o.cursorline = true
            -- vim.cmd("hi CursorLine cterm=bold guibg=background")

            -- Set highlight for color column
            vim.cmd("hi ColorColumn guibg=darkred")

            -- pelling highlights. Use underline in term to prevent cursorline highlights from interfering
            if not vim.fn.has("gui_running") then
                -- Clear existing highlights and set new ones for spell checking
                vim.api.nvim_set_hl(0, "SpellBad", { default = true })
                vim.api.nvim_set_hl(0, "SpellBad", { cterm = "underline", ctermfg = "red" })

                vim.api.nvim_set_hl(0, "SpellCap", { default = true })
                vim.api.nvim_set_hl(0, "SpellCap", { cterm = "underline", ctermfg = "blue" })

                vim.api.nvim_set_hl(0, "SpellLocal", { default = true })
                vim.api.nvim_set_hl(0, "SpellLocal", { cterm = "underline", ctermfg = "blue" })

                vim.api.nvim_set_hl(0, "SpellRare", { default = true })
                vim.api.nvim_set_hl(0, "SpellRare", { cterm = "underline", ctermfg = "blue" })
            end
        end,
    },

    -- lean & mean status/tabline for vim that's light as air
    {
        "bling/vim-airline",
        dependencies = {
            -- A collection of themes for vim-airline
            { "vim-airline/vim-airline-themes" },
        },
        config = function()
            vim.cmd([[
                let g:airline#extensions#branch#enabled=1
                let g:airline#extensions#syntastic#enabled = 1
                let g:airline_detect_paste=1
                let g:airline_theme='molokai'
                let g:airline_powerline_fonts = 1

                if ! has('gui_running')
                    set ttimeoutlen=10
                    augroup MyAutoCmd
                        au InsertEnter * set timeoutlen=0
                        au InsertLeave * set timeoutlen=1000
                    augroup END
                endif

                " powerline symbols
                let g:airline_left_sep = ''
                let g:airline_left_alt_sep = ''
                let g:airline_right_sep = ''
                let g:airline_right_alt_sep = ''
                let g:airline#extensions#branch#symbol = ' '
                let g:airline#extensions#readonly#symbol = ''
                let g:airline_linecolumn_prefix = ' '
                let g:airline#extensions#paste#symbol = 'ρ'
            ]])
        end,
    },
}
