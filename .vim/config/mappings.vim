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

    " let g:maplocalleader = "\"

    " <Leader>1: only
    nnoremap <Leader>1 :only<CR>

    " <Leader>2: split
    nnoremap <Leader>2 :split<CR>

    " <Leader>3: vsplit
    nnoremap <Leader>3 :vsplit<CR>

    " <Leader>w Fast saving
    nnoremap <leader>w :w!<cr>
    nnoremap <silent> <Leader>p :let @+=expand("%:p")<cr>:echo "Copied current file
        \ path '".expand("%:p")."' to clipboard"<cr>
    "--------------------------------------------------------------------------

    " <Leader>h for Edit(e) & Generate(g) help tags
    nnoremap <Leader>he :tabedit $HOME/.vim/doc/MyNote.txt <CR>
    nnoremap <Leader>hg :helptags $HOME/.vim/doc <CR>

    noremap <silent> <Leader>vs :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>

    " -------------------------------------------------------------------------

    " -------------------------------------------------------------------------
    " [ Normal Mode + Shift ]                                        {{{
    " +/_: Remap to 'In/decrement number'
    nnoremap + <c-a>
    nnoremap _ <c-x>
    " -----------------------------------------------------------------------------
    " Q: Remap to 'Closes the window'
    nnoremap Q :q<CR>

    " U: Remap to 'Redo' since 'u' undos
    nnoremap U <c-r>

    " | : Remap to Quick 'vertical splits'
    nnoremap <bar> :vsp<cr>
    " ?: Search backwards
    "
    " [ Normal Mode + Shift ]                                        }}}

    " -------------------------------------------------------------------------
    " [ Normal Mode + Ctrl ]                                         {{{
    "
    " Ctrl-e: Remap to 'end of line'
    nnoremap <c-e> $

    "------------------------------------------------------------------------------
    " Ctrl-a: Remap to start of line
    nnoremap <c-a> ^

    " -----------------------------------------------------------------------------
    " Ctrl-space: TODO
    "
    " [ Insert Mode + Ctrl ]                                              }}}

    " -------------------------------------------------------------------------
    " [ Virtual Mode + Ctrl ]                                       {{{
    "
    vnoremap <C-c> :w! /tmp/vimbuffer<CR>:!xclip < /tmp/vimbuffer<CR><CR>

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
    " [ VimGrep ]                                                            }}}
    "
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
    " [ Diff related ]                                                      }}}
    "
    " [ Specific Hot-Key Group ]                                       }}}
"
" Key Mappings                                                     }}}
" =============================================================================
