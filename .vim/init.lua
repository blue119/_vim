-- Vim Initialization
---------------------

-- Set the global leader and local leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-------------------------------------------------------------------------------
vim.env.VARPATH = vim.fn.stdpath("cache")
vim.opt.backupdir = vim.env.VARPATH .. "/backup"
vim.opt.backup = true -- Enable backup
--
---- List of directory names for the swap file, separated with commas.
vim.opt.directory = vim.env.VARPATH .. "/swp"
vim.opt.swapfile = true
--
vim.opt.undodir = vim.env.VARPATH .. "/undo"
vim.opt.undofile = true
--
---- Sync clipboard between OS and Neovim.
vim.opt.viewdir = vim.env.VARPATH .. "/view"

-- Function to clear key mappings in normal and visual modes
-- local function clear_keymap(key)
--     vim.api.nvim_set_keymap("n", key, "<Nop>", { noremap = true, silent = true })
--     vim.api.nvim_set_keymap("x", key, "<Nop>", { noremap = true, silent = true })
-- end

-- clear_keymap("<Space>")
-- clear_keymap(",")
-- clear_keymap(";")

require("generals")
require("keymaps")
require("filetypes")

--------------------------------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

local opts = {
    --    dev = { path = require("kyoh86.conf.lazy").dev_path },
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
}
require("lazy").setup({ { import = "ypwang.plugins" } }, opts)
require("theme")
