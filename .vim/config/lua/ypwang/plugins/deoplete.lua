return {
    "Shougo/deoplete.nvim",
    build = ":UpdateRemotePlugins",
    dependencies = {
        -- deoplete for C/C++/Obj-C/Obj-C++
        { "zchee/deoplete-clang" },
        -- deoplete for python
        { "zchee/deoplete-jedi" },
        -- deoplete for golang
        { "zchee/deoplete-go", build = "make" },
        -- Lua file type plug-in for the Vim text editor
        {
            "xolox/vim-lua-ftplugin",
            -- Miscellaneous auto-load Vim scripts
            dependencies = { "xolox/vim-misc" },
        },
    },
}
