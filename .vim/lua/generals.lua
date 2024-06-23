vim.opt.secure = true
vim.opt.showmode = false
vim.opt.clipboard = "unnamedplus"

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300
vim.opt.termguicolors = true

-- Searching options
vim.opt.hlsearch = true -- Enable search highlight globally
vim.opt.showmatch = true -- Show matching brackets when typing
vim.opt.incsearch = true -- Do incremental searching
vim.opt.ignorecase = true -- Ignore case
vim.opt.smartcase = true -- But don't ignore it, when search string contains uppercase letters
vim.opt.showcmd = true -- Display incomplete commands
vim.opt.magic = true -- Make regex a little easier to type

-- Text display settings
vim.opt.autoindent = true -- Auto Indent
vim.opt.smartindent = true -- Smart Indent
vim.opt.cindent = true -- C-style Indent
vim.opt.wrap = false
-- set whichwrap+=h,l,<,>,[,]
vim.opt.textwidth = 119 -- Set text width
-- set linebreak
--
-- Tab settings
vim.opt.smarttab = true -- Smart handling of the tab key
vim.opt.expandtab = true -- Use spaces for tabs
vim.opt.shiftround = true -- Round indent to multiple of shiftwidth
vim.opt.shiftwidth = 4 -- Number of spaces for each indent
vim.opt.tabstop = 4 -- Number of spaces for tab key

-- Command line history
vim.opt.history = 10000 -- Keep 10000 lines of command line history
vim.opt.ruler = true -- Show the cursor position all the time

-- Performance settings
-- conflicat to notify plugin
-- vim.opt.lazyredraw = true -- Do not redraw while running macros

vim.opt.confirm = true -- Confirm before exiting modified buffer
-- vim.opt.relativenumber = true
vim.opt.number = true -- Turn on line numbers
vim.opt.numberwidth = 1 -- Minimum width of the number column

-- Turn off sound
vim.opt.visualbell = true -- Turn off sound for visual bell
-- vim.opt.t_vb = "" -- Set terminal visual bell to nothing

-- Scrolling settings
vim.opt.scrolloff = 4 -- 4 lines before and after the current line when scrolling
vim.opt.sidescrolloff = 10 -- 10 columns before and after the current column when scrolling

-- Allow hidden buffers
vim.opt.hidden = true -- Enable hidden buffers

-- Wildmenu and completion settings
vim.opt.wildmode = { "list:longest", "full" } -- Disable auto completion next part, Cool!
vim.opt.wildmenu = true -- Turn on wild menu
vim.opt.wildignore = {
    "*.o",
    "*.obj",
    "*~",
    "*DS_Store*",
    "vendor/rails/**",
    "vendor/cache/**",
    "*.gem",
    "log/**",
    "*.png",
    "*.jpg",
    "*.gif",
    "*.so",
    "*.swp",
    "*.zip",
    "*/.Trash/**",
    "*.pdf",
    "*.dmg",
    "*/Library/**",
    "*/.rbenv/**",
    "*/.nx/**",
    "*.app",
}

-- Folding settings
vim.opt.foldmethod = "marker"
vim.opt.foldlevelstart = 99
vim.opt.foldlevel = 1000
vim.opt.foldnestmax = 5

-- File encoding settings
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- Visualize some special characters
vim.opt.list = true -- Display unprintable with '^' and put $ after the line.
vim.opt.listchars = { tab = ">-", trail = "-", eol = "$", nbsp = "%", extends = ">", precedes = "<" }
vim.opt.showbreak = "↪"

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Window splitting settings
vim.opt.splitright = true -- Splitting a window will put it on the right
-- vim.opt.splitbelow = true -- Splitting a window will put it on the bottom

-- Enable project-specific vimrc
vim.opt.exrc = true -- Allows loading and executing local rc files

-- Allow backspacing over indent, eol, and start
vim.opt.backspace = { "indent", "eol", "start" }

-- Favorite file types
vim.cmd([[
  filetype plugin indent on
  syntax on
]])

-- File format settings
-- set ffs=unix,dos,mac
vim.opt.ffs = { "unix", "dos", "mac" }

-- Use mouse in normal and visual modes
vim.opt.mouse = "nv"

-----------------------------------------------------------------------------
-- [ Mouse + gVim-Killer Related Setting ]
--
-- Paste the X buffer, even on the command line
vim.api.nvim_set_keymap("n", "<LocalLeader>p", "i<S-MiddleMouse><ESC>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<S-Insert>", "<S-MiddleMouse>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("c", "<S-Insert>", "<S-MiddleMouse>", { noremap = true, silent = true })

-- Make the mouse paste a block of text without formatting it
vim.api.nvim_set_keymap("", "<MiddleMouse>", '<esc>"*p', { noremap = true, silent = true })

-- Enable block-mode selection
vim.api.nvim_set_keymap("n", "<C-LeftMouse>", "<LeftMouse><Esc><C-V>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-LeftDrag>", "<LeftDrag>", { noremap = true, silent = true })

-----------------------------------------------------------------------------
-- [ Abbreviations ]                                                         {{{
vim.cmd([[
    cabbrev vds vertical diffsplit
    cabbrev hds diffsplit
    cabbrev h help
    cabbrev vh vertical help
]])

-----------------------------------------------------------------------------
-- Write history on idle, for sharing among different sessions
vim.api.nvim_create_autocmd("CursorHold", {
    pattern = "*",
    callback = function()
        if vim.fn.exists(":rshada") == 2 then
            vim.cmd("rshada")
            vim.cmd("wshada")
        end
    end,
})

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-----------------------------------------------------------------------------
-- Remove unnecessary spaces in the end of line
vim.api.nvim_create_user_command("YPRemoveTailingSpace", function()
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, true) -- Get all lines in the buffer
    for i, line in ipairs(lines) do
        lines[i] = string.gsub(line, "%s+$", "") -- Remove trailing spaces using Lua's string.gsub
    end
    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines) -- Set the modified lines back to the buffer
end, { desc = "Remove Tailing Space" })

-- listchar=trail is not as flexible, use the below to highlight trailing
-- whitespace. Don't do it for unite windows or readonly files
-- vim.cmd([[
--     highlight ExtraWhitespace ctermbg=red guibg=red
--     match ExtraWhitespace /\s\+$/
--     autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
--     autocmd BufWinEnter * if &modifiable && &ft!='unite' | match ExtraWhitespace /\s\+$/ | endif
--     autocmd InsertEnter * if &modifiable && &ft!='unite' | match ExtraWhitespace /\s\+\%#\@<!$/ | endif
--     autocmd InsertLeave * if &modifiable && &ft!='unite' | match ExtraWhitespace /\s\+$/ | endif
--     autocmd BufWinLeave * if &modifiable && &ft!='unite' | call clearmatches() | endif
-- ]])

-------------------------------------------------------------------------
-- Remember the line number been edited last time {{{
vim.cmd([[
    if has("autocmd")
        augroup MyAutoCmd
            autocmd BufRead *.txt set tw=78
            autocmd BufReadPost *
            \ if line("'\"") > 0 && line ("'\"") <= line("$") |
            \   exe "normal g'\"" |
            \ endif

            autocmd BufWinLeave *
                \   if (v:progname != "vimdiff") &&
                \       expand("%") != "" &&
                \       expand("%") !~ "gitv-" &&
                \       expand("%") !~ ".tmp" &&
                \       expand("%") !~ "__MRU_Files__"
                \
                \|       silent! mkview
                \|  endif

            autocmd BufWinEnter *
                \   if (v:progname != "vimdiff") &&
                \       expand("%") != "" &&
                \       expand("%") !~ "gitv-" &&
                \       expand("%") !~ ".tmp" &&
                \       expand("%") !~ "__MRU_Files__"
                \
                \|      silent! loadview
                \|  endif

            " Restore cursor to file position in previous editing session
            autocmd BufReadPost *
                \   if line ("'\"") > 0 && line ("'\"") <= line("$")
                \|      exe "normal g'\""
                \|  endif
        augroup END
    endif
]])

-----------------------------------------------------
-- " QUICKFIX WINDOW for :make {{{
-- function! QFixToggle(forced)
--     if exists("g:qfix_win") && a:forced == 0
--         cclose
--         unlet g:qfix_win
--     else
--         copen 6
--         let g:qfix_win = bufnr("$")
--     endif
-- endfunction
--
-- command! -bang -nargs=? QFix call QFixToggle(<bang>0)
-- nnoremap <leader>q :QFix<CR>
