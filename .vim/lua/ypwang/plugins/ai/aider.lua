return {
    "joshuavial/aider.nvim",
    cmd = { "AiderOpen", "AiderAddModifiedFiles" },
    keys = {
        { "<leader>Ao", "<cmd>AiderOpen<CR>", desc = "Open Aider" },
        { "<leader>Am", "<cmd>AiderAddModifiedFiles<CR>", desc = "Add modified files to Aider" },
    },
    opts = {
        auto_manage_context = true,
        default_bindings = false, -- Lazy registers the keys before the plugin loads.
        debug = false,
    },
}
