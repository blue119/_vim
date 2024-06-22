-- " Use 256 colours (Use this setting only if your terminal supports 256 colours)
-- " set t_Co=256

-- Set highlight for Folded text
vim.api.nvim_set_hl(0, "Folded", { ctermbg = 237 })

-- Set colorscheme
vim.cmd("colorscheme kanagawa")

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
