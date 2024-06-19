" Setup vim-plug {{{
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source '~/.vimrc'
endif
" }}}
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" Plug 'blue119/molokai'
" Plug 'EdenEast/nightfox.nvim'
Plug 'rebelot/kanagawa.nvim'

" lean & mean status/tabline for vim that's light as air
Plug 'bling/vim-airline'
    " A collection of themes for vim-airline
    Plug 'vim-airline/vim-airline-themes'

""""""""""""
" VIM as IDE
"
" deno
" An ecosystem for Vim/Neovim enabling developers to write plugins in Deno.
Plug 'vim-denops/denops.vim'
    Plug 'vim-denops/denops-shared-server.vim', {'do': ':call denops_shared_server#install()'}
    Plug 'vim-denops/denops-helloworld.vim'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
    " Perform all your vim insert mode completions with Tab
    Plug 'ervandew/supertab'

" A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'
    " GitHub extension for fugitive.vim
    Plug 'tpope/vim-rhubarb'

" A Vim plugin which shows git diff markers in the sign column and stages/previews/undoes hunks and partial hunks.
Plug 'airblade/vim-gitgutter'

" searches for local vimrc files in the file system tree of the currently opened file.
Plug 'embear/vim-localvimrc'

" Vim script for text filtering and alignment
" Plug 'godlygeek/tabular'

" basic cscope settings and key mappings
Plug 'dhananjaylatkar/cscope_maps.nvim'
    Plug 'blue119/cs-mgmt.vim'

" A tree explorer plugin for vim.
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Neovim plugin to manage the file system and other tree like structures.
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'

" comment lines in a program
Plug 'blue119/EnhCommentify.vim'

" Changes Vim working directory to project root
" Plug 'blue119/vim-rooter'

" to highlight several words in different colors simultaneously
" Plug 'inkarkat/vim-mark'
Plug 'mbriggs/mark.vim'

" Run commands quickly.
Plug 'thinca/vim-quickrun'

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LSP for vim
Plug 'prabirshrestha/vim-lsp'

Plug 'mattn/vim-lsp-settings'
"
Plug 'folke/lsp-colors.nvim'

" Check syntax in Vim asynchronously and fix files, with Language Server Protocol (LSP) support
Plug 'dense-analysis/ale'

" Nvim Treesitter configurations and abstraction layer
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" About the completetion
" Dark powered asynchronous completion framework for neovim/Vim8
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
    " deoplete for C/C++/Obj-C/Obj-C++
    Plug 'zchee/deoplete-clang'

    " deoplete for python
    Plug 'zchee/deoplete-jedi'

    " deoplete for golang
    "Plug 'zchee/deoplete-go', {'do': 'make'}

    " Lua file type plug-in for the Vim text editor
    Plug 'xolox/vim-lua-ftplugin'

    " Miscellaneous auto-load Vim scripts
    Plug 'xolox/vim-misc'


" Dark powered asynchronous unite all interfaces for Neovim/Vim8
Plug 'Shougo/denite.nvim'
        " MRU plugin includes unite.vim/denite.nvim MRU sources
    Plug 'Shougo/neomru.vim'


Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
    Plug 'keremc/asyncomplete-racer.vim'
        Plug 'prabirshrestha/async.vim'
    Plug 'keremc/asyncomplete-clang.vim'
    Plug 'andreypopp/asyncomplete-ale.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""
" For filetype
"
" Vim plugin for clang-format, a formatter for C, C++, Obj-C, Java, JavaScript, and so on.
Plug 'rhysd/vim-clang-format'
"
" rst
" instant rst preview in browser
Plug 'Rykka/riv.vim', {'for': ['rst']}

" Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim', {'for': 'rust'}

" depends on rust.vim
Plug 'mattn/webapi-vim', {'for': 'rust'}

" beancont
Plug 'nathangrigg/vim-beancount', {'for': 'beancount'}

" cli-ledger
Plug 'ledger/vim-ledger', {'for': 'ledger'}

" golang
" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries', 'for': 'go'}
Plug 'jstemmer/gotags', {'for': 'go'}

" editconfig
" Editor Config Plugin
Plug 'editorconfig/editorconfig-vim', {'for': 'editorconfig'}

" The Uncompromising Code Formatter
Plug 'ambv/black', {'for': 'py'}

" terraform
" Plug 'hashivim/vim-terraform'

" csv
" Plug 'chrisbra/csv.vim', {'for':'csv'}

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Github copilot
Plug 'github/copilot.vim'

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()

