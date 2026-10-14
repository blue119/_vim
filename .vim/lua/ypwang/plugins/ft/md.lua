return {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        {
            "nvim-mini/mini.icons",
            main = "mini.icons",
            opts = {},
        },
    },
    opts = {
        code = {
            sign = false,
            language_pad = 1,
        },
    },
}
