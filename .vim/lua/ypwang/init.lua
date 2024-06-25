local extension = {}

extension.ensure = function(spec, callback, failed)
    local ok, module = pcall(require, spec)
    if ok then
        if callback then
            return callback(module)
        end
    else
        vim.notify(string.format("failed to load module %q", spec), vim.log.levels.WARN)
        if failed then
            failed()
        end
    end
    return ok, module
end

extension.lazydir = function(name)
    return vim.fs.normalize(vim.fn.stdpath("data") .. "/lazy/" .. name)
end

vim.treesitter.start = function() end
vim.cmd.runtime({ args = { "lua/ypwang/conf/*.lua" }, bang = true })

_G["ypwang"] = extension
