return {
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
}
