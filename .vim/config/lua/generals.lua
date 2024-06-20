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
vim.opt.textwidth = 78 -- Set text width
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
vim.opt.lazyredraw = true -- Do not redraw while running macros

-- vim.opt.list = true          -- Display unprintable with '^' and put $ after the line.
vim.opt.confirm = true -- Confirm before exiting modified buffer
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

-- Window splitting settings
vim.opt.splitright = true -- Splitting a window will put it on the right

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

-- To function correctly in Screen
if not vim.fn.has("nvim") == 1 then
    vim.opt.ttymouse = "xterm"
end

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
