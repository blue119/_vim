-- Keep generated editor files outside the configuration repository.
local cache = vim.fn.stdpath("cache")
for option, directory in pairs({
    backupdir = "backup",
    directory = "swp",
    undodir = "undo",
    viewdir = "view",
}) do
    local path = cache .. "/" .. directory
    vim.fn.mkdir(path, "p")
    vim.opt[option] = path
end
vim.opt.backup = true
vim.opt.swapfile = true
vim.opt.undofile = true

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
vim.opt.lazyredraw = true -- Do not redraw while running macros

vim.opt.confirm = true -- Confirm before exiting modified buffer
-- vim.opt.relativenumber = true
vim.opt.number = true -- Turn on line numbers
vim.opt.numberwidth = 4 -- Keep the line-number gutter readable
vim.opt.signcolumn = "yes" -- Avoid horizontal shifts when diagnostics appear

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
vim.opt.list = false -- Display unprintable with '^' and put $ after the line.
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

-- " [ Diff related ]                                                      {{{
-- "
-- "force vim diff to ignore whitespace
-- " set diffopt+=iwhite
-- " highlight diff color
vim.cmd([[
  hi diffchange ctermbg=236
  hi diffadd ctermbg=4
  hi DiffDelete ctermfg=69 ctermbg=234
  hi difftext ctermbg=3 ctermfg=0
]])
-- "DirDiff
vim.g.DirDiffExcludes = "*.git,*.svn,.*.swp,tags,cscope.*"
vim.g.DirDiffWindowSize = 10
