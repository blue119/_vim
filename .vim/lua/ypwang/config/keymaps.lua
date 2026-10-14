-- Paste the X buffer, even on the command line
vim.api.nvim_set_keymap("n", "<LocalLeader>p", "i<S-MiddleMouse><ESC>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<S-Insert>", "<S-MiddleMouse>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("c", "<S-Insert>", "<S-MiddleMouse>", { noremap = true, silent = true })

-- Make the mouse paste a block of text without formatting it
vim.api.nvim_set_keymap("", "<MiddleMouse>", '<esc>"*p', { noremap = true, silent = true })

-- Enable block-mode selection
vim.api.nvim_set_keymap("n", "<C-LeftMouse>", "<LeftMouse><Esc><C-V>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-LeftDrag>", "<LeftDrag>", { noremap = true, silent = true })

local map = vim.api.nvim_set_keymap

-- disable direct-key
map("n", "<up>", "<nop>", { noremap = true, silent = true })
map("n", "<left>", "<nop>", { noremap = true, silent = true })
map("n", "<right>", "<nop>", { noremap = true, silent = true })
map("n", "<down>", "<nop>", { noremap = true, silent = true })

---------------------------------------------------------------------------
-- Copy the current file path to the clipboard
map(
    "n",
    "<leader>p",
    ':let @+=expand("%:p")<CR>:echo "Copied current file path \'" .. vim.fn.expand("%:p") .. "\' to clipboard"<CR>',
    { noremap = true, silent = true }
)

-- Normal mode remaps
---------------------------------------------------------------------------
-- Find previous match with F3
map("n", "<F3>", ":cp<CR>", { noremap = true, silent = true })

-- Find next match with F4
map("n", "<F4>", ":cn<CR>", { noremap = true, silent = true })

-- Toggle paste mode on/off with F7
map("n", "<F7>", ":set paste!<BAR>set paste?<CR>", { noremap = true, silent = true })

map("n", "<F9>", ":set list!<bar>set list?<CR>", { noremap = true, silent = true })

-- replace 'SHIFT+:' with ';' COOL!
map("n", ";", ":", { noremap = true })
map("v", ";", ":", { noremap = true })

-- Remap '+' and '_' to increment and decrement number respectively
map("n", "+", "<C-a>", { noremap = true, silent = true })
map("n", "_", "<C-x>", { noremap = true, silent = true })

map("n", "Q", ":q<CR>", { noremap = true, silent = true })
map("n", "U", "<C-r>", { noremap = true, silent = true })

-- Remap '|' to quickly make vertical splits
map("n", "|", ":vsp<CR>", { noremap = true, silent = true })

map("n", "<C-e>", "$", { noremap = true, silent = true })
map("n", "<C-a>", "^", { noremap = true, silent = true })

-- [ Window Operations ]                                                  {{{
-- Window navigation shortcuts
map("n", "<C-h>", "<C-w>h", { noremap = true, silent = true }) -- Move focus to the left window
map("n", "<C-j>", "<C-w>j", { noremap = true, silent = true }) -- Move focus to the window below
map("n", "<C-k>", "<C-w>k", { noremap = true, silent = true }) -- Move focus to the window above
map("n", "<C-l>", "<C-w>l", { noremap = true, silent = true }) -- Move focus to the right window

-- Window resizing by maximizing/minimizing the current split
map("n", "-", "<C-w>-", { noremap = true, silent = true }) -- Decrease the size of the current split
map("n", "=", "<C-w>+", { noremap = true, silent = true }) -- Increase the size of the current split

-- Adjust window size more horizontally
map("n", "<", "<C-w><", { noremap = true, silent = true }) -- Decrease the width of the current window
map("n", ">", "<C-w>>", { noremap = true, silent = true }) -- Increase the width of the current window

---------------------------------------------------------------------------
-- Insert mode mappings
map("i", "<C-a>", "<Home>", { noremap = true, silent = true }) -- Move cursor to the beginning of the line
map("i", "<C-e>", "<End>", { noremap = true, silent = true }) -- Move cursor to the end of the line

-- Visual mode mappings
---------------------------------------------------------------------------
-- Copy the selection using Neovim's configured clipboard provider.
vim.keymap.set("x", "<C-c>", '"+y', { desc = "Copy selection to clipboard" })

-- Visual mode tab control for indentation
---------------------------------------------------------------------------
map("x", "<tab>", ">gv", { noremap = true, silent = true })
map("x", "<s-tab>", "<gv", { noremap = true, silent = true })

-- Command mode mappings
---------------------------------------------------------------------------
-- Bash-like keys
map("c", "<C-a>", "<Home>", { noremap = true, silent = true }) -- Move cursor to the beginning of the line
map("c", "<C-e>", "<End>", { noremap = true, silent = true }) -- Move cursor to the end of the line

-- Move left/right by word
map("c", "<C-h>", "<S-Left>", { noremap = true, silent = true }) -- Move cursor one word to the left
map("c", "<C-l>", "<S-Right>", { noremap = true, silent = true }) -- Move cursor one word to the right

-- Show history with Ctrl-Space
map("c", "<C-@>", "<C-f>", { noremap = true, silent = true }) -- Ctrl-Space shows the command history

-- Navigation in command-line history
map("c", "<C-j>", "<Down>", { noremap = true, silent = true }) -- Move down in the command-line history
map("c", "<C-k>", "<Up>", { noremap = true, silent = true }) -- Move up in the command-line history
map("c", "<C-f>", "<Left>", { noremap = true, silent = true }) -- Move left in the command-line text
map("c", "<C-g>", "<Right>", { noremap = true, silent = true }) -- Move right in the command-line text

-- Delete previous word (using Alt-d or Meta-d)
map("c", "<M-d>", "<C-w>", { noremap = true, silent = true }) -- Mimics Ctrl-Delete in some terminals

-- Paste in command line mode
-- Uncomment the next line if you need to enable pasting with Ctrl-V
-- map("c", '<C-v>', '<C-r>', { noremap = true, silent = true })  -- Paste from register

-- w!!: Writes using sudo (useful for saving files with root permission)
map("c", "w!!", "w !sudo tee % >/dev/null", { noremap = true, silent = true }) -- Execute sudo save command

--  WinMerge-style (Alt + hjkl) mapping for vimdiff
-- Map Alt + j to ]c
map("n", "<M-j>", "]c", { noremap = true, silent = true })
map("n", "<M-k>", "[c", { noremap = true, silent = true })

map("n", "<M-h>", "do", { noremap = true, silent = true })
map("n", "<M-l>", "dp", { noremap = true, silent = true })
