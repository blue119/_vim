" =============================================================================
" [ Plugin configuration ]                                  {{{
"
    " -------------------------------------------------------------------------
    " [ cs-mgmt.vim ]                                                      {{{
        let g:CsMgmtCscopeEnable = 1
        let g:CsMgmtCtagsEnable = 1
        let g:CsMgmtReAttach = 1
    " }}}
    " -------------------------------------------------------------------------
    " [ UltiSnips ]                                           {{{
    "
"    if dein#tap('ultisnips')
        let g:UltiSnipsExpandTrigger="<tab>"
        let g:UltiSnipsJumpForwardTrigger="<tab>"
        let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"    endif
    " }}}
    "
    " -------------------------------------------------------------------------
    " [ git-fugitive ]                                                {{{
    "
        autocmd FileType git :setlocal foldlevel=99
        let g:Gitv_TruncateCommitSubjects = 1
        let g:Gitv_DoNotMapCtrlKey = 0
    " }}}
    " -------------------------------------------------------------------------
    " [ EnhancedCommentify ]                                                {{{
    "
        let g:EnhCommentifyRespectIndent = 'Yes'
        let g:EnhCommentifyPretty = 'Yes'
        let g:EnhCommentifyMultiPartBlocks = 'Yes'
        let g:EnhCommentifyAlignRight = 'Yes'
    " }}}
    "
    " -------------------------------------------------------------------------
    " [ denite ]                                                             {{{
    " https://github.com/Shougo/shougo-s-github/blob/master/vim/rc/plugins/denite.rc.vim
    " Define mappings

"    if dein#tap('denite.nvim')
        " autocmd FileType denite call s:denite_my_settings()
        " function! s:denite_my_settings() abort
        "     nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
        "     nnoremap <silent><buffer><expr> d denite#do_map('do_action', 'delete')
        "     nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
        "     nnoremap <silent><buffer><expr> q denite#do_map('quit')
        "     nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
        "     nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
        " endfunction

        " autocmd FileType denite-filter call s:denite_filter_my_settings()
        " function! s:denite_filter_my_settings() abort
        "     imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
        " endfunction

        " if executable('rg')
        "     call denite#custom#var('file/rec', 'command'        , ['rg', '--files', '--glob', '!.git'])
        "     " call denite#custom#var('grep'    , 'command'        , ['rg', '--no-ignore', '--threads', '1'])
        "     call denite#custom#var('grep'    , 'command'        , ['rg', '--threads', '1'])
        "     call denite#custom#var('grep'    , 'recursive_opts' , [])
        "     call denite#custom#var('grep'    , 'final_opts'     , [])
        "     call denite#custom#var('grep'    , 'separator'      , ['--'])
        "     call denite#custom#var('grep'    , 'default_opts'   , ['-i', '--vimgrep', '--no-heading'])
        " " else
        "     " call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
        " endif


        " call denite#custom#source('file/old',     'matchers', ['matcher/fuzzy', 'matcher/project_files'])
        " call denite#custom#source('file/mru', 'matchers', ['matcher/fuzzy', 'matcher_project_files'])
        " call denite#custom#source('tag'     ,     'matchers', ['matcher/substring'])

        " if has('nvim')
        "     " call denite#custom#source('file/rec', 'matchers', ['matcher/fruzzy'])
        "     call denite#custom#source('file/rec', 'matchers', ['matcher/cpsm'])
        " endif

        " call denite#custom#source('file/old,ghq', 'converters',  ['converter/relative_word', 'converter/relative_abbr'])

        " " Change sorters.
        " call denite#custom#source('file/rec', 'sorters', ['sorter/sublime'])


        " "For python script scantree.py (works if python 3.5+ in path)
        " "Read bellow on this file to learn more about scantree.py
        " " call denite#custom#var('file_rec', 'command', ['scantree.py'])

        " " Change mappings.
        " " call denite#custom#map('insert', '<C-r>'     , '<denite:toggle_matchers:matcher_substring>', 'noremap')
        " " call denite#custom#map('insert', '<C-s>'     , '<denite:toggle_sorters:sorter_reverse>'    , 'noremap')
        " " call denite#custom#map('insert', '<C-j>'     , '<denite:move_to_next_line>'                , 'noremap' )
        " " call denite#custom#map('insert', '<C-k>'     , '<denite:move_to_previous_line>'            , 'noremap' )
        " " call denite#custom#map('insert', '<Down>'    , '<denite:move_to_next_line>'                , 'noremap' )
        " " call denite#custom#map('insert', '<Up>'      , '<denite:move_to_previous_line>'            , 'noremap' )
        " " call denite#custom#map('insert', '<PageDown>', '<denite:scroll_page_forwards>'             , 'noremap' )
        " " call denite#custom#map('insert', '<PageUp>'  , '<denite:scroll_page_backwards>'            , 'noremap' )
        " " call denite#custom#map('insert', ';'         , 'vimrc#sticky_func()'                       , 'expr')

        " " call denite#custom#map('normal', '<PageDown>',  '<denite:scroll_page_forwards>' , 'noremap' )
        " " call denite#custom#map('normal', '<PageUp>'  ,  '<denite:scroll_page_backwards>', 'noremap' )
        " " call denite#custom#map('normal', 'r'         ,  '<denite:do_action:quickfix>'   , 'noremap')

        " " Define alias
        " call denite#custom#alias('source', 'file/rec/git', 'file/rec')
        " call denite#custom#var('file/rec/git', 'command', ['git', 'ls-files', '-co', '--exclude-standard'])

        " " call denite#custom#alias('source', 'file_rec/py', 'file_rec')
        " " call denite#custom#var('file_rec/py', 'command', ['scantree.py'])

        " " Change default prompt
        " call denite#custom#option('default', {
        "     \ 'mode' : 'insert',
        "     \ 'prompt': '>',
        "     \ 'empty': 0,
        "     \ 'auto_resize': 1,
        "     \ 'auto_resume': 1,
        "     \ 'short_source_names': v:true
        "     \ })

        " " call denite#custom#option('default', 'prompt', '>')

        " " denite option
        " " let s:denite_options = {
        " "       \ 'default' : {
        " "       \ 'winheight' : 25,
        " "       \ 'mode' : 'insert',
        " "       \ 'quit' : 'true',
        " "       \ 'highlight_matched_char' : 'MoreMsg',
        " "       \ 'highlight_matched_range' : 'MoreMsg',
        " "       \ 'direction': 'rightbelow',
        " "       \ 'statusline' : has('patch-7.4.1154') ? v:false : 0,
        " "       \ 'prompt' : '➭',
        " "       \ }}

        " " Add custom menus
        " let s:menus = {}

        " let s:menus.zsh = { 'description': 'Edit your import zsh configuration'  }
        " let s:menus.zsh.file_candidates = [
        "     \ ['zshrc', '~/.config/zsh/.zshrc'],
        "     \ ['zshenv', '~/.zshenv'],
        "     \ ]

        " let s:menus.my_commands = { 'description': 'Example commands' }
        " let s:menus.my_commands.command_candidates = [
        "     \ ['Split the window', 'vnew'],
        "     \ ['Open zsh menu', 'Denite menu:zsh'],
        "     \ ]

        " let s:menus.vim = {
        "     \ 'description': 'Vim',
        "     \ }
        " let s:menus.vim.file_candidates = [
        "     \ ['    > Edit configuation file (init.vim)', '~/.vimrc']
        "     \ ]

        " call denite#custom#var('menu', 'menus', s:menus)


        " " function! s:profile(opts) abort
        " "   for fname in keys(a:opts)
        " "     for dopt in keys(a:opts[fname])
        " "       call denite#custom#option(fname, dopt, a:opts[fname][dopt])
        " "     endfor
        " "   endfor
        " " endfunction

        " " call s:profile(s:denite_options)

        " " Change ignore_globs
        " call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
        "       \ [ '.git/', '.ropeproject/', '__pycache__/',
        "       \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])

        " " Custom action
        " call denite#custom#action('file', 'test' , {context -> execute('let g:foo = 1')})
        " call denite#custom#action('file', 'test2', {context -> denite#do_action(context, 'open', context['targets'])})


        " " HotKeys
        " nnoremap [denite] <Nop>
        " nmap <Leader>u [denite]
        " "" File searching like ctrlp.vim
        " nnoremap <C-p> :Denite -buffer-name=files buffer -input= file/rec<CR>
        " nnoremap <silent> [denite]g  :<C-u>Denite grep:. -buffer-name=search-buffer<CR>
        " nnoremap <silent> [denite]gc :<C-u>DeniteCursorWord grep:. -buffer-name=search-buffer<CR>

        " nnoremap <silent> [denite]j  :<C-u>Denite -resume -cursor-pos=+1 -immediately -buffer-name=search-buffer<CR>
        " nnoremap <silent> [denite]k  :<C-u>Denite -resume -cursor-pos=-1 -immediately -buffer-name=search-buffer<CR>

        " Backup
        " https://github.com/joker1007/dotfiles/blob/master/vimrc
        " nnoremap <silent> [denite]ff   :<C-u>Denite -buffer-name=files -mode=insert file<CR>
        " nnoremap <silent> [denite]fa   :<C-u>Denite -buffer-name=files -mode=insert file_rec<CR>
        " nnoremap <silent> [denite]fr   :<C-u>Denite -buffer-name=files -mode=insert file_mru<CR>
        " nnoremap <silent> [denite]d   :<C-u>Denite -buffer-name=files -mode=insert directory_mru<CR>
        " nnoremap <silent> [denite]F   :<C-u>DeniteBufferDir -buffer-name=files -mode=insert file<CR>
        " nnoremap <silent> [denite]b   :<C-u>Denite -buffer-name=buffers -mode=insert buffer<CR>
        " nnoremap <silent> [denite]o   :<C-u>Denite -mode=insert -buffer-name=outline outline<CR>
        " nnoremap <silent> [denite]"   :<C-u>Denite -buffer-name=register register<CR>
        " nnoremap <silent> [denite]c   :<C-u>Denite -buffer-name=commands command<CR>
        " nnoremap <silent> [denite]s   :<C-u>Denite -buffer-name=snippets unite:snippet<CR>
        " nnoremap <silent> [denite]u   :<C-u>Denite -mode=insert source<CR>
        " nnoremap <silent> [denite]l   :<C-u>Denite -buffer-name=lines line<CR>
        " nnoremap <silent> [denite]m   :<C-u>Denite -buffer-name=bookmark unite:bookmark<CR>
        " nnoremap <silent> [denite]rm   :<C-u>Denite -buffer-name=ref -mode=insert unite:ref/man<CR>
        " nnoremap <silent> [denite]rr   :<C-u>Denite -buffer-name=ref -mode=insert unite:ref/refe<CR>
        " nnoremap <silent> [denite]g   :<C-u>Denite -buffer-name=grep grep<CR>
        " nnoremap <silent> [denite]hd   :<C-u>Denite -mode=insert unite:haddock<CR>
        " nnoremap <silent> [denite]y   :<C-u>Denite -buffer-name=yankround unite:yankround<CR>
        " nnoremap [denite]pr  :<C-u>Denite unite:pull_request:
        " nnoremap [denite]pf  :<C-u>Denite unite:pull_request_file:
    " }}}

    " -------------------------------------------------------------------------
    " [ vim-indent-guides ]                                                {{{
    "
"    if dein#tap('vim-indent-guides')
        let g:indent_guides_enable_on_vim_startup = 1
        let g:indent_guides_auto_colors = 0
        let g:indent_guides_start_level = 2
        let g:indent_guides_guide_size = 1
        let g:indent_guides_color_change_percent = 10
        hi IndentGuidesOdd  ctermbg=gray
        hi IndentGuidesEven ctermbg=darkgrey
"    endif
    " }}}
    "
    " -------------------------------------------------------------------------
    " [ NERD_TREE ]                                                        {{{
    "
        " let NERDTreeChDirMode=2
        " nnoremap <Leader>nt :NERDTreeToggle<CR>
    " }}}
    "
    " -------------------------------------------------------------------------
    " [ nvim-tree.lua ]                                                        {{{
        " luafile $VIMPATH/config/plugins/setting.lua
    " }}}
    "
    " -------------------------------------------------------------------------
    " [ Tag List ]                                                         {{{
    "
"    if dein#tap('taglist.vim')
        " Split to the right side of the screen
     "   let g:Tlist_Use_Right_Window = 1
     "   " Sort by the order
     "   let g:Tlist_Sort_Type = "order"
     "   " If you are the last, kill yourself
     "   let g:Tlist_Exit_OnlyWindow = 1
     "   " Do not show folding tree
     "   let g:Tlist_Enable_Fold_Column = 0
     "   " Always display one file tags
     "   let g:Tlist_Show_One_File = 1

     "   let g:Tlist_WinWidth = 35
"    endif
    " }}}
    "
    " -------------------------------------------------------------------------
    " [ DoxygenToolkit.vim ]                                               {{{
    "
"    if dein#tap('DoxygenToolkit.vim')
        " Dox :call <SID>DoxygenCommentFunc()
        " DoxLic :call <SID>DoxygenLicenseFunc()
        " DoxAuthor :call <SID>DoxygenAuthorFunc()
        " DoxUndoc :call <SID>DoxygenUndocumentFunc(<q-args>)
        " DoxBlock :call <SID>DoxygenBlockFunc()
        let g:DoxygenToolkit_briefTag_pre="@Synopsis "
        let g:DoxygenToolkit_paramTag_pre="@Param "
        let g:DoxygenToolkit_returnTag="@Returns  "
        let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
        let g:DoxygenToolkit_blockFooter="--------------------------------------------------------------------------"
        let g:DoxygenToolkit_authorName="Yao-Po Wang"
        let g:DoxygenToolkit_licenseTag="Ruckus Wireless"
"    endif
    " }}}
    "
    " -------------------------------------------------------------------------
    " [ tagbar ]                                                     {{{

     "   let g:tagbar_type_typescript = {
     "     \ 'ctagstype': 'typescript',
     "     \ 'kinds': [
     "       \ 'c:classes',
     "       \ 'n:modules',
     "       \ 'f:functions',
     "       \ 'v:variables',
     "       \ 'v:varlambdas',
     "       \ 'm:members',
     "       \ 'i:interfaces',
     "       \ 'e:enums',
     "     \ ]
     "   \ }
     "   let g:tagbar_autofocus = 1
    " }}}
    " -------------------------------------------------------------------------
    " [ airline ]                                                        {{{
    "
        let g:airline#extensions#branch#enabled=1
        let g:airline#extensions#syntastic#enabled = 1
        let g:airline_detect_paste=1
        let g:airline_theme='molokai'
        let g:airline_powerline_fonts = 1

        if ! has('gui_running')
            set ttimeoutlen=10
            augroup MyAutoCmd
                au InsertEnter * set timeoutlen=0
                au InsertLeave * set timeoutlen=1000
            augroup END
        endif

        " powerline symbols
        let g:airline_left_sep = ''
        let g:airline_left_alt_sep = ''
        let g:airline_right_sep = ''
        let g:airline_right_alt_sep = ''
        let g:airline#extensions#branch#symbol = ' '
        let g:airline#extensions#readonly#symbol = ''
        let g:airline_linecolumn_prefix = ' '
        let g:airline#extensions#paste#symbol = 'ρ'
"    endif
    " }}}
    " -------------------------------------------------------------------------
    " [ editorconfig-vim ]                                                  {{{
    "
"    if dein#tap('editorconfig-vim')
        " Excluded patterns.
        let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

        " function! _editconfigFiletypeHook(config)
        "    if has_key(a:config, 'vim_filetype')
        "        let &filetype = a:config['vim_filetype']
        "    endif

        "    return 0   " Return 0 to show no error happened
        " endfunction

        " call editorconfig#AddNewHook(function('_editconfigFiletypeHook'))
"    endif
    " }}}

    " -------------------------------------------------------------------------
    " [ rooter ]                                                            {{{
    "
"    if dein#tap('vim-rooter')
        " To stop vim-rooter changing directory automatically
        let g:rooter_manual_only = 1

        " :lcd instead of :cd
        " let g:rooter_use_lcd = 1

        " own directory and file patterns like this:
        " let g:rooter_patterns = ['Rakefile', '.git/']
"    endif
    " }}}
    " -------------------------------------------------------------------------
    " [ deoplete.nvim ]                                                     {{{
    "
"   if dein#tap('deoplete.nvim')
"   there is conflic with asyncomplete.vim, it will lead the popup window
"   weirdly disappear
"       let g:deoplete#enable_at_startup = 0
"   endif
    " }}}

    " -------------------------------------------------------------------------
    " [ zchee/deoplete-clang ]                                                     {{{
    "
"    if dein#tap('deoplete-clang')
    "    let g:deoplete#sources#clang#libclang_path = '/usr/lib/x86_64-linux-gnu/libclang-11.so.1'
    "    let g:deoplete#sources#clang#clang_header = '/usr/lib/gcc/x86_64-linux-gnu/10/include'
        "    endif
    " }}}
    " -------------------------------------------------------------------------
    " [ xolox/vim-lua-ftplugin ]                                                     {{{
"    if dein#tap('vim-lua-ftplugin')
        let g:lua_check_syntax = 0
        let g:lua_complete_omni = 1
        let g:lua_complete_dynamic = 0
        let g:lua_define_completion_mappings = 0
"    endif
    " }}}
    " -------------------------------------------------------------------------
    " [ dhananjaylatkar/cscope_maps.nvim ]                                                     {{{
        lua require("cscope_maps").setup({})
    " }}}
    "
    " -------------------------------------------------------------------------
    " [ mark.vim ]                                                          {{{
    "
"    if dein#tap('mark.vim')
        function! s:DefaultHighlightings()
            highlight def MarkWord1  ctermbg=9   ctermfg=Black  guibg=#8CCBEA   guifg=Black
            highlight def MarkWord2  ctermbg=10  ctermfg=Black  guibg=#A4E57E   guifg=Black
            highlight def MarkWord3  ctermbg=11  ctermfg=Black  guibg=#FFDB72   guifg=Black
            highlight def MarkWord4  ctermbg=12  ctermfg=Black  guibg=#FF7272   guifg=Black
            highlight def MarkWord5  ctermbg=13  ctermfg=Black  guibg=#FFB3FF   guifg=Black
            highlight def MarkWord6  ctermbg=14  ctermfg=Black  guibg=#9999FF   guifg=Black
            highlight def MarkWord7  ctermbg=15  ctermfg=Black  guibg=#9999FF   guifg=Black
            highlight def MarkWord8  ctermbg=178 ctermfg=Black  guibg=#9999FF   guifg=Black
            highlight def MarkWord9  ctermbg=105 ctermfg=Black  guibg=#9999FF   guifg=Black
            highlight def MarkWord10 ctermbg=50  ctermfg=Black  guibg=#9999FF   guifg=Black
        endfunction
        call s:DefaultHighlightings()
        autocmd ColorScheme * call <SID>DefaultHighlightings()
        " let g:mwAutoLoadMarks = 1
"    endif
    " }}}
    " -------------------------------------------------------------------------
    " [ vim-racer ]                                                          {{{
    " augroup Racer
    "     autocmd!
    "     autocmd FileType rust nmap <buffer> gd         <Plug>(rust-def)
    "     autocmd FileType rust nmap <buffer> gs         <Plug>(rust-def-split)
    "     autocmd FileType rust nmap <buffer> gx         <Plug>(rust-def-vertical)
    "     autocmd FileType rust nmap <buffer> gt         <Plug>(rust-def-tab)
    "     autocmd FileType rust nmap <buffer> <leader>gd <Plug>(rust-doc)
    "     autocmd FileType rust nmap <buffer> <leader>gD <Plug>(rust-doc-tab)
    " augroup END
    " }}}
    " -------------------------------------------------------------------------
    " [ vim-lsp ]                                                          {{{
    "if executable('pylsp')
    "    " pip install python-lsp-server
    "    au User lsp_setup call lsp#register_server({
    "        \ 'name': 'pylsp',
    "        \ 'cmd': {server_info->['pylsp']},
    "        \ 'allowlist': ['python'],
    "        \ })
    "endif

    "function! s:on_lsp_buffer_enabled() abort
    "    setlocal omnifunc=lsp#complete
    "    setlocal signcolumn=yes
    "    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    "    nmap <buffer> gd <plug>(lsp-definition)
    "    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    "    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    "    nmap <buffer> gr <plug>(lsp-references)
    "    nmap <buffer> gi <plug>(lsp-implementation)
    "    nmap <buffer> gt <plug>(lsp-type-definition)
    "    nmap <buffer> <leader>rn <plug>(lsp-rename)
    "    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    "    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    "    nmap <buffer> K <plug>(lsp-hover)
    "    " nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    "    " nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    "    let g:lsp_format_sync_timeout = 1000
    "    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    "    " refer to doc to add more commands
    "endfunction

    "augroup lsp_install
    "    au!
    "    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    "    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
    "augroup END

    " let g:lsp_log_verbose = 1
    " let g:lsp_log_file = expand('~/vim-lsp.log')
    " }}}
    " -------------------------------------------------------------------------
    " [ rust.vim ]                                                          {{{
    let g:rustfmt_autosave = 1
    let g:rust_clip_command = 'xclip -selection clipboard'
    " }}}
    " -------------------------------------------------------------------------
    " [ asyncomplete.vim ]                                                          {{{
    " https://github.com/keremc/asyncomplete-racer.vim
    " https://github.com/keremc/asyncomplete-clang.vim
    "autocmd User asyncomplete_setup call asyncomplete#register_source(
    "\ asyncomplete#sources#racer#get_source_options())
    " }}}
    " -------------------------------------------------------------------------
    " [ vim-go   ]                                                          {{{
        let g:go_def_mode = "guru"
        let g:go_autodetect_gopath = 1
        set completeopt+=noselect
"        call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })
    " }}}
    " -------------------------------------------------------------------------
    " [ supertab ]                                                          {{{
"        let g:SuperTabDefaultCompletionType = '<C-n>'
    " }}}

    " -------------------------------------------------------------------------
    " [ quickrun/ale ]                                                          {{{
    ""
    "    let g:quickrun_config = {}
    "    let g:quickrun_config['cpp/g++'] = {
    "        \ 'cmdopt': '-std=c++20',
    "        \ 'type': 'cpp/g++'
    "        \ }
    "    let g:quickrun_config['cpp'] = {'type': 'cpp/g++'}
    " }}}
    "
    " -------------------------------------------------------------------------
    " [ ALE ]                                                              {{{
    "
    "let g:ale_completion_enabled = 1
    "let g:ale_completion_trigger = '.'
    "let g:ale_completion_trigger_length = 1
    "let g:ale_completion_trigger_characters = '.'
    "let g:ale_lint_on_enter = 1
    "let g:ale_lint_on_save = 1
    "let g:ale_lint_on_text_changed = 'always'
    "let g:ale_set_highlights = 1
    "let g:ale_set_signs = 1
    "let g:ale_fix_on_save = 1
    "let g:ale_python_flake8_options = '--ignore=E501'
    "let g:ale_sign_error = '>>'
    "let g:ale_sign_warning = '--'
    "let g:ale_sign_info = '=='
    "let g:ale_sign_style_error = '>>'
    "let g:ale_sign_style_warning = '--'
    "let g:ale_sign_style_info = '=='
    "let g:ale_echo_msg_error_str = 'E'
    "let g:ale_echo_msg_warning_str = 'W'
    "let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
    "let g:ale_cpp_cc_options = '-std=c++17 -Wall'
    "let g:ale_cpp_clangd_options = '-std=c++17'
    "let g:ale_fixers = {
    "    \   'python': ['black', 'autoimport'],
    "    \   'cpp': ['clang-format'],
    "    \   'c': ['clang-format'],
    "    \   'sh': ['shfmt'],
    "    \   'go': ['gofmt', 'goimports'],
    "    \   'rust': ['rustfmt'],
    "    \   'lua': ['stylua'],
    "    \}
    "    " \   'vim': ['vint'],
    "  " \   'dart': ['dartfmt'],
    "  " \   'javascript': ['prettier'],
    "  " \   'typescript': ['prettier'],
    "  " \   'html': ['prettier'],
    "  " \   'css': ['prettier'],
    "  " \   'json': ['prettier'],
    "  " \   'yaml': ['prettier'],
    "  " \   'markdown': ['prettier'],
    "let g:ale_linters = {
    "            \   'python': [],
    "            \}
    "" let g:ale_linters = {
    "            " \   'python': ['pylint',],
    "            " \   'cpp': ['clang-tidy'],
    "            " \   'c': ['clang-tidy'],
    "            " \   'javascript': ['eslint'],
    "            " \   'typescript': ['eslint'],
    "            " \   'html': ['tidy'],
    "            " \   'css': ['stylelint'],
    "            " \   'json': ['jsonlint'],
    "            " \   'yaml': ['yamllint'],
    "            " \   'markdown': ['markdownlint'],
    "            " \   'sh': ['shellcheck'],
    "            " \   'vim': ['vint'],
    "            " \   'go': ['golangci-lint'],
    "            " \   'rust': ['rustc'],
    "            " \   'lua': ['luacheck'],
    "            " \}
    "set omnifunc=ale#completion#OmniFunc
    "set completeopt=menuone,longest,noinsert,noselect
    " }}}
    "
    " -------------------------------------------------------------------------
    " [ denops-shared-server ]                                                              {{{
"        let g:denops_server_addr = '127.0.0.1:32123'
    "
    " -------------------------------------------------------------------------
    " [ LocalVimRC ]                                                              {{{
    "
    let g:localvimrc_enable = 1
    let g:localvimrc_debug = 0
    let g:localvimrc_name = [ '.lvimrc' ]
    " }}}
    " -------------------------------------------------------------------------
    " [ OmniCppComplete ]                                                  {{{
    "
    "augroup MyAutoCmd
    "    autocmd FileType hs setlocal omnifunc=necoghc#omnifunc
    "    " setlocal omnifunc=necoghc#omnifunc
    "    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    "    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    "    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    "    autocmd FileType js setlocal omnifunc=javascriptcomplete#CompleteJS
    "    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    "    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    "    autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
    "    autocmd FileType java setlocal omnifunc=eclim#java#complete#CodeComplete
    "    autocmd FileType go setlocal omnifunc=go#complete#Complete
    "augroup END

    "" highlight   clear
    "highlight   Pmenu         ctermfg=0 ctermbg=2
    "highlight   PmenuSel      ctermfg=0 ctermbg=7
    "highlight   PmenuSbar     ctermfg=7 ctermbg=0
    "highlight   PmenuThumb    ctermfg=0 ctermbg=7
    "" }}}

" [ Plugin configuration ]                                                  }}}
" =============================================================================

