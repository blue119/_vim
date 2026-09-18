local group = vim.api.nvim_create_augroup("ypwang", { clear = true })

-- Share command and search history between editor sessions.
vim.api.nvim_create_autocmd("CursorHold", {
    group = group,
    callback = function()
        if vim.fn.exists(":rshada") == 2 then
            vim.cmd("rshada")
            vim.cmd("wshada")
        end
    end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
    group = group,
    desc = "Highlight yanked text",
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd("BufRead", {
    group = group,
    pattern = "*.txt",
    callback = function(event)
        vim.bo[event.buf].textwidth = 78
    end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
    group = group,
    desc = "Restore the last cursor position",
    callback = function(event)
        local mark = vim.api.nvim_buf_get_mark(event.buf, '"')
        if mark[1] > 0 and mark[1] <= vim.api.nvim_buf_line_count(event.buf) then
            vim.cmd([[normal! g'"]])
        end
    end,
})

local function save_view_for(buffer)
    local name = vim.api.nvim_buf_get_name(buffer)
    return not vim.wo.diff
        and vim.bo[buffer].buftype == ""
        and name ~= ""
        and not name:find("gitv-", 1, true)
        and not name:find(".tmp", 1, true)
        and not name:find("__MRU_Files__", 1, true)
end

vim.api.nvim_create_autocmd({ "BufWinLeave", "BufWinEnter" }, {
    group = group,
    desc = "Save and restore file views",
    callback = function(event)
        if save_view_for(event.buf) then
            vim.cmd(event.event == "BufWinLeave" and "silent! mkview" or "silent! loadview")
        end
    end,
})
