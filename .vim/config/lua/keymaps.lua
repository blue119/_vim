local map = vim.api.nvim_set_keymap

-- replace 'SHIFT+:' with ';' COOL!
map("n", ";", ":", { noremap = true })

-- disable direct-key
map("n", "<up>", "<nop>", { noremap = true, silent = true })
map("n", "<left>", "<nop>", { noremap = true, silent = true })
map("n", "<right>", "<nop>", { noremap = true, silent = true })
map("n", "<down>", "<nop>", { noremap = true, silent = true })
