return {
    -- A file explorer tree for neovim written in lua
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
        },
        keys = {
            {
                "<leader>tt",
                "<cmd>NvimTreeToggle<CR>",
                { desc = "NvimTreeToggle" },
            },
        },
        config = function()
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1

            require("nvim-tree").setup({
                sort = {
                    sorter = "case_sensitive",
                },
                view = {
                    width = 30,
                },
                renderer = {
                    group_empty = true,
                },
                filters = {
                    dotfiles = true,
                },
            })
        end,
    },
}
