vim.cmd([[
    cabbrev vds vertical diffsplit
    cabbrev hds diffsplit
    cabbrev h help
    cabbrev vh vertical help
]])

-- Remove unnecessary spaces in the end of line
vim.api.nvim_create_user_command("YPRemoveTailingSpace", function()
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, true) -- Get all lines in the buffer
    for i, line in ipairs(lines) do
        lines[i] = string.gsub(line, "%s+$", "") -- Remove trailing spaces using Lua's string.gsub
    end
    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines) -- Set the modified lines back to the buffer
end, { desc = "Remove Tailing Space" })
