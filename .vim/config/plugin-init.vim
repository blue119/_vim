function! s:dein_load_yaml(filename) abort
    " Fallback to use python3 and PyYAML
    python3 << endpython
import vim, yaml
with open(vim.eval('a:filename'), 'r') as f:
    vim.vars['denite_plugins'] = yaml.load(f.read())
endpython

    for plugin in g:denite_plugins
        call dein#add(plugin['repo'], extend(plugin, {}, 'keep'))
    endfor
    unlet g:denite_plugins
endfunction

" Setup dein {{{
if &runtimepath !~# '/dein.vim'
    let s:dein_dir = expand('$VARPATH/dein').'/repos/github.com/Shougo/dein.vim'
    if ! isdirectory(s:dein_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
    endif

    execute 'set runtimepath+='.substitute(
        \ fnamemodify(s:dein_dir, ':p') , '/$', '', '')
endif
" }}}
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Initialize dein.vim (package manager)
let s:path = expand('$VARPATH/dein')
" let s:plugins_path = expand('$VIMPATH/config/plugins.yaml')
" let s:user_plugins_path = expand('$VIMPATH/config/local.plugins.yaml')

" Plugin install: vim +PluginInstall +qall
" if dein#load_state('/home/blue119/.vim/bundle/')
    " call dein#begin('/home/blue119/.vim/bundle/')
if dein#load_state(s:path)
    call dein#begin(s:path)

    " Let dein manage dein
    " Required:
    call dein#add(s:path.'/repos/github.com/Shougo/dein.vim')

    " Add or remove your plugins here:
    " call dein#add('Shougo/neosnippet.vim')
    " call dein#add('Shougo/neosnippet-snippets')

    " You can specify revision/branch/tag.
    " call dein#add('Shougo/deol.nvim', { 'rev': 'a1b5108fd' })

    " Color Scheme
    call dein#add('blue119/molokai')

    " lean & mean status/tabline for vim that's light as air
    call dein#add('bling/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')

    " git
    " fugitive.vim: a Git wrapper so awesome, it should be illegal
    call dein#add('tpope/vim-fugitive')
    call dein#add('airblade/vim-gitgutter')

    " Vim script internal debugger (output in separate window, tab, or remote vim)
    "call dein#add('vim-scripts/Decho')

    " Visualize your undo tree.
    "call dein#add('Gundo')

    " search the file for FIXME, TODO, and XXX
    " call dein#add('TaskList.vim')

    " For Program Language {{{
    " Java Script
    " Beautify your javascript ,html,css source code inside Vim
"    call dein#add('maksimr/vim-jsbeautify', {
"                \ 'on_ft': ['json', 'js', 'html', 'css'],
"                \ 'build': 'git submodule update --init --recursive'})
"
"    "" JSX
"    "NeoBundle 'mxw/vim-jsx'
"    "" NeoBundleLazy 'mxw/vim-jsx', { 'autoload': { 'filetypes' : ['javascript', 'javascript.jsx'] }, }
"    call dein#add('mxw/vim-jsx', { 'on_ft': ['javascript', 'javascript.jsx'],})
"
"    "" Node JS
"    "" Tools and environment to make Vim superb for developing with Node.js.
"    call dein#add('moll/vim-node', { 'on_ft': ['javascript'],})
"    "" A vim plugin for highlighting and indenting JST/EJS syntax.
"    call dein#add('briancollins/vim-jst', { 'on_ft': ['ejs'],})
"    "" Various snippets for developing node.js from vim
"    call dein#add('jamescarr/snipmate-nodejs', { 'on_ft': ['javascript'],})
"
    " go Vim Mode
    call dein#add('fatih/vim-go' ,    { 'on_ft': ['go'], })
    call dein#add('jstemmer/gotags' , { 'on_ft': ['go'], })
    call dein#add('garyburd/go-explorer' , {
        \ 'build': 'go get github.com/garyburd/go-explorer/src/getool',
        \ 'on_ft': ['go'] ,
        \ })
"
"    "" Octave
"    "" Send Octave code from a VIM buffer to Octave
"    "NeoBundleLazy 'octave.vim', { 'autoload': { 'filetypes' : ['m'] }, }
"    call dein#add('vim-scripts/octave.vim', { 'on_ft': ['m'], })
"
"    "" Haskell
"    call dein#add('lukerandall/haskellmode-vim', { 'on_ft': ['hs'], })
"    "" Vim plugin for Haskell development.
"    call dein#add('bitc/vim-hdevtools', { 'on_ft': ['hs'], })
"    "" A completion plugin for Haskell, using ghc-mod.
"    call dein#add('eagletmt/neco-ghc', { 'on_ft': ['hs'], })
"
"    "" CSV
"    "NeoBundleLazy 'chrisbra/csv.vim', { 'autoload': { 'filetypes' : ['csv'] }, }
"
"    "" CPP
"    call dein#add('octol/vim-cpp-enhanced-highlight', { 'on_ft': ['cpp', 'c++'], })
"
"    "" Markdown
"    call dein#add('plasticboy/vim-markdown', { 'on_ft': ['markdown', 'mk'], })
"
    "" TOML
    call dein#add('cespare/vim-toml', { 'on_ft': ['toml'], })
"
"    "" CSS
"    "NeoBundle 'hail2u/vim-css3-syntax'
"
"    "" vim syntax file for plantuml
"    "NeoBundleLazy 'aklt/plantuml-syntax' , { 'autoload': { 'filetypes' : ['plantuml'] }, }
"
"    "" Docker
"    call dein#add('ekalinin/Dockerfile.vim', { 'on_ft': ['dockerfile'], })
"
"    "" LiveScript support for Vim
"    "NeoBundleLazy 'gkz/vim-ls' , { 'autoload': { 'filetypes' : ['ls'] }, }
"    call dein#add('gkz/vim-ls', { 'on_ft': ['ls'], })

    "" XML
    "NeoBundleLazy 'othree/xml.vim' , { 'autoload': { 'filetypes' : ['xml'] }, }

    "" instant rst preview in browser
    call dein#add('Rykka/riv.vim', { 'on_ft': ['rst'], })
    "NeoBundleLazy 'Rykka/InstantRst' , { 'autoload': { 'filetypes' : ['rst'] }, }
    "
    "
    " nginx conf
    call dein#add('chr4/nginx.vim')

    " Editor Config Plugin
    call dein#add('editorconfig/editorconfig-vim')
    " }}}

    " GNU info documentation browser.
    " NeoBundle 'info.vim'

    " Snippet
    call dein#add('honza/vim-snippets')
    " call dein#add('Shougo/neosnippet-snippets')
    call dein#add('SirVer/ultisnips')

    " basic cscope settings and key mappings
    call dein#add('vim-scripts/cscope_macros.vim')

    " Source code browser (supports C/C++, java, perl, python, tcl, sql, php, etc)
    call dein#add('vim-scripts/taglist.vim')
    call dein#add('majutsushi/tagbar')

    " Autocompletion deoplete {{{
    call dein#add('Shougo/deoplete.nvim')
    if !has('nvim')
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
    endif

    " deoplete for python
    call dein#add('zchee/deoplete-jedi')

    " deoplete for golang
    call dein#add('zchee/deoplete-go', {'build': 'make'})

    call dein#add('xolox/vim-lua-ftplugin')
    call dein#add('xolox/vim-misc')
    " }}}

    call dein#add('ervandew/supertab')

    " extended % matching for HTML, LaTeX, and many other languages
    call dein#add('tmhedberg/matchit')

    " Indent Guides is a plugin for visually displaying indent levels in Vim.
    call dein#add('nathanaelkane/vim-indent-guides')

    " Vim motions on speed!
    call dein#add('Lokaltog/vim-easymotion')

    " Vim script for text filtering and alignment
    call dein#add('godlygeek/tabular')

    " to highlight several words in different colors simultaneously
    call dein#add('mbriggs/mark.vim')

    call dein#add('blue119/EnhCommentify.vim')
    call dein#add('blue119/cs-mgmt.vim')
    call dein#add('blue119/occur.vim')
    call dein#add('blue119/vim-rooter')

    " Unite to denite.nvim
    " call dein#add('Shougo/unite.vim')
    " call dein#add('Shougo/vimproc.vim', {'build': {'unix': g:make}})
    " call dein#add('Shougo/unite-build')
    " call dein#add('tsukkee/unite-tag')
    call dein#add('Shougo/denite.nvim')
    call dein#add('Shougo/neomru.vim')

    " Run commands quickly.
    call dein#add('thinca/vim-quickrun')

    " robot framework
    " NeoBundle 'blue119/unite-rf'
    " NeoBundle 'mfukar/robotframework-vim'

    " file tree
    " call dein#add('Shougo/vimfiler.vim')
    call dein#add('Shougo/defx.nvim')
    call dein#add('scrooloose/nerdtree')

    " shell
    call dein#add('Shougo/vimshell.vim')

    " zim
    "call dein#add('blue119/vim-zim')

    "emoji
    call dein#add('junegunn/vim-emoji')
    set completefunc=emoji#complete

    " session
    call dein#add('lambdalisue/session.vim')

    " Required:
    call dein#end()
    call dein#save_state()
    if dein#check_install()
        if ! has('nvim')
            set nomore
        endif
        call dein#install()
    endif
endif
" Dein.vim End }}}
