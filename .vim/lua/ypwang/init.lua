-- Leaders must be set before keymaps and plugin specifications are loaded.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("ypwang.config.options")
require("ypwang.config.keymaps")
require("ypwang.config.commands")
require("ypwang.config.autocmds")
require("ypwang.config.filetypes")
require("ypwang.config.lazy")
