"let g:python3_host_prog='/usr/bin/python3'
"set rtp+=~/.cache/vim/dein/repos/github.com/Shougo/deoplete.nvim
"let g:deoplete#enable_at_startup = 1

"function! s:dein_load_yaml(filename) abort
"    " Fallback to use python3 and PyYAML
"    python3 << endpython
"import vim, yaml
"with open(vim.eval('a:filename'), 'r') as f:
"    vim.vars['denite_plugins'] = yaml.load(f.read())
"endpython
"
"    for plugin in g:denite_plugins
"        call dein#add(plugin['repo'], extend(plugin, {}, 'keep'))
"    endfor
"    unlet g:denite_plugins
"endfunction
"
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

Plug 'blue119/molokai'

" lean & mean status/tabline for vim that's light as air
Plug 'bling/vim-airline'
    " A collection of themes for vim-airline
    Plug 'vim-airline/vim-airline-themes'

"""""""""""
" golang
" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries', 'for': 'go'}
Plug 'jstemmer/gotags', {'for': 'go'}

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

""""""""""""
" VIM as IDE
"
" Vim script for text filtering and alignment
Plug 'godlygeek/tabular'

" basic cscope settings and key mappings
Plug 'vim-scripts/cscope_macros.vim'
    Plug 'blue119/cs-mgmt.vim'

" Source code browser (supports C/C++, java, perl, python, tcl, sql, php, etc)
" Plug 'vim-scripts/taglist.vim'
Plug 'majutsushi/tagbar'

" A tree explorer plugin for vim.
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" comment lines in a program
Plug 'blue119/EnhCommentify.vim'

" Changes Vim working directory to project root
Plug 'blue119/vim-rooter'

" to highlight several words in different colors simultaneously
" Plug 'inkarkat/vim-mark'
Plug 'mbriggs/mark.vim'

" Run commands quickly.
Plug 'thinca/vim-quickrun'

" The Uncompromising Code Formatter
Plug 'ambv/black'

" Vim plugin for clang-format, a formatter for C, C++, Obj-C, Java, JavaScript, and so on.
Plug 'rhysd/vim-clang-format'
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LSP for vim
Plug 'prabirshrestha/vim-lsp'

Plug 'mattn/vim-lsp-settings'
"
Plug 'folke/lsp-colors.nvim'

" Check syntax in Vim asynchronously and fix files, with Language Server Protocol (LSP) support
Plug 'dense-analysis/ale'

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

    " Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }

" The dark powered file explorer implementation
Plug 'Shougo/defx.nvim'

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
"""""""""""
" rst
" instant rst preview in browser
Plug 'Rykka/riv.vim', {'for': ['rst']}

" Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'

" depends on rust.vim
Plug 'mattn/webapi-vim'

"""""""""""
" beancont
Plug 'nathangrigg/vim-beancount'

" cli-ledger
Plug 'ledger/vim-ledger'

"""""""""""
" editconfig
" Editor Config Plugin
Plug 'editorconfig/editorconfig-vim'

"""""""""""
" terraform
" Plug 'hashivim/vim-terraform'

" csv
" Plug 'chrisbra/csv.vim', {'for':'csv'}

"""""""""""""""""""""""""""""""""""""""""""""""""""

" Using a non-master branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Github copilot
Plug 'github/copilot.vim'

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()




