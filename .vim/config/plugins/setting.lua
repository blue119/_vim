-- nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
-- require("nvim-tree").setup()

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

-- nvim-web-devicons
require("nvim-web-devicons").setup()
--require("nvim-web-devicons").setup({
-- -- your personnal icons can go here (to override)
-- -- you can specify color or cterm_color instead of specifying both of them
-- -- DevIcon will be appended to `name`
-- override = {
--  zsh = {
--    icon = "",
--    color = "#428850",
--    cterm_color = "65",
--    name = "Zsh"
--  }
-- };
-- -- globally enable different highlight colors per icon (default to true)
-- -- if set to false all icons will have the default icon's color
-- color_icons = true;
-- -- globally enable default icons (default to false)
-- -- will get overriden by `get_icons` option
-- default = true;
-- -- globally enable "strict" selection of icons - icon will be looked up in
-- -- different tables, first by filename, and if not found by extension; this
-- -- prevents cases when file doesn't have any extension but still gets some icon
-- -- because its name happened to match some extension (default to false)
-- strict = true;
-- -- same as `override` but specifically for overrides by filename
-- -- takes effect when `strict` is true
-- override_by_filename = {
--  [".gitignore"] = {
--    icon = "",
--    color = "#f1502f",
--    name = "Gitignore"
--  }
-- };
-- -- same as `override` but specifically for overrides by extension
-- -- takes effect when `strict` is true
-- override_by_extension = {
--  ["log"] = {
--    icon = "",
--    color = "#81e043",
--    name = "Log"
--  }
-- };
-- -- same as `override` but specifically for operating system
-- -- takes effect when `strict` is true
-- override_by_operating_system = {
--  ["apple"] = {
--    icon = "",
--    color = "#A2AAAD",
--    cterm_color = "248",
--    name = "Apple",
--  },
-- };
--})

-- nvim-treesitter
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (or "all")
  ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
