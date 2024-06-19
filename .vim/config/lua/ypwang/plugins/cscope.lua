return {
    "dhananjaylatkar/cscope_maps.nvim",
    dependencies = {
        { "blue119/cs-mgmt.vim" },
    },
    config = function()
        require("cscope_maps").setup({})
    end,
}
