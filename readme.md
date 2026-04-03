# _vim

Personal Neovim configuration built on **lazy.nvim**, with LSP, Treesitter, AI-assisted coding, and modular plugin organization.

## Requirements

- **Neovim** 0.9+
- **Git**
- **make** (for telescope-fzf-native, LuaSnip jsregexp, tiktoken)
- **npm** (for mcphub: `npm install -g mcp-hub@latest`)
- [**Nerd Font**](https://www.nerdfonts.com/) (for icons)

Optional, depending on your development workflow:

- Python 3, Go, Rust, C/C++ toolchains
- `xclip` (Linux clipboard support)

## Setup

```bash
# 1. Clone into ~/.vim
git clone git@github.com:blue119/_vim.git ~/.vim

# 2. Symlink as Neovim config
bash ~/.vim/deploy.sh   # creates ~/.config/nvim -> ~/.vim

# 3. Launch Neovim
nvim
```

On first launch, lazy.nvim bootstraps itself, installs all plugins, and Mason auto-installs configured LSP servers, formatters, and linters.

## Directory Structure

```
.vim/
├── init.lua                    # Entry point, lazy.nvim bootstrap
├── lazy-lock.json              # Plugin lock file
└── lua/ypwang/
    ├── init.lua                # Helper functions & globals
    ├── conf/
    │   ├── generals.lua        # General vim options
    │   ├── keymaps.lua         # Keybindings
    │   └── filetypes.lua       # Filetype-specific settings
    └── plugins/
        ├── ai/                 # AI-assisted coding
        ├── editor/             # Editor features & text manipulation
        ├── ft/                 # Filetype-specific plugins
        ├── git/                # Git integration
        ├── lsp/                # LSP, completion, formatting, linting
        ├── navigation/         # File & code navigation
        ├── tools/              # Development tools
        └── ui/                 # Theme & statusline
```

## Plugins

### AI

| Plugin | Description |
|--------|-------------|
| [github/copilot.vim](https://github.com/github/copilot.vim) | GitHub Copilot suggestions |
| [CopilotChat.nvim](https://github.com/CopilotC-Nvim/CopilotChat.nvim) | Interactive Copilot chat |
| [joshuavial/aider.nvim](https://github.com/joshuavial/aider.nvim) | Aider AI-assisted coding |
| [ravitemer/mcphub.nvim](https://github.com/ravitemer/mcphub.nvim) | Model Context Protocol server hub |

### Navigation

| Plugin | Description |
|--------|-------------|
| [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder (files, buffers, grep, diagnostics) |
| [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | File explorer tree |
| [stevearc/aerial.nvim](https://github.com/stevearc/aerial.nvim) | Code outline / symbol navigator |
| [folke/trouble.nvim](https://github.com/folke/trouble.nvim) | Diagnostics & quickfix viewer |

### LSP & Completion

| Plugin | Description |
|--------|-------------|
| [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP configuration |
| [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim) | LSP/DAP/linter/formatter installer |
| [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Autocompletion engine |
| [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Snippet engine |
| [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim) | Formatter |
| [mfussenegger/nvim-lint](https://github.com/mfussenegger/nvim-lint) | Linter |
| [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap) | Debug Adapter Protocol |

### Editor

| Plugin | Description |
|--------|-------------|
| [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Incremental parsing & syntax highlighting |
| [folke/which-key.nvim](https://github.com/folke/which-key.nvim) | Keybinding hints |
| [echasnovski/mini.pairs](https://github.com/echasnovski/mini.pairs) | Auto-pair brackets/quotes |
| [danymat/neogen](https://github.com/danymat/neogen) | Annotation/docstring generator |
| [blue119/EnhCommentify.vim](https://github.com/blue119/EnhCommentify.vim) | Comment/uncomment |
| [blue119/mark.vim](https://github.com/blue119/mark.vim) | Multi-word highlight |

### Git

| Plugin | Description |
|--------|-------------|
| [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive) | Git wrapper |
| [tpope/vim-rhubarb](https://github.com/tpope/vim-rhubarb) | GitHub integration for fugitive |
| [airblade/vim-gitgutter](https://github.com/airblade/vim-gitgutter) | Git diff markers in sign column |

### Filetype

| Plugin | Description |
|--------|-------------|
| [fatih/vim-go](https://github.com/fatih/vim-go) | Go language support |
| [Rykka/riv.vim](https://github.com/Rykka/riv.vim) | reStructuredText |
| [nathangrigg/vim-beancount](https://github.com/nathangrigg/vim-beancount) | Beancount ledger format |
| [ledger/vim-ledger](https://github.com/ledger/vim-ledger) | Ledger financial format |
| [terrastruct/d2-vim](https://github.com/terrastruct/d2-vim) | D2 diagram language |
| [ellisonleao/glow.nvim](https://github.com/ellisonleao/glow.nvim) | Markdown preview |
| [editorconfig/editorconfig-vim](https://github.com/editorconfig/editorconfig-vim) | EditorConfig support |

### UI

| Plugin | Description |
|--------|-------------|
| [rebelot/kanagawa.nvim](https://github.com/rebelot/kanagawa.nvim) | Color scheme |
| [bling/vim-airline](https://github.com/bling/vim-airline) | Statusline/tabline |

### Tools

| Plugin | Description |
|--------|-------------|
| [thinca/vim-quickrun](https://github.com/thinca/vim-quickrun) | Execute code snippets |
| [embear/vim-localvimrc](https://github.com/embear/vim-localvimrc) | Per-project `.lvimrc` support |

## Key Mappings

**Leader key:** `<Space>`

### General

| Key | Mode | Action |
|-----|------|--------|
| `;` | N | `:` (command mode) |
| `Q` | N | Quit |
| `U` | N | Redo |
| `\|` | N | Vertical split |
| `+` / `_` | N | Increment / decrement number |
| `<C-a>` / `<C-e>` | N, I, C | Start / end of line |
| `<F3>` / `<F4>` | N | Previous / next quickfix |
| `<F7>` | N | Toggle paste mode |
| `<F9>` | N | Toggle list display |
| `<leader>p` | N | Copy file path to clipboard |
| `<Tab>` / `<S-Tab>` | V | Indent / outdent |

### Window Navigation

| Key | Action |
|-----|--------|
| `<C-h/j/k/l>` | Move focus between windows |
| `-` / `=` | Resize vertical split |
| `<` / `>` | Resize horizontal split |

### Diff Mode (WinMerge-style)

| Key | Action |
|-----|--------|
| `<M-j>` / `<M-k>` | Next / previous diff hunk |
| `<M-h>` / `<M-l>` | Get from left / put to right |

### Search (Telescope)

| Key | Action |
|-----|--------|
| `<leader>sf` | Find files |
| `<leader>sg` | Live grep |
| `<leader>sw` | Search current word |
| `<leader>sd` | Search diagnostics |
| `<leader>sh` | Search help tags |
| `<leader>sk` | Search keymaps |
| `<leader>sr` | Resume last search |
| `<leader>s.` | Recent files |
| `<leader>sn` | Search Neovim config |
| `<leader><leader>` | Find open buffers |
| `<leader>/` | Fuzzy search in current buffer |
| `<leader>s/` | Live grep in open files |

### LSP

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Go to references |
| `gI` | Go to implementation |
| `gD` | Go to declaration |
| `K` | Hover documentation |
| `<leader>rn` | Rename |
| `<leader>ca` | Code action |
| `<leader>D` | Type definition |
| `<leader>ds` | Document symbols |
| `<leader>ws` | Workspace symbols |
| `<leader>th` | Toggle inlay hints |

### Completion (nvim-cmp)

| Key | Action |
|-----|--------|
| `<C-j>` / `<C-k>` | Next / previous item |
| `<C-b>` / `<C-f>` | Scroll docs up / down |
| `<C-Space>` | Trigger completion |
| `<CR>` | Confirm selection |
| `<C-e>` | Abort |
| `<C-l>` / `<C-h>` | Next / previous snippet placeholder |

### Diagnostics (Trouble)

| Key | Action |
|-----|--------|
| `<leader>xx` | Toggle all diagnostics |
| `<leader>xX` | Toggle buffer diagnostics |
| `<leader>cs` | Toggle symbols |
| `<leader>cl` | LSP definitions/references |
| `<leader>xL` | Location list |
| `<leader>xQ` | Quickfix list |

### Other

| Key | Action |
|-----|--------|
| `<leader>tt` | Toggle file explorer (NvimTree) |
| `<leader>a` | Toggle code outline (Aerial) |
| `<leader>f` | Format buffer |
| `<leader>l` | Toggle linting |
| `<leader>cn` | Generate annotation (Neogen) |
| `{` / `}` | Previous / next symbol (Aerial) |

### Command Abbreviations

| Abbreviation | Expands to |
|--------------|------------|
| `vds` | `vertical diffsplit` |
| `hds` | `diffsplit` |
| `vh` | `vertical help` |
| `w!!` | Write with sudo |

## Mason-managed Tools

### LSP Servers

`clangd`, `gopls`, `pyright`, `lua_ls`, `rust_analyzer`, `bacon_ls`, `bashls`

### Formatters

`stylua`, `clang_format`, `jq`, `isort`, `black`, `prettier`, `rustfmt`, `gofumpt`

### Linters

`pylint`, `golangci-lint`, `misspell`
