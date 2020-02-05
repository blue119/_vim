" =============================================================================
" [ Plugin configuration ]                                  {{{
"
    " -------------------------------------------------------------------------
    " [ cs-mgmt.vim ]                                                      {{{
    "
    if dein#tap('cs-mgmt.vim')
        " let g:CsMgmtDebugEnable = 1
        let g:CsMgmtCscopeEnable = 1
        let g:CsMgmtCtagsEnable = 1
        let g:CsMgmtReAttach = 1
    endif
    " }}}
    "
    " -------------------------------------------------------------------------
    " [ cscope ]                                                           {{{
    "
        " put result into QFix Window{{{
        "
        if v:version >= 700 && has("cscope")
            function! CSCOPE_QuickFixToogle()
                if exists("g:__cscopequickfix")
                    set cscopequickfix&
                    unmap <C-t>
                    unlet g:__cscopequickfix
                else
                    " cscope search resule save into quickfix
                    set cscopequickfix=c-,d-,e-,g-,i-,s-,t-
                    " Ctrl-t remapping for cscope with quickfix
                    nmap <C-t> :colder<CR>:cc<CR>
                    let g:__cscopequickfix = bufnr("$")
                endif
            endfunction

            nmap <Leader>cq :call CSCOPE_QuickFixToogle()<CR>
        endif
        " }}}
        "
    " }}}
    "
    " -------------------------------------------------------------------------
    " [ Auto Commplete Pop: ACP ]                                           {{{
    "
    " nnoremap <Leader>af :AcpDisable<CR>
    " nnoremap <Leader>an :AcpEnable<CR>
    " let g:acp_behaviorSnipmateLength = 1
    " let g:acp_enableAtStartup = 0
    " }}}
    "
    " -------------------------------------------------------------------------
    " [ UltiSnips ]                                           {{{
    "
    if dein#tap('ultisnips')
        let g:UltiSnipsExpandTrigger="<tab>"
        let g:UltiSnipsJumpForwardTrigger="<tab>"
        let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
    endif
    " }}}
    "
    " -------------------------------------------------------------------------
    " [ git-fugitive ]                                                {{{
    "
    if dein#tap('vim-fugitive')
        autocmd FileType git :setlocal foldlevel=99
        " let g:Gitv_OpenHorizontal = 1
        let g:Gitv_TruncateCommitSubjects = 1
        let g:Gitv_DoNotMapCtrlKey = 0
        " highlight diffAdded guifg=#00bf00
        " highlight diffRemoved guifg=#bf0000
    endif
    " }}}
    " -------------------------------------------------------------------------
    " [ Ack ]                                                {{{
    "
    "if executable("ag")
    "    let g:ackprg = 'ag --nogroup --nocolor --column'
    "endif

    "" nnoremap <silent> <leader>a/ :Ack<CR><C-R><C-W>
    "nnoremap <silent> <leader>a/ :Ack<CR>
    " }}}
    "
    " -------------------------------------------------------------------------
    " [ EnhancedCommentify ]                                                {{{
    "
    if dein#tap('EnhCommentify.vim')
        let g:EnhCommentifyRespectIndent = 'Yes'
        let g:EnhCommentifyPretty = 'Yes'
        let g:EnhCommentifyMultiPartBlocks = 'Yes'
        let g:EnhCommentifyAlignRight = 'Yes'
        " let g:EnhCommentify = 'Yes'
    endif
    " }}}
    "
    " -------------------------------------------------------------------------
    " [ bufExplorer plugin ]                                                {{{
    "
    "let g:bufExplorerDefaultHelp = 0
    "let g:bufExplorerShowRelativePath = 1
    "let g:bufExplorerSortBy = "fullpath"
    "nnoremap <leader>o :BufExplorer<cr>
    " }}}
    "
    " -------------------------------------------------------------------------
    " [ CtrlP ]                                                             {{{
    "
    " let g:ctrlp_working_path_mode = 'ra'
    " let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
    " let g:ctrlp_custom_ignore = {
        " \ 'dir':  '\v[\/]\.(git|hg|svn)$',
        " \ 'file': '\v\.(exe|so|dll)$',
        " \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
        " \ }
    " let g:ctrlp_user_command = 'find %s -type f'
    " }}}
    "
    " -------------------------------------------------------------------------
    " [ unite ]                                                             {{{
    " https://github.com/Shougo/shougo-s-github/blob/master/vim/rc/plugins/denite.rc.vim
    " Define mappings

    if dein#tap('denite.nvim')
        autocmd FileType denite call s:denite_my_settings()
        function! s:denite_my_settings() abort
            nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
            nnoremap <silent><buffer><expr> d denite#do_map('do_action', 'delete')
            nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
            nnoremap <silent><buffer><expr> q denite#do_map('quit')
            nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
            nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
        endfunction

	    autocmd FileType denite-filter call s:denite_filter_my_settings()
	    function! s:denite_filter_my_settings() abort
	        imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
	    endfunction

        if executable('rg')
            call denite#custom#var('file/rec', 'command'        , ['rg', '--files', '--glob', '!.git'])
            " call denite#custom#var('grep'    , 'command'        , ['rg', '--no-ignore', '--threads', '1'])
            call denite#custom#var('grep'    , 'command'        , ['rg', '--threads', '1'])
            call denite#custom#var('grep'    , 'recursive_opts' , [])
            call denite#custom#var('grep'    , 'final_opts'     , [])
            call denite#custom#var('grep'    , 'separator'      , ['--'])
            call denite#custom#var('grep'    , 'default_opts'   , ['-i', '--vimgrep', '--no-heading'])
        " else
            " call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
        endif


        call denite#custom#source('file/old',     'matchers', ['matcher/fuzzy', 'matcher/project_files'])
        call denite#custom#source('file/mru', 'matchers', ['matcher/fuzzy', 'matcher_project_files'])
        call denite#custom#source('tag'     ,     'matchers', ['matcher/substring'])

        if has('nvim')
            " call denite#custom#source('file/rec', 'matchers', ['matcher/fruzzy'])
            call denite#custom#source('file/rec', 'matchers', ['matcher/cpsm'])
        endif

        call denite#custom#source('file/old,ghq', 'converters',  ['converter/relative_word', 'converter/relative_abbr'])

        " Change sorters.
        call denite#custom#source('file/rec', 'sorters', ['sorter/sublime'])


        "For python script scantree.py (works if python 3.5+ in path)
        "Read bellow on this file to learn more about scantree.py
        " call denite#custom#var('file_rec', 'command', ['scantree.py'])

        " Change mappings.
        " call denite#custom#map('insert', '<C-r>'     , '<denite:toggle_matchers:matcher_substring>', 'noremap')
        " call denite#custom#map('insert', '<C-s>'     , '<denite:toggle_sorters:sorter_reverse>'    , 'noremap')
        " call denite#custom#map('insert', '<C-j>'     , '<denite:move_to_next_line>'                , 'noremap' )
        " call denite#custom#map('insert', '<C-k>'     , '<denite:move_to_previous_line>'            , 'noremap' )
        " call denite#custom#map('insert', '<Down>'    , '<denite:move_to_next_line>'                , 'noremap' )
        " call denite#custom#map('insert', '<Up>'      , '<denite:move_to_previous_line>'            , 'noremap' )
        " call denite#custom#map('insert', '<PageDown>', '<denite:scroll_page_forwards>'             , 'noremap' )
        " call denite#custom#map('insert', '<PageUp>'  , '<denite:scroll_page_backwards>'            , 'noremap' )
        " call denite#custom#map('insert', ';'         , 'vimrc#sticky_func()'                       , 'expr')

        " call denite#custom#map('normal', '<PageDown>',  '<denite:scroll_page_forwards>' , 'noremap' )
        " call denite#custom#map('normal', '<PageUp>'  ,  '<denite:scroll_page_backwards>', 'noremap' )
        " call denite#custom#map('normal', 'r'         ,  '<denite:do_action:quickfix>'   , 'noremap')

        " Define alias
        call denite#custom#alias('source', 'file/rec/git', 'file/rec')
        call denite#custom#var('file/rec/git', 'command', ['git', 'ls-files', '-co', '--exclude-standard'])

        " call denite#custom#alias('source', 'file_rec/py', 'file_rec')
        " call denite#custom#var('file_rec/py', 'command', ['scantree.py'])

        " Change default prompt
        call denite#custom#option('default', {
            \ 'mode' : 'insert',
            \ 'prompt': '>',
            \ 'empty': 0,
            \ 'auto_resize': 1,
            \ 'auto_resume': 1,
            \ 'short_source_names': v:true
            \ })

        " call denite#custom#option('default', 'prompt', '>')

        " denite option
        " let s:denite_options = {
        "       \ 'default' : {
        "       \ 'winheight' : 25,
        "       \ 'mode' : 'insert',
        "       \ 'quit' : 'true',
        "       \ 'highlight_matched_char' : 'MoreMsg',
        "       \ 'highlight_matched_range' : 'MoreMsg',
        "       \ 'direction': 'rightbelow',
        "       \ 'statusline' : has('patch-7.4.1154') ? v:false : 0,
        "       \ 'prompt' : '➭',
        "       \ }}

        " Add custom menus
        let s:menus = {}

        let s:menus.zsh = { 'description': 'Edit your import zsh configuration'  }
        let s:menus.zsh.file_candidates = [
            \ ['zshrc', '~/.config/zsh/.zshrc'],
            \ ['zshenv', '~/.zshenv'],
            \ ]

        let s:menus.my_commands = { 'description': 'Example commands' }
        let s:menus.my_commands.command_candidates = [
            \ ['Split the window', 'vnew'],
            \ ['Open zsh menu', 'Denite menu:zsh'],
            \ ]

        let s:menus.vim = {
            \ 'description': 'Vim',
            \ }
        let s:menus.vim.file_candidates = [
            \ ['    > Edit configuation file (init.vim)', '~/.vimrc']
            \ ]

        call denite#custom#var('menu', 'menus', s:menus)


        " function! s:profile(opts) abort
        "   for fname in keys(a:opts)
        "     for dopt in keys(a:opts[fname])
        "       call denite#custom#option(fname, dopt, a:opts[fname][dopt])
        "     endfor
        "   endfor
        " endfunction

        " call s:profile(s:denite_options)

        " Change ignore_globs
        call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
              \ [ '.git/', '.ropeproject/', '__pycache__/',
              \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])

        " Custom action
        call denite#custom#action('file', 'test' , {context -> execute('let g:foo = 1')})
        call denite#custom#action('file', 'test2', {context -> denite#do_action(context, 'open', context['targets'])})


        " HotKeys
        nnoremap [denite] <Nop>
        nmap <Leader>u [denite]
        "" File searching like ctrlp.vim
        nnoremap <C-p> :Denite -buffer-name=files buffer -input= file/rec<CR>
        nnoremap <silent> [denite]g  :<C-u>Denite grep:. -buffer-name=search-buffer<CR>
        nnoremap <silent> [denite]gc :<C-u>DeniteCursorWord grep:. -buffer-name=search-buffer<CR>

        nnoremap <silent> [denite]j  :<C-u>Denite -resume -cursor-pos=+1 -immediately -buffer-name=search-buffer<CR>
        nnoremap <silent> [denite]k  :<C-u>Denite -resume -cursor-pos=-1 -immediately -buffer-name=search-buffer<CR>

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
    " [ unite ]                                                             {{{
    " http://goo.gl/Uq95Wj #Unite.vim, the Plugin You Didn't Know You Need
    "

    "call unite#filters#matcher_default#use(['matcher_fuzzy'])
    "call unite#filters#sorter_default#use(['sorter_rank'])
    "" call unite#set_profile('files', 'smartcase', 1)
    "let g:unite_enable_start_insert        = 0
    "let g:unite_enable_ignore_case         = 1
    "let g:unite_enable_smart_case          = 1
    "let g:unite_source_rec_max_cache_files = 5000
    "" let g:unite_source_rec_async_command   = ['ag', '--nocolor', '--nogroup', --'--hidden', '-g', '']
    "let g:unite_source_rec_async_command   =  'ag --nocolor --nogroup --ignore ".o" --ignore ".cmd" --hidden -g ""'
    "let g:unite_data_directory             = '~/.vim/.cache'
    "let g:unite_prompt                     = '» '

    "" if executable('ag')
    "    " let g:unite_source_grep_command='ag'
    "    " let g:unite_source_grep_default_opts='--nocolor --nogroup --column'
    "    " let g:unite_source_grep_recursive_opt=''
    "" elseif executable('ack-grep')
    "    " let g:unite_source_grep_command='ack-grep'
    "    " let g:unite_source_grep_default_opts='--no-group --no-color'
    "    " let g:unite_source_grep_recursive_opt=''
    "" else
    "    " let g:unite_source_grep_default_opts = '-iRHn'
    "" endif
    "    let g:unite_source_grep_default_opts = '-iRHn'
    "let g:unite_source_grep_max_candidates = 200

    "function! s:unite_settings()
    "    imap <buffer> <C-j>   <Plug>(unite_select_next_line)
    "    imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
    "endfunction
    "autocmd FileType unite call s:unite_settings()
    "nnoremap [unite] <Nop>
    "nmap <Leader>u [unite]

    "" File searching like ctrlp.vim
    "" https://github.com/Shougo/unite.vim/issues/705
    "" nnoremap <C-p> :Unite -start-insert file_rec/async buffer<CR>
    "" nnoremap <C-P> :Unite -buffer-name=files -start-insert buffer -input= -resume file_rec:!<cr>
    "" nnoremap <C-P> :Unite -buffer-name=files -start-insert buffer -input= -resume file_rec<cr>
    "nnoremap <C-P> :Unite -buffer-name=files -start-insert buffer -input= file_rec/async<cr>


    "" shortcup
    "nnoremap <silent> [unite]m :Unite -start-insert mapping<CR>

    "" Execute help.
    "nnoremap <silent> [unite]h :Unite -start-insert help<CR>

    "" outline
    "nnoremap <leader>uo :Unite outline<CR>

    "" Content searching like ack.vim
    "nnoremap <silent> [unite]/ :Unite vimgrep:**<cr>
    "nnoremap <silent> [unite]g :Unite grep:. -buffer-name=search-buffer`<cr>
    "" カーソル位置の単語をgrep検索
    "nnoremap <silent> [unite]gc :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W><CR>

    "" grep検索結果の再呼出
    "nnoremap <silent> [unite]gr :UniteResume<cr>
    "nnoremap <silent> [unite]gn :UniteNext<cr>
    "nnoremap <silent> [unite]gp :UnitePrevious<cr>

    "" Yank history like yankring
    "let g:unite_source_history_yank_enable = 1
    "nnoremap <silent> [unite]y :Unite history/yank<CR>

    "" Buffer switching like LustyJuggler
    "nnoremap <silent> [unite]b :Unite -quick-match buffer<cr>
    "" nnoremap <silent> [unite]b :Unite buffer<CR>

    "nnoremap <silent> [unite]f :UniteWithBufferDir -buffer-name=files file<CR>
    "nnoremap <silent> [unite]r :Unite file_mru<CR>
    "nnoremap <silent> [unite]y :Unite -buffer-name=register register<CR>
    "nnoremap <silent> [unite]a :Unite UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>


    "let g:unite_source_menu_menus = {}
    "let g:unite_source_menu_menus.git = {
    "    \ 'description' : '            gestionar repositorios git
    "        \                            ⌘ [espacio]g',
    "    \}
    "let g:unite_source_menu_menus.git.command_candidates = [
    "    \['▷ tig                                                        ⌘ ,gt',
    "        \'normal ,gt'],
    "    \['▷ git status       (Fugitive)                                ⌘ ,gs',
    "        \'Gstatus'],
    "    \['▷ git diff         (Fugitive)                                ⌘ ,gd',
    "        \'Gdiff'],
    "    \['▷ git commit       (Fugitive)                                ⌘ ,gc',
    "        \'Gcommit'],
    "    \['▷ git log          (Fugitive)                                ⌘ ,gl',
    "        \'exe "silent Glog | Unite quickfix"'],
    "    \['▷ git blame        (Fugitive)                                ⌘ ,gb',
    "        \'Gblame'],
    "    \['▷ git stage        (Fugitive)                                ⌘ ,gw',
    "        \'Gwrite'],
    "    \['▷ git checkout     (Fugitive)                                ⌘ ,go',
    "        \'Gread'],
    "    \['▷ git rm           (Fugitive)                                ⌘ ,gr',
    "        \'Gremove'],
    "    \['▷ git mv           (Fugitive)                                ⌘ ,gm',
    "        \'exe "Gmove " input("destino: ")'],
    "    \['▷ git push         (Fugitive, salida por buffer)             ⌘ ,gp',
    "        \'Git! push'],
    "    \['▷ git pull         (Fugitive, salida por buffer)             ⌘ ,gP',
    "        \'Git! pull'],
    "    \['▷ git prompt       (Fugitive, salida por buffer)             ⌘ ,gi',
    "        \'exe "Git! " input("comando git: ")'],
    "    \['▷ git cd           (Fugitive)',
    "        \'Gcd'],
    "    \]

    "nnoremap <silent>[unite]mg :Unite -silent -start-insert menu:git<CR>

    endif
    " }}}
    "
    " -------------------------------------------------------------------------
    " [ vimfiler ]                                                         {{{
    "
    "let g:vimfiler_as_default_explorer = 1
    "let g:vimfiler_enable_auto_cd = 1
    "let g:vimfiler_split_rule = "topleft"
    "let g:vimfiler_split_action = 'right'
    " }}}
    "
    " -------------------------------------------------------------------------
    " [ yankring ]                                                         {{{
    "
    "let g:yankring_history_file = '.yankring_history'
    " }}}
    "
    " -------------------------------------------------------------------------
    " [ vim-indent-guides ]                                                {{{
    "
    if dein#tap('vim-indent-guides')
        let g:indent_guides_enable_on_vim_startup = 1
        let g:indent_guides_auto_colors = 0
        let g:indent_guides_start_level = 2
        let g:indent_guides_guide_size = 1
        let g:indent_guides_color_change_percent = 10
        hi IndentGuidesOdd  ctermbg=gray
        hi IndentGuidesEven ctermbg=darkgrey
    endif
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
    " [ EasyGrep ]                                                         {{{
    "
    "Grep 'pattern' in the indicate range (need EasyGrep.vim plugin)
    "map <F3> <ESC>\vv
    "let g:EasyGrepRecursive = 1
    "let g:EasyGrepIgnoreCase= 0
    "let g:EasyGrepJumpToMatch= 1
    " }}}
    "
    " -------------------------------------------------------------------------
    " [ Tag List ]                                                         {{{
    "
    if dein#tap('taglist.vim')
        " Split to the right side of the screen
        let g:Tlist_Use_Right_Window = 1
        " Sort by the order
        let g:Tlist_Sort_Type = "order"
        " If you are the last, kill yourself
        let g:Tlist_Exit_OnlyWindow = 1
        " Do not show folding tree
        let g:Tlist_Enable_Fold_Column = 0
        " Always display one file tags
        let g:Tlist_Show_One_File = 1

        let g:Tlist_WinWidth = 35
    endif
    " }}}
    "
    " -------------------------------------------------------------------------
    " [ DoxygenToolkit.vim ]                                               {{{
    "
    if dein#tap('DoxygenToolkit.vim')
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
    endif
    " }}}
    "
    " -------------------------------------------------------------------------
    " [ tagbar ]                                                     {{{
    "
    if dein#tap('tagbar')
    " let g:tagbar_type_go = {
                " \ 'ctagstype' : 'go',
                " \ 'kinds'     : [
                " \ 'p:package',
                " \ 'i:imports:1',
                " \ 'c:constants',
                " \ 'v:variables',
                " \ 't:types',
                " \ 'n:interfaces',
                " \ 'w:fields',
                " \ 'e:embedded',
                " \ 'm:methods',
                " \ 'r:constructor',
                " \ 'f:functions'
                " \ ],
                " \ 'sro' : '.',
                " \ 'kind2scope' : {
                " \ 't' : 'ctype',
                " \ 'n' : 'ntype'
                " \ },
                " \ 'scope2kind' : {
                " \ 'ctype' : 't',
                " \ 'ntype' : 'n'
                " \ },
                " \ 'ctagsbin'  : 'gotags',
                " \ 'ctagsargs' : '-sort -silent'
                " \ }

        let g:tagbar_type_typescript = {
          \ 'ctagstype': 'typescript',
          \ 'kinds': [
            \ 'c:classes',
            \ 'n:modules',
            \ 'f:functions',
            \ 'v:variables',
            \ 'v:varlambdas',
            \ 'm:members',
            \ 'i:interfaces',
            \ 'e:enums',
          \ ]
        \ }
        let g:tagbar_autofocus = 1
    endif
    " }}}
    "
    " -------------------------------------------------------------------------
    " [ LanguageTool ]                                                     {{{
    "
    " let g:languagetool_jar=$HOME . '/iLab/edit/languagetool/dist/LanguageTool.jar'
    " }}}
    "
    " -------------------------------------------------------------------------
    " [ powerline ]                                                        {{{
    " [ airline ]
    "
    if dein#tap('vim-airline')
        " let g:airline_theme='wombat'
        " let g:airline_enable_branch=1
        let g:airline#extensions#branch#enabled=1
        let g:airline#extensions#syntastic#enabled = 1
        let g:airline_detect_paste=1

        if dein#tap('vim-airline-themes')
            " let g:airline_theme='tomorrow'
            let g:airline_theme='molokai'
            let g:airline_powerline_fonts = 1
        endif

        if ! has('gui_running')
            set ttimeoutlen=10
            augroup MyAutoCmd
                au InsertEnter * set timeoutlen=0
                au InsertLeave * set timeoutlen=1000
            augroup END
        endif

        " " Always show statusline
        " set laststatus=2

        " " Hide the default mode text (e.g. -- INSERT -- below the statusline)
        " set noshowmode

        " unicode symbols
        " let g:airline_symbols = {}
        " " let g:airline_left_sep = '»'
        " " let g:airline_left_sep = '▶'
        " " let g:airline_right_sep = '«'
        " " let g:airline_right_sep = '◀'
        " " let g:airline_linecolumn_prefix = '␊ '
        " " let g:airline_linecolumn_prefix = '¶ '
        " " let g:airline#extensions#paste#symbol = 'Þ'
        " " let g:airline#extensions#paste#symbol = '∥'
        " let g:airline_symbols.linenr = '␤ '
        " let g:airline#extensions#branch#symbol = '⎇ '
        " let g:airline#extensions#whitespace#symbol = 'Ξ'
        " let g:airline_symbols.space = ' '

        " powerline symbols
        let g:airline_left_sep = ''
        let g:airline_left_alt_sep = ''
        let g:airline_right_sep = ''
        let g:airline_right_alt_sep = ''
        let g:airline#extensions#branch#symbol = ' '
        let g:airline#extensions#readonly#symbol = ''
        let g:airline_linecolumn_prefix = ' '
        let g:airline#extensions#paste#symbol = 'ρ'
    endif
    " }}}

    " -------------------------------------------------------------------------
    " [ vim-jsbeautify ]                                                    {{{
    "
    if dein#tap('vim-jsbeautify')
        autocmd FileType javascript noremap <buffer> <c-f> :call JsBeautify()<cr>
        autocmd FileType js         noremap <buffer> <c-f> :call JsBeautify()<cr>
        autocmd FileType json       noremap <buffer> <c-f> :call JsonBeautify()<cr>
        autocmd FileType jsx        noremap <buffer> <c-f> :call JsxBeautify()<cr>
        autocmd FileType html       noremap <buffer> <c-f> :call HtmlBeautify()<cr>
        autocmd FileType css        noremap <buffer> <c-f> :call CSSBeautify()<cr>

        "Example of binding a function for js, html and css in visual mode on
        autocmd FileType javascript vnoremap <buffer> <c-f> :call RangeJsBeautify()<cr>
        autocmd FileType js         vnoremap <buffer> <c-f> :call RangeJsBeautify()<cr>
        autocmd FileType json       vnoremap <buffer> <c-f> :call RangeJsonBeautify()<cr>
        autocmd FileType jsx        vnoremap <buffer> <c-f> :call RangeJsxBeautify()<cr>
        autocmd FileType html       vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
        autocmd FileType css        vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>
    endif
    " }}}

    " -------------------------------------------------------------------------
    " [ vim-polyglot ]                                                    {{{
    "
    if dein#tap('vim-polyglot')
        let g:polyglot_disabled = ['python']
    endif
    " }}}

    " -------------------------------------------------------------------------
    " [ editorconfig-vim ]                                                  {{{
    "
    if dein#tap('editorconfig-vim')
        " Excluded patterns.
        let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

        function! _editconfigFiletypeHook(config)
            if has_key(a:config, 'vim_filetype')
                let &filetype = a:config['vim_filetype']
            endif

            return 0   " Return 0 to show no error happened
         endfunction

         call editorconfig#AddNewHook(function('_editconfigFiletypeHook'))
    endif
    " }}}

    " -------------------------------------------------------------------------
    " [ rooter ]                                                            {{{
    "
    if dein#tap('vim-rooter')
        " To stop vim-rooter changing directory automatically
        let g:rooter_manual_only = 1

        " :lcd instead of :cd
        " let g:rooter_use_lcd = 1

        " own directory and file patterns like this:
        " let g:rooter_patterns = ['Rakefile', '.git/']
    endif
    " }}}

    " -------------------------------------------------------------------------
    " [ neocomplete ]                                                            {{{
    " https://github.com/Shougo/neocomplete.vim
    " let g:ycm_filetype_blacklist = { 'vimshell': 1 }
    " autocmd FileType vimshell NeoCompleteUnlock
    "
    " Disable AutoComplPop.
    " let g:acp_enableAtStartup = 0
    " Use neocomplete.
    " let g:neocomplete#enable_at_startup = 1
    "" Use smartcase.
    "let g:neocomplete#enable_smart_case = 1
    "" Set minimum syntax keyword length.
    "let g:neocomplete#sources#syntax#min_keyword_length = 3
    " let g:neocomplete#lock_buffer_name_pattern = '\*'

    "" Define dictionary.
    " let g:neocomplete#sources#dictionary#dictionaries = {
       " \ 'default' : '',
       " \ 'vimshell' : $HOME.'/.vimshell_hist',
       " \ 'scheme' : $HOME.'/.gosh_completions'
       " \ }

    "" Define keyword.
    "if !exists('g:neocomplete#keyword_patterns')
    "    let g:neocomplete#keyword_patterns = {}
    "endif
    "let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    "" Plugin key-mappings.
    "inoremap <expr><C-g>     neocomplete#undo_completion()
    "inoremap <expr><C-l>     neocomplete#complete_common_string()

    "" Recommended key-mappings.
    "" <CR>: close popup and save indent.
    "inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    "function! s:my_cr_function()
    "  return neocomplete#close_popup() . "\<CR>"
    "  " For no inserting <CR> key.
    "  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
    "endfunction

    "" <TAB>: completion.
    "inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

    "" <C-h>, <BS>: close popup and delete backword char.
    "inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    "inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    "inoremap <expr><C-y>  neocomplete#close_popup()
    "inoremap <expr><C-e>  neocomplete#cancel_popup()

    "" Close popup by <Space>.
    ""inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

    "" For cursor moving in insert mode(Not recommended)
    ""inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
    ""inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
    ""inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
    ""inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"

    "" Or set this.
    ""let g:neocomplete#enable_cursor_hold_i = 1
    "" Or set this.
    ""let g:neocomplete#enable_insert_char_pre = 1

    "" AutoComplPop like behavior.
    ""let g:neocomplete#enable_auto_select = 1

    "" Shell like behavior(not recommended).
    ""set completeopt+=longest
    ""let g:neocomplete#enable_auto_select = 1
    ""let g:neocomplete#disable_auto_complete = 1
    ""inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

    "" Enable heavy omni completion.
    "if !exists('g:neocomplete#sources#omni#input_patterns')
    "  let g:neocomplete#sources#omni#input_patterns = {}
    "endif
    ""let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    ""let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    ""let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
    ""
    "" }}}

    " -------------------------------------------------------------------------
    " [ YouCompletMe.vim ]                                                          {{{
    "
    " refer: http://wiki.yangleo.me/2013/10/27/YouCompleteMe-installation-and-configurations.html

        "let g:ycm_global_ycm_extra_conf = '~/.vim/plugin/ycm_extra_conf.py'
        "" let g:ycm_global_ycm_extra_conf = '~/.vim/plugin/ycm_pppc.py'
        "" let g:ycm_extra_conf_globlist = ['~/.vim/plugin/*',]
        "" let g:ycm_key_invoke_completion = '<C-n>'
        "" let g:loaded_youcompleteme = 0

        "" Set it to 0 to ignore the confirmation of loading file
        "let g:ycm_confirm_extra_conf = 0
        "" Set to 1 if you installed plugin “syntastic”
        "" let g:syntastic_always_populate_loc_list = 1
        "" You can let YCM read the tags file. But the tags file must be create from the command “ctags –fileds=+l”.
        "" let g:ycm_collect_identifiers_from_tags_files = 1

        "let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
        "let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

        "let g:ycm_key_invoke_completion = '<C-o>'
    " }}}

    " -------------------------------------------------------------------------
    " [ deoplete.nvim ]                                                     {{{
    "
    if dein#tap('deoplete.nvim')
        let g:deoplete#enable_at_startup = 1
    endif
    " }}}
    "
    " [ xolox/vim-lua-ftplugin ]                                                     {{{
    "
    if dein#tap('vim-lua-ftplugin')
        let g:lua_check_syntax = 0
        let g:lua_complete_omni = 1
        let g:lua_complete_dynamic = 0
        let g:lua_define_completion_mappings = 0
    endif
    " }}}
    "
    " -------------------------------------------------------------------------
    " [ mark.vim ]                                                          {{{
    "
    if dein#tap('mark.vim')
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
    endif
    " }}}

    " -------------------------------------------------------------------------
    " [ vim-go   ]                                                          {{{
        let g:go_def_mode = 'guru'
        let g:go_autodetect_gopath = 1
    " }}}
    " -------------------------------------------------------------------------
    " [ lambdalisue/session.vim ]                                                          {{{
    " https://github.com/lambdalisue/session.vim
    if dein#tap('session.vim')
        let g:session_dir = '~/.cache/session.vim'
        " A directory path which all session files will be saved/searched

        let g:session#default_opener = 'edit'
        " Used when no {opener} is given to SessionList command

        let g:session#default_session = 'default'
        " Used when no {session} is given and v:this_session is empty (session has not been loaded)

        let g:session#default_mappings = 1
        " Set it to 0 if you don't need default mappings on session://list window.
        " Use the followings to define your custom mappings in that case:
        " [n] <Plug>(session-open)          Perform SessionOpen on a session under the cursor
        " [n] <Plug>(session-open-force)    Perform SessionOpen on a session under the cursor
        " [n] <Plug>(session-remove)        Perform SessionRemove on a session under the cursor
        " [v] <Plug>(session-remove)        Perform SessionRemove on sessions in the selection
        "
    endif
    " }}}
    "
    " -------------------------------------------------------------------------
    " [ supertab ]                                                          {{{
    "
    if dein#tap('supertab')
        let g:SuperTabDefaultCompletionType = '<C-n>'
        " let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
        " let g:SuperTabDefaultCompletionType = "context"
    endif
    " }}}

    "
    " -------------------------------------------------------------------------
    " [ OmniCppComplete ]                                                  {{{
    "
    " http://aufather.wordpress.com/2010/08/26/omni-completion-in-vim/
    set omnifunc=syntaxcomplete#Complete " override built-in C omnicomplete with C++ OmniCppComplete plugin
    " let OmniCpp_GlobalScopeSearch   = 1
    " let OmniCpp_DisplayMode         = 1
    " let OmniCpp_ShowScopeInAbbr     = 0 "do not show namespace in pop-up
    " let OmniCpp_ShowPrototypeInAbbr = 1 "show prototype in pop-up
    " let OmniCpp_ShowAccess          = 1 "show access in pop-up
    " let OmniCpp_SelectFirstItem     = 1 "select first item in pop-up
    " set completeopt=longest,menuone
    set completeopt=longest,menu

    augroup MyAutoCmd
        autocmd FileType hs setlocal omnifunc=necoghc#omnifunc
        " setlocal omnifunc=necoghc#omnifunc
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType js setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
        autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
        autocmd FileType java setlocal omnifunc=eclim#java#complete#CodeComplete
        autocmd FileType go setlocal omnifunc=go#complete#Complete
    augroup END

    " highlight   clear
    highlight   Pmenu         ctermfg=0 ctermbg=2
    highlight   PmenuSel      ctermfg=0 ctermbg=7
    highlight   PmenuSbar     ctermfg=7 ctermbg=0
    highlight   PmenuThumb    ctermfg=0 ctermbg=7
    " }}}

" [ Plugin configuration ]                                                  }}}
" =============================================================================

