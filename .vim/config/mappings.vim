" =============================================================================
" [ Key Mappings ]                                                   {{{
"
    " -------------------------------------------------------------------------
    " [ Function Key ]                                                {{{
    "
    " <F1>: Help
    map <F1> [unite]h

    " Like \":write\", but only write when the buffer has been modified
    "nmap <F2> :up<CR>
    "imap <F2> <Esc>:up<CR>a
    "nnoremap <F2>

    " Find match prev
    nnoremap <F3> :cp<CR>

    " Find match next
    nnoremap <F4> :cn<CR>

    "nnoremap <F5>
    "nnoremap <F6>

    " Toggle on/off paste mode
    nnoremap <F7> :set paste!<BAr>set paste?<CR>

    " search highlight switching
    " map <F8> :set hls!<BAR>set hls?<CR>
    "nnoremap <F8>

    "Visualize some special chars
    set listchars=tab:>-,trail:-,eol:$,nbsp:%,extends:>,precedes:<
    set showbreak=↪
    nnoremap <F9> :set list!<bar>set list?<CR>

    " p4 edit
    nnoremap <F10> :!p4 edit %<CR>

    "nnoremap <F11> Full Screen
    "nnoremap <F12>
    "
    " [ Function Key ]                                                  }}}

    " -------------------------------------------------------------------------
    " [ Leader Keys ]                                               {{{
    "
    " Chagne <Leader> (Default is \) to ","
	" let mapleader = ","
	" let g:mapleader = ","

    " Chagne <LocalLeader> to "\"
    " let maplocalleader = "\"
    " let g:maplocalleader = "\"

    " <Leader>1: only
    nnoremap <Leader>1 :only<CR>

    " <Leader>2: split
    nnoremap <Leader>2 :split<CR>

    " <Leader>3: vsplit
    nnoremap <Leader>3 :vsplit<CR>

    " <Leader>4-0: TODO
    " <Leader>-: TODO
    " <Leader>=: TODO
    "--------------------------------------------------------------------------
    " <Leader>q remap to QFix
    " <Leader>w Fast saving
    nnoremap <leader>w :w!<cr>

    " <Leader>e TODO
    " <Leader>r MarkRegex
    " <Leader>rwp RestoreWinPosn
    " <Leader>t TaskList
    " <Leader>t* for tag Operation
    " <Leader>y TODO
    " <Leader>u remap to unite
    " <Leader>i TODO
    " <Leader>o Remmap to bufExplorer
    " <Leader>oc Occur
    " <Leader>p: Copy the full path of the current file to the clipboard
    nnoremap <silent> <Leader>p :let @+=expand("%:p")<cr>:echo "Copied current file
        \ path '".expand("%:p")."' to clipboard"<cr>
    "--------------------------------------------------------------------------
    " <Leader>a for Auto Commplete Pop: ACP
    " <Leader>s remap to Spell Checking
    " <Leader>sb 48_beautify sourcebeautify.vim
    " <Leader>swp SaveWinPosn
    " <Leader>d remap to DiffSaved
    " <Leader>ds DrawItStop
    " <Leader>di DrawItStart
    " <Leader>f Remap to VimGrep
    " <Leader>ff Jsbeautify

    " <Leader>g TODO
    " <Leader>h for Edit(e) & Generate(g) help tags
    nnoremap <Leader>he :tabedit $HOME/.vim/doc/MyNote.txt <CR>
    nnoremap <Leader>hg :helptags $HOME/.vim/doc <CR>

    " <Leader>j TODO
    " <Leader>k TODO
    " <Leader>l TODO
    " <Leader>; TODO
    " <Leader>' TODO
    "--------------------------------------------------------------------------
    " <Leader>z TODO
    " <Leader>x
    " <Leader>c
    " <Leader>cs CsMgmt
    " <Leader>cq for cscopequickfix
    " <Leader>v TODO
    " <Leader>vs for View text file in two column
    ":<C-u>              " clear command line (if in visual mode)
    "let @z=&so          " save scrolloff in register z
    ":set so=0 noscb     " set scrolloff to 0 and clear scrollbind
    ":bo vs              " split window vertically, new window on right
    "Ljzt                " jump to bottom of window + 1, scroll to top
    ":setl scb           " setlocal scrollbind in right window
    "<C-w>p              " jump to previous window
    ":setl scb           " setlocal scrollbind in left window
    ":let &so=@z         " restore scrolloff
    noremap <silent> <Leader>vs :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>
    " <Leader>v* EasyGrep

    " <Leader>vv remap to EasyGrep
    " <Leader>b TODO
    " <Leader>bv bufexplorer.vim
    " <Leader>bs bufexplorer.vim
    " <Leader>be bufexplorer.vim

    " <Leader>n Remap to mark MarkClear
    " <Leader>nt Remap to NERDTree
    " <Leader>m MarkSet
    " <Leader>mo: :Moccur
    " <Leader>, TODO
    " <Leader>. TODO
    " <Leader>/ MarkSearchAnyNext
    "
    " [ Leader Keys ]                                                   }}}

    " -------------------------------------------------------------------------
    " [ Leader Keys + Shift]                                               {{{
    "
    " <Leader>~: TODO
    " <Leader>!: TODO
    " <Leader>@: TODO
    " <Leader>#: MarkSearchCurrentPrev
    " <Leader>$: TODO
    " <Leader>%: TODO
    " <Leader>^: TODO
    " <Leader>&: TODO
    " <Leader>*: MarkSearchCurrentNext
    " <Leader>(: TODO
    " <Leader>): TODO
    " <Leader>_: TODO
    " <Leader>+: TODO
    "--------------------------------------------------------------------------
    " <Leader>Q: TODO
    " <Leader>W: TODO
    " <Leader>E: TODO
    " <Leader>R: TODO
    " <Leader>T: TODO
    " <Leader>Y: TODO
    " <Leader>U: TODO
    " <Leader>I: TODO
    " <Leader>O: TODO
    " <Leader>P: TODO
    " <Leader>{: TODO
    " <Leader>}: TODO
    " <Leader>|: TODO
    "--------------------------------------------------------------------------
    " <Leader>A: TODO
    " <Leader>S: TODO
    " <Leader>D: TODO
    " <Leader>F: TODO
    " <Leader>G: TODO
    " <Leader>H: TODO
    " <Leader>J: TODO
    " <Leader>K: TODO
    " <Leader>L: TODO
    " <Leader>:: TODO
    " <Leader>": TODO
    "--------------------------------------------------------------------------
    " <Leader>Z: TODO
    " <Leader>X: TODO
    " <Leader>C: TODO
    " <Leader>V: TODO
    " <Leader>B: TODO
    " <Leader>N: TODO
    " <Leader>M: TODO
    " <Leader><: TODO
    " <Leader>>: TODO
    " <Leader>?: MarkSearchAnyPrev
    "
    " [ Leader Keys ]                                                   }}}

    " -------------------------------------------------------------------------
    " [ Normal Mode ]                                                   {{{
    "
    " `: cursor to the mark {a-zA-Z0-9}
    " 1~0: TODO
    " -: Remap to 'Window Operations'
    " =: Remap to 'Window Operations'
    " -----------------------------------------------------------------------------
    " q: record typed characters into named register {0-9a-zA-Z"} (uppercase to append)
    " w: cursor N words forward
    " e: cursor forward to the end of word N
    " r: replace N chars with {char}
    " t: cursor till before Nth occurrence of {char} to the right
    " y: yank Nmove text [into buffer x]
    " yy: yank N lines [into buffer x]
    " u: undo changes
    " i: insert text before the cursor N times
    " o: begin a new line below the cursor and insert text, repeat N times
    " p: put the text [from register x] after the cursor N times
    " [: square bracket command
    " ]: square bracket command
    " \: TODO
    " \c: show colorscheme name
    " \n: change to next colorscheme
    " \p: change to previous colorscheme
    " -----------------------------------------------------------------------------
    " a: append text after the cursor N times
    " s: (substitute) delete N characters [into buffer x] and start insert
    " addition another search work hls
    " map sa :exec "/\\(".getreg('/')."\\)\\\\|".expand("<cword>")<CR>

    " Add new keyword in search under cursor (*)
    " map a* :exec "/\\(".getreg('/')."\\)\\\\|".expand("<cword>")<CR>

    " d: delete Nmove text [into buffer x]
    " dd: delete N lines [into buffer x]
    " f: cursor to Nth occurrence of {char} to the right
    " g: extended commands
    " gx: NetrwBrowseX
    " h: cursor N chars to the left
    " j: cursor N lines downward
    " k: cursor N lines upward
    " l: cursor N chars to the right
    " ;: Remap to ':'
    " ': Go to word of make
    " -----------------------------------------------------------------------------
    " z: commands starting with 'z'
    " x: delete N characters under and after the cursor [into buffer x]
    " c: delete Nmove text [into buffer x] and start insert
    " cc: delete N lines [into buffer x] and start insert
    " v: start characterwise Visual mode
    " b: cursor N words backward
    " n: repeat the latest '/' or '?' N times
    " m: set mark {A-Za-z} at cursor position
    " ,: Remap to '<Leader>'
    " .: repeat last change with count replaced with N
    " /: search forward for the Nth occurrence of {pattern}
    "
    " [ Normal Mode ]                                                  }}}

    " -------------------------------------------------------------------------
    " [ Normal Mode + Shift ]                                        {{{
    "
    " ~: 'tildeop' off: switch case of N characters under cursor and move the cursor N characters to the right
    " !: filter Nmove text through the {filter} command
    " @{a-z}: execute the contents of register {a-z} N times
    " @:: repeat the previous ":" command N times
    " @@: repeat the previous @{a-z} N times
    " #: remap to make.vim
    " $: cursor to the end of Nth next line
    " %: find the next (curly/square) bracket on this line and go to its match, or go to matching comment bracket, or go to matching preprocessor directive.
    " ^: cursor to the first CHAR of the line
    " &: repeat last :s
    " *: remap to make.vim
    " (: cursor N sentences backward
    " ): cursor N sentences forward
    " +/_: Remap to 'In/decrement number'
    nnoremap + <c-a>
    nnoremap _ <c-x>
    " -----------------------------------------------------------------------------
    " Q: Remap to 'Closes the window'
    nnoremap Q :q<CR>

    " W: Move word forward
    " E: Move to end of word forward
    " R: Enter replace mode
    " T: Finds till backwards
    " Y: yank N lines, like as yy
    " U: Remap to 'Redo' since 'u' undos
    nnoremap U <c-r>

    " I: Insert at beginning of line
    " O: Insert line above
    " P: Paste above line
    " {: Beginning of paragraph
    " }: End of paragraph
    " | : Remap to Quick 'vertical splits'
    nnoremap <bar> :vsp<cr>
    " -----------------------------------------------------------------------------
    " A: Insert at end of line
    " S: Delete line and start insert
    " D: Deletes til the end of line
    " F: Finds backwards
    " G: Go to end of file
    " H: Go to top of screen
    " J: Join lines
    " K: Remap to 'Man'
    " L: Go to bottom of screen
    " :: start entering an Ex command
    " ": Handles registers
    " -----------------------------------------------------------------------------
    " Z: TODO
    " X: Deletes character backward
    " X*: for cscope at cscope_macros.vim
    " C: Deletes rest of line and go to insert mode
    " V: Visual line mode
    " B: Move word backward (TODO Replaced by <C-H>, maybe remap?)
    " N: Remap to 'Find next occurrence backward'
    nnoremap N Nzzzv

    " M: Move cursor to mid screen
    " <: remap to Indent left
    " >: remap to Indent right
    " ?: Search backwards
    "
    " [ Normal Mode + Shift ]                                        }}}

    " -------------------------------------------------------------------------
    " [ Normal Mode + Ctrl ]                                         {{{
    "
    " Ctrl-@: TODO
    " Ctrl-`: TODO
    " Ctrl-1~0: TODO
    " Ctrl-^: edit Nth alternate file (equivalent to ":e #N")
    " Ctrl-_: TODO
    "--------------------------------------------------------------------------
    " Ctrl-q: TODO
    " Ctrl-w: Window Command
    " Ctrl-e: Remap to 'end of line'
    nnoremap <c-e> $

    " Ctrl-r: Redo
    " Ctrl-t: Jump to previously tag
    " Ctrl-y: scroll downwards
    " Ctrl-u: scroll upwards
    " Ctrl-i: <Tab>
    " Ctrl-o: Go to older entry
    " Ctrl-p: remap to :cprev
    " Ctrl-[: <Esc>
    " Ctrl-]: Go forward in tag stack
    " Ctrl-\: TODO
    " Ctrl-\ d, i, f, e, t, c, g, s: cscope at cscope_macros.vim
    " Ctrl-\ Ctrl-n: go to Normal mode (no-op)
    " Ctrl-\ Ctrl-g: go to mode specified with 'insertmode'
    "------------------------------------------------------------------------------
    " Ctrl-a: Remap to start of line
    nnoremap <c-a> ^

    " Ctrl-s: TODO
    " Ctrl-d: scroll down lines
    " Ctrl-f: scroll screens forward
    " Ctrl-g: display current file name and position
    " Ctrl-h: Remap to 'Window Operations'
    " Ctrl-j: Remap to 'Window Operations'
    " Ctrl-k: Remap to 'Window Operations'
    " Ctrl-l: Remap to 'Window Operations'
    " Ctrl-;: Vim can't map this
    " Ctrl-': Vim can't map this
    "------------------------------------------------------------------------------
    " Ctrl-z: suspend program
    " Ctrl-x: Remap to Hexmode
    " Ctrl-c: interrupt current (search) command
    " Ctrl-v: start blockwise Visual mode
    " Ctrl-b: scroll N screens Backwards
    " Ctrl-n: remap to cnext
    " Ctrl-m: Remap to 'Window Operations'
    " Ctrl-,: Vim can't map this
    " Ctrl-.: Vim can't map this
    " Ctrl-/: TODO
    "
    " [ Normal Mode + Ctrl ]                                          }}}

    " -------------------------------------------------------------------------
    " [ Insert Mode ]                                                   {{{
    "
    " 0 CTRL-D delete all indent in the current line
    " ^ CTRL-D delete all indent in the current line, restore it in the next line
    "
    " <F1>: : same as <Help>
    " <Help>: stop insert mode and display help window
    " <Insert>: toggle Insert/Replace mode
    "
    " <C-Home>: cursor to start of file
    " <C-End>: cursor past end of file
    " <C-Left>: cursor one word left
    " <C-Right>: cursor one word right
    "
    " <S-Up>: same as <PageUp>
    " <S-Down>: same as <PageDown>
    " <S-Left>: cursor one word left
    " <S-Right>: cursor one word right
    "
    " [ Inhsert Mode ]                                                  }}}

    " -------------------------------------------------------------------------
    " [ Insert Mode + Ctrl ]                                             {{{
    " Ctrl-@: insert previously inserted text and stop insert
    " Ctrl-1~0: TODO
    " Ctrl--: TODO
    " Ctrl-=: TODO
    " -----------------------------------------------------------------------------
    " Ctrl-q: Quoted insert. Useful for doing key binding
    " Ctrl-w: Delete previous word, create undo point
    inoremap <c-w> <c-g>u<c-w>

    " Ctrl-e: insert the character which is below the cursor that remap to go to end of line
    inoremap <c-e> <esc>A

    " Ctrl-r: insert the contents of a register
    " Ctrl-t: Indent shiftwidth
    " Ctrl-y: Insert char above cursor
    " Ctrl-u: Delete til beginning of line, create undo point
    inoremap <c-u> <c-g>u<c-u>

    " Ctrl-i: Tab
    " Ctrl-o: Execute one normal mode command and return to insert mode
    " Ctrl-p: Auto complete previous
    " Ctrl-[: <esc>
    " Ctrl-]: trigger abbreviation
    " Ctrl-\: others not used
    " Ctrl-\ ctrl-N: go to Normal mode
    " Ctrl-\ ctrl-G: go to mode specified with 'insertmode'
    " -----------------------------------------------------------------------------
    " Ctrl-a: Go to begin of line
    inoremap <c-a> <esc>I

    " Ctrl-s: Save
    inoremap <c-s> <esc>:w<CR>

    " Ctrl-d: Unindent shiftwidth
    " Ctrl-f: TODO
    " Ctrl-g: TODO

    " move your cursor like as in normal mode
    " Ctrl-h: <BS> that remap to <left>
    " Ctrl-j: <CR> that remap to <down>
    " Ctrl-k: {char1} {char2} enter digraph that remap to <up>
    " Ctrl-l: Leave Insert mode that remap to <right>
    inoremap <c-h> <c-o>h
    inoremap <c-j> <c-o>j
    inoremap <c-k> <c-o>k
    inoremap <c-l> <c-o>l

    " Ctrl-;: TODO
    " Ctrl-': TODO
    " -----------------------------------------------------------------------------
    " Ctrl-z: suspend Vim
    " Ctrl-x: enter ctrl-x sub mode
    " ctrl-x ctrl-d:    complete defined identifiers
    " ctrl-x ctrl-e:    scroll up
    " ctrl-x ctrl-f:    complete file names
    " ctrl-x ctrl-i:    complete identifiers
    " ctrl-x ctrl-k:    complete identifiers from dictionary
    " ctrl-x ctrl-l:    complete whole lines
    " ctrl-x ctrl-n:    next completion
    " ctrl-x ctrl-o:    omni completion
    " ctrl-x ctrl-p:    previous completion
    " ctrl-x ctrl-s:    spelling suggestions
    " ctrl-x ctrl-t:    complete identifiers from thesaurus
    " ctrl-x ctrl-y:    scroll down
    " ctrl-x ctrl-u:    complete with 'completefunc'
    " ctrl-x ctrl-v:    complete like in : command line
    " ctrl-x ctrl-]:    complete tags
    " ctrl-x s:         spelling suggestions

    " Ctrl-c: quit insert mode, without checking for abbr that remap to inserts line below
    inoremap <c-c> <c-o>o

    " Ctrl-v: Paste. For some reason, <c-o> is not creating an undo point in the mapping
    " inoremap <c-v> <c-g>u<c-o>gP

    " Ctrl-b: TODO
    " Ctrl-n: Auto complete next
    " Ctrl-m: Same as Enter

    " Ctrl-,: TODO
    " Ctrl-.: TODO
    " Ctrl-/: Undo
    inoremap <c-_> <c-o>u
    " -----------------------------------------------------------------------------
    " Ctrl-space: TODO
    "
    " [ Insert Mode + Ctrl ]                                              }}}

    " -------------------------------------------------------------------------
    " [ Virtual Mode + Ctrl ]                                       {{{
    "
    vnoremap <C-c> :w! /tmp/vimbuffer<CR>:!xclip < /tmp/vimbuffer<CR><CR>
    " Copy to System-Clipboard
    "if OS == "Linux"
    "    map <C-c> :w! /tmp/vimbuffer<CR>:!xclip < /tmp/vimbuffer<CR><CR>
    "endif

    " Tab Control
    xnoremap <tab> >gv
    xnoremap <s-tab> <gv
    "
    " [ Virtual Mode + Ctrl ]                                        }}}

    " -------------------------------------------------------------------------
    " [ Command-line Mode ]                                         {{{
    "
    " Bash like keys for the command line. These resemble personal zsh mappings
    cnoremap <c-a> <home>
    cnoremap <c-e> <end>

    " Ctrl-[hl]: Move left/right by word
    cnoremap <c-h> <s-left>
    cnoremap <c-l> <s-right>

    " Ctrl-Space: Show history
    cnoremap <c-@> <c-f>

    cnoremap <c-j> <down>
    cnoremap <c-k> <up>
    cnoremap <c-f> <left>
    cnoremap <c-g> <right>

    " Ctrl-Delete: Delete previous word. HACK ALERT! Ctrl-Delete sends d in iTerm2
    cnoremap <m-d> <c-w>

    " Ctrl-v: Paste
    " cnoremap <c-v> <c-r>"

    " w!!: Writes using sudo
    cnoremap w!! w !sudo tee % >/dev/null
    "
    " [ Command-line Mode ]                                            }}}

    " -------------------------------------------------------------------------
    " [ Specific Hot-Key Group ]                                            {{{
    "
    " [ Window Operations ]                                                  {{{
    " Use Ctrl+hjkl to switch between Window
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l
    " Maximize current split
    nnoremap - <C-w>-
    nnoremap = <C-w>+
    " Define different behavior in left/right window
    if has("autocmd")
        augroup MyAutoCmd
            autocmd BufEnter,BufLeave *
            \     if winnr() == 1 |
            \        nmap < <C-w>< |
            \        nmap > <C-w>> |
            \     else |
            \        nmap < <C-w>> |
            \        nmap > <C-w>< |
            \     endif
        augroup END
    endif
    " [ Window Operations ]                                                 }}}

    " [ Tag Operations ]                                                     {{{
    " Go to next tab
    nnoremap <Leader>tl gt <CR>
    inoremap <Leader>tl <ESC>gt <CR>
    " Go to Prev tab
    nnoremap <Leader>th gT <CR>
    inoremap <Leader>th <ESC>gT <CR>
    " Create a tab
    nnoremap <Leader>tn :tabnew<CR>
    inoremap <Leader>tn <ESC>:tabnew<CR>
    " Remove the tab
    nnoremap <Leader>tc :tabclose<CR>
    inoremap <Leader>tc <ESC>:tabclose<CR>
    " Show the tab list
    nnoremap <Leader>ts :tabs<CR>
    inoremap <Leader>ts <ESC>:tabs<CR>

    " Spell Checking
    nnoremap <Leader>ss :setlocal spell!<cr>
    nnoremap <Leader>sj ]s
    nnoremap <Leader>sk [s
    nnoremap <Leader>sa zg]s
    nnoremap <Leader>sd 1z=
    nnoremap <Leader>sf z=
    "
    " [ Tag Operations ]                                                     }}}
    "
    " [ VimGrep ]                                                            {{{
    nnoremap <Leader>fv :exec 'vimgrep /\<'.expand('<cword>').'\>/g **/*.vala' <CR>
    nnoremap <Leader>fp :exec 'vimgrep /\<'.expand('<cword>').'\>/g **/*.py' <CR>
    nnoremap <Leader>fc :exec 'vimgrep /\<'.expand('<cword>').'\>/g **/*.[ch]' <CR>
    nnoremap <Leader>fn :cn <CR>
    nnoremap <Leader>fN :cp <CR>
    " [ VimGrep ]                                                            }}}
    "
    " [ EasyGrep ]                                                           {{{
    " EasyGrep.vim
    " ,vy* <SNR>27_ToggleFileAssociationsInExplorer()<CR>
    " ,vy| <SNR>27_EchoOptionsSet()<CR>
    " ,vyv <SNR>27_EchoGrepCommand()<CR>
    " ,vy? <SNR>27_ToggleOptionsDisplay()<CR>
    " ,vym <SNR>27_ToggleReplaceWindowMode()<CR>
    " ,vys <SNR>27_Sort()<CR>
    " ,vye <SNR>27_EchoFilesSearched()<CR>
    " ,vy! <SNR>27_ToggleWholeWord()<CR>
    " ,vyp <SNR>27_ToggleJumpToMatch()<CR>
    " ,vyg <SNR>27_ToggleEveryMatch()<CR>
    " ,vyo <SNR>27_ToggleOpenWindow()<CR>
    " ,vyw <SNR>27_ToggleWindow()<CR>
    " ,vyh <SNR>27_ToggleHidden()<CR>
    " ,vyi <SNR>27_ToggleIgnoreCase()<CR>
    " ,vyd <SNR>27_ToggleBufferDirectories()<CR>
    " ,vyr <SNR>27_ToggleRecursion()<CR>
    " ,vyc <SNR>27_ToggleCommand()<CR>
    " ,vyx <SNR>27_SetFilesToExclude()<CR>
    " ,vyu <SNR>27_ActivateUser()<CR>
    " ,vyt <SNR>27_ActivateTracked()<CR>
    " ,vyb <SNR>27_ActivateBuffers()<CR>
    " ,vya <SNR>27_ActivateAll()<CR>
    " ,vR  <Plug>EgMapReplaceSelection_R
    " ,vr  <Plug>EgMapReplaceSelection_r
    " ,vA  <Plug>EgMapGrepSelection_A
    " ,va  <Plug>EgMapGrepSelection_a
    " ,vV  <Plug>EgMapGrepSelection_V
    " ,vv  <Plug>EgMapGrepSelection_v
    " ,vo  <Plug>EgMapGrepOptions
    " [ EasyGrep ]                                                           }}}
    "
    " [ Diff related ]                                                      {{{
    "
    "force vim diff to ignore whitespace
    " set diffopt+=iwhite
    " highlight diff color
    hi diffchange ctermbg=236
    hi diffadd ctermbg=4
    hi DiffDelete ctermfg=69 ctermbg=234
    hi difftext ctermbg=3 ctermfg=0

    function! s:DiffWithSaved()
        let filetype=&ft
        diffthis
        vnew | r # | normal! 1Gdd
        diffthis
        exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
    endfunction

    com! DiffSaved call s:DiffWithSaved()
    nnoremap <Leader>d :DiffSaved<CR>

    "DirDiff
    let g:DirDiffExcludes = "*.git,*.svn,.*.swp,tags,cscope.*"
    let g:DirDiffWindowSize = 10

    " WinMerge-style (Alt + hjkl) mapping for vimdiff
    nnoremap j ]c
    nnoremap k [c
    nnoremap h do
    nnoremap l dp
    "
    " [ Diff related ]                                                      }}}
    "
    " [ Specific Hot-Key Group ]                                       }}}
"
" Key Mappings                                                     }}}
" =============================================================================
