return {
    { "rebelot/kanagawa.nvim" },

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
