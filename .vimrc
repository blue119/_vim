"
" Author:
" Web:
" Last Modified: 四  5月 26, 2011  11:43上午
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" [ General Setting ]                                       {{{
"
" For pathogen.vim: auto load all plugins in .vim/bundle
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
"
" Use Vim settings, rather then Vi settings (much better!). This must be first,
" because it changes other options as a side effect.
set nocompatible
" Chagne <Leader> (Default is \) to ","
let mapleader = ","
" Chagne <LocalLeader> to "\"
"let maplocalleader = "\"

" Function key-map {{{
"
" Like \":write\", but only write when the buffer has been modified
"nmap <F2> :up<CR>
"imap <F2> <Esc>:up<CR>a

" Find match prev
map <F3> :cp<CR>

" Find match next
map <F4> :cn<CR>

"imap <F6> <ESC>:w<CR> :!chmod a+x %<CR> :!clear;./ %<CR>
" 前一個 buffer 檔案
map <F5> :bp<CR>

" 下一個 buffer 檔案
map <F6> :bn<CR>

" Inster a time stamp for now
" ("%Y-%m-%d %a %I:%M %p") <-> (2009-01-30 五 12:23 上午)
"nmap <F6> a<C-R>=strftime("%Y-%m-%d %I:%M")<CR><Esc>
"imap <F6> <C-R>=strftime("%Y-%m-%d %I:%M")<CR>

" insert debug msg
"map <F7> <Esc>$a // fix by bruce wang

" http://vim.wikia.com/wiki/Automatically_create_and_update_cscope_database
" nmap <F9> :!find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > cscope.files<CR>
            " \ :!cscope -b -i cscope.files -f cscope.out<CR>
            " \ :cs reset<CR>

" Spell Check
"hi SpellBad term=underline cterm=underline ctermfg=red
"map <F5> :set spell!<CR><BAR>:echo "Spell check: " . strpart("OffOn", 3 * &spell, 3)<CR>

" Toggle on/off paste mode
map <F7> :set paste!<BAr>set paste?<CR>
set pastetoggle=<F9>

" search highlight switching
map <F8> :set hls!<BAR>set hls?<CR>

"Visualize some special chars
set listchars=tab:>-,trail:-,eol:$,nbsp:%,extends:>,precedes:<
map <F9> :set list!<bar>set list?<CR>

"Toggle on/off show line number
"map <F10> :set nu!<bar>set nu?<CR>

" p4 edit
nmap <F10> :!p4 edit %<CR>

"
" }}}

" auto generated file: filename~
set backup
set backupdir=$HOME/.vim/backup

"add runtimepath to make 'vim -u ~kent/.vimrc" work properly
set runtimepath+=~blue119/.vim

" Font, Theme & Color Setting {{{
if &term == "xterm" || &term == "xterm-color" || &term == "xterm-16color"
    set t_Co=16
elseif ! has("gui_running")
    set t_Co=256
endif

if has("gui_running")
    set guioptions-=T
    " colorscheme desert256
    colorscheme molokai
    set background=dark
    set gfn=Consolas:h14
    set gfn=Monospace\ 10
    "set guifont=Lucida\ Console\ 14
else
    set background=dark
    " colorscheme desert
    " colorscheme desertEx
    " let g:desertEx_statusLineColor = 1

    colorscheme molokai
    let g:molokai_original = 1
    let g:rehash256 = 1
    set t_Co=256
endif
" }}}

" Searching
set hlsearch        " enable search highlight globally
set showmatch       " show matching brackets when typing
set incsearch       " do incremental searching
set ignorecase      " ignore case

set autoindent     " Auto Indent
set smartindent    " Smart Indent
set cindent        " C-style Indent

set smarttab       " Smart handling of the tab key
" set expandtab      " Use spaces for tabs
set shiftround     " Round indent to multiple of shiftwidth
set shiftwidth=4   " Number of spaces for each indent
set tabstop=4      " Number of spaces for tab key
" set textwidth=78   " Set text width

set history=500    " keep 200 lines of command line history
set ruler          " show the cursor position all the time
set showcmd        " display incomplete commands
set incsearch      " do incremental searching

set lazyredraw     " Do not redraw while running macros

"set list          " display unprintable with '^' and put $ after the line.
set nowrap
set confirm
set visualbell
set number          " line number

set scrolloff=3     " 3 lines bevore and after the current line when scrolling
set sidescrolloff=10
set ignorecase
set smartcase       " but don't ignore it, when search string contains
set showmatch       " showmatch: Show the matching bracket for the last ')'?

set hidden

" set completeopt=longest,menu,menuone
" set completeopt=menu,longest,previe
"
set wildmenu
"in ESC: (command mode), disbled auto completion next part, Cool!
set wildmode=list:longest
set wildignore+=*.o,*.a,*.so,*.obj,*.exe,*.lib,*.ncb,*.opt,*.plg,.svn,.git

" folding
set foldmethod=marker
set foldlevel=1000
set foldnestmax=5
"nnoremap <LocalLeader><SPACE> za

" file encoding setting {{{
set enc=utf-8
set tenc=utf-8
set fenc=utf-8
" }}}

" For ambiguous characters, ex: ”, and BBS XD
set ambiwidth=double

set backspace=indent,eol,start  " Allow backspacing over these

" colorcolumn
if v:version >= 703
    :set cc=81
    :hi colorcolumn guibg=lightgreen
endif

" Favorite file types
filetype plugin indent on
syntax on
set ffs=unix,dos,mac
" set ft=c                    " filetype

hi Folded ctermbg=237
"show CursorLine
highlight CursorLine guifg=red guibg=background
set cursorline

"  Status Line {{{
set ls=2
set statusline=\ [%F] 
set statusline+=\ [%{&encoding}, " encoding
set statusline+=%{&fileformat}]%m " file format
set statusline+=%=\ %y\ %l,\ %c\ \<\ %P\ \>

" set statusline=%4*%<\ %1*[%F]
" set statusline+=%4*\ %5*[%{&encoding}, " encoding
" set statusline+=%{&fileformat}]%m " file format
" set statusline+=%4*%=\ %6*%y%4*\ %3*%l%4*,\ %3*%c%4*\ \<\ %2*%P%4*\ \>
" highlight User1 ctermfg=red
" highlight User2 term=underline cterm=underline ctermfg=green
" highlight User3 term=underline cterm=underline ctermfg=yellow
" highlight User4 term=underline cterm=underline ctermfg=white
" highlight User5 ctermfg=cyan
" highlight User6 ctermfg=white
" }}}

" Change special highlight for me {{{
"
highlight Search term=reverse ctermbg=4 ctermfg=7
"highlight Normal ctermbg=black ctermfg=white
"highlight Folded ctermbg=black ctermfg=darkcyan
"hi Comment ctermbg=black ctermfg=darkcyan
" }}}

" Hot-key mapping {{{
"
"""""""""""""""""""""""""""""

" Tab Control"{{{
" nmap <tab> V>
nmap <tab> V>
nmap <s-tab> V<
"nmap <s-tab> V<gv<ESC>
xmap <tab> >gv
xmap <s-tab> <gv
"}}}

" Tab-page control {{{
" Go to next tab
nmap <Leader>tl gt <CR>
imap <Leader>tl <ESC>gt <CR>
" Go to Prev tab
nmap <Leader>th gT <CR>
imap <Leader>th <ESC>gT <CR>
" Create a tab
nmap <Leader>tn :tabnew<CR>
imap <Leader>tn <ESC>:tabnew<CR>
" Remove the tab
nmap <Leader>tc :tabclose<CR>
imap <Leader>tc <ESC>:tabclose<CR>
" Show the tab list
nmap <Leader>ts :tabs<CR>
imap <Leader>ts <ESC>:tabs<CR>
" }}}

" Window Control {{{
" 20100809
" Use Ctrl+hjkl to switch between Window
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap - <C-w>-
nmap = <C-w>+
" Define different behavior in left/right window
if has("autocmd")
    autocmd BufEnter,BufLeave *
    \     if winnr() == 1 |
    \        nmap < <C-w><|
    \        nmap > <C-w>>|
    \     else            |
    \        nmap < <C-w>>|
    \        nmap > <C-w><|
    \     endif           |
endif

" this allows all window commands in insert mode
" and i'm not accidentally deleting words anymore :-)
" imap <C-w> <C-o><C-w>
" }}}

" Fast saving
nmap <leader>w :w!<cr>
"
" Fast editing of the .vimrc
map <leader>e :e! ~/.vimrc<cr>
"
" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

" Edit(e) & Generate(g) help tags
nmap <LocalLeader>he :tabedit $HOME/.vim/doc/MyNote.txt <CR>
nmap <LocalLeader>hg :helptags $HOME/.vim/doc <CR>

" vimgrep settings {{{
"map <C-F>viwy :vimgrep /\<"\>/ **/*
" map <C-F>viwy: vimgrep /\<<C-R>"\>/g **/*.[ch] **/*.[ch]pp **/*.p[ly] <CR>
" map <C-F> :exec 'vimgrep /\<'.expand('<cword>').'\>/g **/*.[ch] **/*.[ch]pp **/*.p[ly]'<CR>
"map <C-F> :exec 'vimgrep /' . expand("<cword>") . '/j ../../**/*'
"map <C-F> :exec 'vimgrep /\<'.expand('<cword>').'\>/g **/*.[ch] **/*.py'<CR>
"map <C-N> :cn
"map <C-P> :cp
map <Leader>fv :exec 'vimgrep /\<'.expand('<cword>').'\>/g **/*.vala' <CR>
map <Leader>fp :exec 'vimgrep /\<'.expand('<cword>').'\>/g **/*.py' <CR>
map <Leader>fc :exec 'vimgrep /\<'.expand('<cword>').'\>/g **/*.[ch]' <CR>
map <Leader>fn :cn <CR>
map <Leader>fN :cp <CR>
"}}}

" addition another search work hls
" map sa :exec "/\\(".getreg('/')."\\)\\\\|".expand("<cword>")<CR>

" Add new keyword in search under cursor (*)
" map a* :exec "/\\(".getreg('/')."\\)\\\\|".expand("<cword>")<CR>

"Yahoo Dictionary
"http://plog.longwin.com.tw/my_note-unix/2007/02/09/command_line_dict_use_in_vim
" map <C-D> viwy:!clear; ydict <C-R>"<CR>

" skip direct-key
map <up> <nop>
map <left> <nop>
map <right> <nop>
map <down> <nop>

" move your cursor like as in normal mode
imap <C-k> <up>
imap <C-h> <left>
imap <C-l> <right>
imap <C-j> <down>

"View text file in two column
noremap <silent> <Leader>vs :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>
":<C-u>              " clear command line (if in visual mode)
"let @z=&so          " save scrolloff in register z
":set so=0 noscb     " set scrolloff to 0 and clear scrollbind
":bo vs              " split window vertically, new window on right
"Ljzt                " jump to bottom of window + 1, scroll to top
":setl scb           " setlocal scrollbind in right window
"<C-w>p              " jump to previous window
":setl scb           " setlocal scrollbind in left window
":let &so=@z         " restore scrolloff

"replace 'SHIFT+:' with ';' COOL!
noremap ; :

" insert a space line but don't change to insert mode
" nmap <C-o> o<Esc>

" Remove 'recording' key mapping
" nmap q <Cr>

" useful abbreviations {{{
" command mode : cabbrev
" insert mode : iabbr
" Remove : una, cuna, iuna
"
cabbrev vds vertical diffsplit
cabbrev hds diffsplit

" Force to split right!
set splitright
cabbrev h help
cabbrev vh vertical help
" cabbrev help vertical help
"cabbrev split vsplit
"cabbrev new vnew
" }}}

"}}} Hot-key mapping

"}}} General Setting

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" [ Mouse + gVim-Killer Related Setting ]                   {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This is AWESOME, INCREDIBLE! Could be used do Tab-Click, window resizing, scrolling...
" set mouse=a                " use mouse in xterm to scroll
set mouse=nv               " use mouse in xterm to scroll
"set mousehide
"set ttymouse=xterm2   " To function correctly in Screen
set ttymouse=xterm   " To function correctly in Screen

" ,p and shift-insert will paste the X buffer, even on the command line
nmap <LocalLeader>p i<S-MiddleMouse><ESC>
imap <S-Insert> <S-MiddleMouse>
cmap <S-Insert> <S-MiddleMouse>

" this makes the mouse paste a block of text without formatting it
map <MouseMiddle> <esc>"*p

" Enable block-mode selection
noremap <C-LeftMouse> <LeftMouse><Esc><C-V>
noremap <C-LeftDrag> <LeftDrag>

map <C-c> :w! /tmp/vimbuffer<CR>:!xclip < /tmp/vimbuffer<CR><CR>
" Copy to System-Clipboard
"if OS == "Linux"
"    map <C-c> :w! /tmp/vimbuffer<CR>:!xclip < /tmp/vimbuffer<CR><CR>
"endif

" Select all
map a <ESC>ggVG
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" [ Diff related ]                                          {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"force vim diff to ignore whitespace
set diffopt+=iwhite
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
nmap ,d :DiffSaved<CR>

"DirDiff
let g:DirDiffExcludes = "*.git,*.svn,.*.swp,tags,cscope.*"
let g:DirDiffWindowSize = 10

" WinMerge-style (Alt + hjkl) mapping for vimdiff
nmap j ]c
nmap k [c
nmap h do
nmap l dp
" nmap <C-j> ]c
" nmap <C-k> [c
" nmap <C-h> do
" nmap <C-l> dp

" non-Diff mode: Use <Alt-H> move to home, <Alt-L> move to the end
    " Diff mode: Used to do diffput and diffget
" Switch key mapping in Left/Right window under DiffMode
"if has("autocmd")
"   autocmd BufEnter,BufLeave *
"      \ if &diff                                                 |
"      \     if winnr() == 1                                      |
"      \        nmap h do                                       |
"      \        nmap l dp                                       |
"      \     else                                                 |
"      \        nmap h dp                                       |
"      \        nmap l do                                       |
"      \     endif                                                |
"      \ else                                                     |
"      \     if (g:vimgdb_debug_file == "")                       |
"      \         nmap <silent> <S-H> :call ToggleHomeActionN()<CR>|
"      \         map  <silent> <S-L> $|
"      \     endif|
"      \ endif
"endif

" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" [ Programming Language ]                                  {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    """"""""""""""""""""""""""""""
    " cs-mgmt "{{{
    """"""""""""""""""""""""""""""
    let g:CsMgmtCtags = 1
    let g:CsMgmtReAttach = 1
"}}}

    "nmap <C-c><C-c> :!gcc -Wall % -o %:r.out<CR>nmap <C-c><C-c> :!gcc -Wall % -o %:r.out<CR>
    
    """"""""""""""""""""""""""""""
    " ctags "{{{
    """"""""""""""""""""""""""""""
    " Set tags path
    " ./: starting in the directory where the current file is.
    " tags: search for a tags file named 'tags'
    " ;: recurse up the file tree if you do not find it
    " ../../../../: stop looking after 4 levels
    " set tags=./tags;/home/blue119/.vim/tags/;../../../../
"}}}
    """"""""""""""""""""""""""""""
    " cscope "{{{
    """"""""""""""""""""""""""""""
    " init cscope hotkey

    "nnoremap <F11> <ESC>:cs add ../cscope.out ..<CR>:cs add /home/kent/cscope_ctag/Horus/cscope.out /home/kent/Project/Horus/apps<CR>

    " To avoid using wrong cscope(/opt/montavista/pro5.0/bin/cscope) once sourcing devel_IP8161_VVTK
    if match(system('ls ~/usr/bin/cscope'), 'cscope') != -1
        set cscopeprg=~/usr/bin/cscope
    endif
"}}}
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " cscopequickfix {{{
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
    """"""""""""""""""""""""""""""
    " Javascript"{{{
    """"""""""""""""""""""""""""""
    autocmd FileType javascript set dictionary=~/.vim/dict/javascript.dict
"}}}
    """"""""""""""""""""""""""""""
    " vala"{{{
    """"""""""""""""""""""""""""""
    autocmd BufRead *.vala set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
    autocmd BufRead *.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
    au BufRead,BufNewFile *.vala    setfiletype vala
    au BufRead,BufNewFile *.vapi    setfiletype vala
    " Disable valadoc syntax highlight
    "let vala_ignore_valadoc = 1

    " Enable comment strings
    let vala_comment_strings = 1

    " Highlight space errors
    let vala_space_errors = 1
    " Disable trailing space errors
    "let vala_no_trail_space_error = 1
    " Disable space-tab-space errors
    let vala_no_tab_space_error = 1

    " Minimum lines used for comment syncing (default 50)
    "let vala_minlines = 120
    "}}}
    "
    """""""""""""""""""""""""""""
    " Auto Commplete Pop: ACP"{{{
    "
    nnoremap <Leader>af :AcpDisable<CR>
    nnoremap <Leader>an :AcpEnable<CR>
    " let g:acp_behaviorSnipmateLength = 1

    autocmd FileType * setl omnifunc=nullcomplete#Complete
    autocmd FileType javascript setl omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType html setl omnifunc=htmlcomplete#CompleteTags noci
    autocmd FileType css setl omnifunc=csscomplete#CompleteCSS noci
    autocmd FileType xml setl omnifunc=xmlcomplete#CompleteTags
    autocmd FileType php setl omnifunc=phpcomplete#CompletePHP
    autocmd FileType c setl omnifunc=ccomplete#Complete

    "}}}
    "
    """""""""""""""""""""""""""""
    " EnhancedCommentify {{{
    "
   let g:EnhCommentifyRespectIndent = 'Yes'
   let g:EnhCommentifyPretty = 'Yes'
   let g:EnhCommentifyMultiPartBlocks = 'Yes'
   let g:EnhCommentifyAlignRight = 'Yes'
"   let g:EnhCommentify = 'Yes'
   "}}}
    """"""""""""""""""""""""""""""
    " => Minibuffer plugin"{{{
    """"""""""""""""""""""""""""""
    " let g:miniBufExplModSelTarget = 1
    " let g:miniBufExplorerMoreThanOne = 2
    " let g:miniBufExplModSelTarget = 0
    " let g:miniBufExplUseSingleClick = 1
    " let g:miniBufExplMapWindowNavVim = 1
    " let g:miniBufExplVSplit = 25
    " let g:miniBufExplSplitBelow = 1
    " let g:miniBufExplorerAutoUpdate = 0
    " let g:miniBufExplorerDebugLevel = 10 
    " let g:miniBufExplorerDebugMode  = 0  " Writes to a file


    " autocmd BufRead,BufNew :call UMiniBufExplorer

    " map <leader>u :TMiniBufExplorer<cr>
    "}}}
    """"""""""""""""""""""""""""""
    " => bufExplorer plugin"{{{
    """"""""""""""""""""""""""""""
    let g:bufExplorerDefaultHelp = 0
    let g:bufExplorerShowRelativePath = 1
    let g:bufExplorerSortBy = "fullpath"
    map <leader>o :BufExplorer<cr>
    "}}}
    """"""""""""""""""""""""""""""
    " => FuzzyFinder"{{{
    """"""""""""""""""""""""""""""
    " let g:fuf_modesDisable = []
    " let g:fuf_mrufile_maxItem = 400
    " let g:fuf_mrucmd_maxItem = 400
    " nnoremap <silent> sj     :FufBuffer<CR>
    " nnoremap <silent> sk     :FufFileWithCurrentBufferDir<CR>
    " nnoremap <silent> sK     :FufFileWithFullCwd<CR>
    " nnoremap <silent> s<C-k> :FufFile<CR>
    " nnoremap <silent> sl     :FufCoverageFileChange<CR>
    " nnoremap <silent> sL     :FufCoverageFileChange<CR>
    " nnoremap <silent> s<C-l> :FufCoverageFileRegister<CR>
    " nnoremap <silent> sd     :FufDirWithCurrentBufferDir<CR>
    " nnoremap <silent> sD     :FufDirWithFullCwd<CR>
    " nnoremap <silent> s<C-d> :FufDir<CR>
    " nnoremap <silent> sn     :FufMruFile<CR>
    " nnoremap <silent> sN     :FufMruFileInCwd<CR>
    " nnoremap <silent> sm     :FufMruCmd<CR>
    " nnoremap <silent> su     :FufBookmarkFile<CR>
    " nnoremap <silent> s<C-u> :FufBookmarkFileAdd<CR>
    " vnoremap <silent> s<C-u> :FufBookmarkFileAddAsSelectedText<CR>
    " nnoremap <silent> si     :FufBookmarkDir<CR>
    " nnoremap <silent> s<C-i> :FufBookmarkDirAdd<CR>
    " nnoremap <silent> st     :FufTag<CR>
    " nnoremap <silent> sT     :FufTag!<CR>
    " nnoremap <silent> s<C-]> :FufTagWithCursorWord!<CR>
    " nnoremap <silent> s,     :FufBufferTag<CR>
    " nnoremap <silent> s<     :FufBufferTag!<CR>
    " vnoremap <silent> s,     :FufBufferTagWithSelectedText!<CR>
    " vnoremap <silent> s<     :FufBufferTagWithSelectedText<CR>
    " nnoremap <silent> s}     :FufBufferTagWithCursorWord!<CR>
    " nnoremap <silent> s.     :FufBufferTagAll<CR>
    " nnoremap <silent> s>     :FufBufferTagAll!<CR>
    " vnoremap <silent> s.     :FufBufferTagAllWithSelectedText!<CR>
    " vnoremap <silent> s>     :FufBufferTagAllWithSelectedText<CR>
    " nnoremap <silent> s]     :FufBufferTagAllWithCursorWord!<CR>
    " nnoremap <silent> sg     :FufTaggedFile<CR>
    " nnoremap <silent> sG     :FufTaggedFile!<CR>
    " nnoremap <silent> so     :FufJumpList<CR>
    " nnoremap <silent> sp     :FufChangeList<CR>
    " nnoremap <silent> sq     :FufQuickfix<CR>
    " nnoremap <silent> sy     :FufLine<CR>
    " nnoremap <silent> sh     :FufHelp<CR>
    " nnoremap <silent> se     :FufEditDataFile<CR>
    " nnoremap <silent> sr     :FufRenewCache<CR>
    "}}}
    """"""""""""""""""""""""""""""
    " => CtrlP"{{{
    """"""""""""""""""""""""""""""
    let g:ctrlp_working_path_mode = 'ra'
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip
    let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
    " let g:ctrlp_custom_ignore = {
        " \ 'dir':  '\v[\/]\.(git|hg|svn)$',
        " \ 'file': '\v\.(exe|so|dll)$',
        " \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
        " \ }
    let g:ctrlp_user_command = 'find %s -type f'
    " }}}
    "
    """"""""""""""""""""""""""""""
    " => unite "{{{
    " http://goo.gl/Uq95Wj #Unite.vim, the Plugin You Didn't Know You Need
    """"""""""""""""""""""""""""""
    let g:unite_enable_start_insert=0

    " File searching like ctrlp.vim
    nnoremap <C-p> :Unite file_rec/async<CR> 

    " Content searching like ack.vim
    nnoremap <Leader>u/ :Unite grep:.<cr>

    " Yank history like yankring
    let g:unite_source_history_yank_enable = 1
    nnoremap <Leader>uy :Unite history/yank<CR>

    " Buffer switching like LustyJuggler
    nnoremap <Leader>ub :Unite -quick-match buffer<cr>
    " nnoremap <Leader>ub :Unite buffer<CR> 

    nnoremap <Leader>uf :UniteWithBufferDir -buffer-name=files file<CR> 
    nnoremap <Leader>ur :Unite file_mru<CR> 
    nnoremap <Leader>uy :Unite -buffer-name=register register<CR> 
    nnoremap <Leader>ua :Unite UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
    " }}}
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" [ Hex/Binary Edit ]                                       {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" autocmds to automatically enter hex mode and handle file writes properly
if has("autocmd")
  " vim -b : edit binary using xxd-format!
  augroup Binary
    au!
    au BufReadPre *.bin,*.hex,*.pkg,*.img,*.out setlocal binary
    au BufReadPost *
          \ if &binary | Hexmode | endif
    au BufWritePre *
          \ if exists("b:editHex") && b:editHex && &binary |
          \  let oldro=&ro | let &ro=0 |
          \  let oldma=&ma | let &ma=1 |
          \  exe "%!xxd -r" |
          \  let &ma=oldma | let &ro=oldro |
          \  unlet oldma | unlet oldro |
          \ endif
    au BufWritePost *
          \ if exists("b:editHex") && b:editHex && &binary |
          \  let oldro=&ro | let &ro=0 |
          \  let oldma=&ma | let &ma=1 |
          \  exe "%!xxd" |
          \  exe "set nomod" |
          \  let &ma=oldma | let &ro=oldro |
          \  unlet oldma | unlet oldro |
          \ endif
  augroup END
endif

" ex command for toggling hex mode - define mapping if desired
command -bar Hexmode call ToggleHex()
" helper function to toggle hex mode
function ToggleHex()
    " hex mode should be considered a read-only operation
    " save values for modified and read-only for restoration later,
    " and clear the read-only flag for now
    let l:modified=&mod
    let l:oldreadonly=&readonly
    let &readonly=0
    let l:oldmodifiable=&modifiable
    let &modifiable=1
    if !exists("b:editHex") || !b:editHex
        " save old options
        let b:oldft=&ft
        let b:oldbin=&bin
        " set new options
        setlocal binary " make sure it overrides any textwidth, etc.
        let &ft="xxd"
        " set status
        let b:editHex=1
        " switch to hex editor
        %!xxd
    else
        " restore old options
        let &ft=b:oldft
        if !b:oldbin
            setlocal nobinary
        endif
        " set status
        let b:editHex=0
        " return to normal editing
        %!xxd -r
    endif
    " restore values for modified and read only state
    let &mod=l:modified
    let &readonly=l:oldreadonly
    let &modifiable=l:oldmodifiable
endfunction

nnoremap <C-x> :Hexmode<CR>

" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" [ Plugin configuration ]                                  {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    """"""""""""""""""""""""
    " yankring {{{
    """"""""""""""""""""""""
    let g:yankring_history_file = '.yankring_history'
    " }}}

    """"""""""""""""""""""""
    " vim-indent-guides {{{
    """"""""""""""""""""""""
    let g:indent_guides_auto_colors = 0
    let g:indent_guides_start_level = 2
    let g:indent_guides_guide_size = 1
    hi IndentGuidesOdd  ctermbg=black
    hi IndentGuidesEven ctermbg=darkgrey

    " }}}

    """"""""""""""""""""""""
    " NERD_TREE {{{
    """"""""""""""""""""""""
    " notes:
    "
    " o       Open selected file, or expand selected dir
    " go      Open selected file, but leave cursor in the NERDTree
    " t       Open selected node in a new tab
    " T       Same as 't' but keep the focus on the current tab
    " <tab>   Open selected file in a split window
    " g<tab>  Same as <tab>, but leave the cursor on the NERDTree
    " !       Execute the current file
    " O       Recursively open the selected directory
    " x       Close the current nodes parent
    " X       Recursively close all children of the current node
    " e       Open a netrw for the current dir
    "
    let NERDTreeChDirMode=2
    map <Leader>nt :NERDTreeToggle<CR>
    " }}}

    """"""""""""""""""""""""
    " EasyGrep {{{
    """"""""""""""""""""""""
    "Grep 'pattern' in the indicate range (need EasyGrep.vim plugin)
    "map <F3> <ESC>\vv
    let g:EasyGrepRecursive = 1
    let g:EasyGrepIgnoreCase= 0
    let g:EasyGrepJumpToMatch= 1
    " }}}

    """"""""""""""""""""""""""""""
    " Tag List {{{
    """"""""""""""""""""""""""""""
    "nmap <F12>   :TlistToggle<CR>

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
    " }}}

    """"""""""""""""""""""""""""""
    " vimgdb {{{
    """"""""""""""""""""""""""""""
    " let g:vimgdb_debug_file = ""
    " run macros/gdb_mappings.vim
    " }}}

    """"""""""""""""""""""""""""""
    " pydiction {{{
    """"""""""""""""""""""""""""""
    " let g:pydiction_location = '~/.vim/tools/complete-dict'
    " let g:pydiction_menu_height = 20
    " }}}

    """"""""""""""""""""""""""""""
    " => DoxygenToolkit.vim"{{{
    """"""""""""""""""""""""""""""
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
    "}}}

    """"""""""""""""""""""""""""""
    " => LanguageTool"{{{
    """"""""""""""""""""""""""""""
    let g:languagetool_jar=$HOME . '/iLab/edit/languagetool/dist/LanguageTool.jar'


    " => OmniCppComplete"{{{
    """"""""""""""""""""""""""""""
    " http://aufather.wordpress.com/2010/08/26/omni-completion-in-vim/
    " set omnifunc=syntaxcomplete#Complete " override built-in C omnicomplete with C++ OmniCppComplete plugin
    " let OmniCpp_GlobalScopeSearch   = 1
    " let OmniCpp_DisplayMode         = 1
    " let OmniCpp_ShowScopeInAbbr     = 0 "do not show namespace in pop-up
    " let OmniCpp_ShowPrototypeInAbbr = 1 "show prototype in pop-up
    " let OmniCpp_ShowAccess          = 1 "show access in pop-up
    " let OmniCpp_SelectFirstItem     = 1 "select first item in pop-up
    set completeopt=menuone,menu,longest 

    " let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
    " highlight   clear
    highlight   Pmenu         ctermfg=0 ctermbg=2
    highlight   PmenuSel      ctermfg=0 ctermbg=7
    highlight   PmenuSbar     ctermfg=7 ctermbg=0
    highlight   PmenuThumb    ctermfg=0 ctermbg=7
    "}}}

" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" [ Functions & autocmd ]                                   {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set vim to chdir for each file {{{
if exists('+autochdir')
    set autochdir
else
    autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
endif

" Automatically update 'Last Modified' field
" If buffer modified, update any 'Last modified: ' in the first 20 lines.
"function! LastModified()
"  if &modified
"    normal ms
"    let n = min([20, line("$")])
"    exe '1,' . n . 's#^\(.\{,10}Last Modified: \).*#\1' .
"          \ strftime('%a %b %d, %Y  %I:%M%p') . '#e'
"    normal `s
"  endif
"endfun
"autocmd BufWritePre * call LastModified()
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remember the line number been edited last time {{{
if has("autocmd")
    autocmd BufRead *.txt set tw=78
    autocmd BufReadPost *
       \ if line("'\"") > 0 && line ("'\"") <= line("$") |
       \   exe "normal g'\"" |
       \ endif
endif

autocmd BufWinLeave *
    \   if (v:progname != "vimdiff") && expand("%") != "" && expand("%") !~ ".tmp" && expand("%") !~ "__MRU_Files__"
    \|       mkview
    \|  endif
autocmd BufWinEnter *
    \   if (v:progname != "vimdiff") && expand("%") != "" && expand("%") !~ ".tmp" && expand("%") !~ "__MRU_Files__"
    \|      loadview
    \|  endif
" Restore cursor to file position in previous editing session
autocmd BufReadPost *
    \   if line ("'\"") > 0 && line ("'\"") <= line("$")
    \|      exe "normal g'\""
    \|  endif
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" QUICKFIX WINDOW for :make {{{
command -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
   if exists("g:qfix_win") && a:forced == 0
       cclose
       unlet g:qfix_win
   else
       copen 6
       let g:qfix_win = bufnr("$")
   endif
endfunction
nnoremap <leader>q :QFix<CR>
nmap <C-n> :cnext<CR>
nmap <C-p> :cprev<CR>
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove unnecessary spaces in the end of line {{{
autocmd FileType vala,perl,python,html,js autocmd FileWritePre,BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" [Highlight column matching { } pattern], A very cool stuff(Kent) {{{
let s:hlflag=0
function! ColumnHighlight()
   let c=getline(line('.'))[col('.') - 1]
   if c=='{' || c=='}'
       set cuc
       let s:hlflag=1
   else
       if s:hlflag==1
           set nocuc
           let s:hlflag=0
       endif
   endif
endfunction

autocmd CursorMoved * call ColumnHighlight()
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd Filetype sh call s:sh_custom) {{{
function! s:sh_custom()
    noremap <F2> :% w !bash<CR>
    autocmd FileWritePre,BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
endfunction
if has("autocmd")
    autocmd Filetype sh call s:sh_custom()
endif
" }}}

" autocmd Filetype csv call {{{
function! s:csv_custom()
    setlocal cc=0
endfunction
if has("autocmd")
    autocmd Filetype csv call s:csv_custom()
endif
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd Filetype python call s:python_custom) {{{
function! s:python_custom()
    function! s:man(keyword)
        execute '!pydoc ' . a:keyword
    endfunction
    command! -nargs=1 Man call s:man(<f-args>)
    nnoremap K :!pydoc <cword><CR>

    autocmd FileType python setl omnifunc=pythoncomplete#Complete
    " setlocal tabstop=4 noexpandtab shiftwidth=4
    setlocal tabstop=4 shiftwidth=4
    setlocal foldmethod=indent foldcolumn=4 foldlevel=3 foldnestmax=3

    " imap iii import IPython; IPython.Shell.IPShellEmbed()()
    imap iii import IPython; IPython.embed()
    imap ddd import pdb; pdb.set_trace()
    noremap <F2> :% w !python<CR>

endfunction
if has("autocmd")
    autocmd Filetype python call s:python_custom()
endif
" }}}
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd Filetype go call s:python_custom) {{{
function! s:go_custom()
    " autocmd FileType go setl omnifunc=pythoncomplete#Complete
    " setlocal tabstop=4 noexpandtab shiftwidth=4
    " setlocal tabstop=4 shiftwidth=4
    " setlocal foldmethod=indent foldcolumn=4 foldlevel=3 foldnestmax=3

    " imap iii import Igo; IPython.Shell.IPShellEmbed()()
    " imap iii import Igo; IPython.embed()
    " imap ddd import pdb; pdb.set_trace()
    noremap <F2> :% w !go run %<CR>

endfunction
if has("autocmd")
    autocmd Filetype go call s:go_custom()
endif
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd Filetype ls call s:ls_custom) {{{
function! s:ls_custom()
    noremap <F2> :% w !lsc %<CR>
    autocmd FileType ls autocmd FileWritePre,BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

endfunction
set expandtab      " Use spaces for tabs
if has("autocmd")
    autocmd Filetype ls call s:ls_custom()
endif
" }}}
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd Filetype C/C++ call s:c_custom) {{{
"if filename is test.c => make test
function! s:c_custom()
    "set makeprg=make
    "set errorformat=%f:%l:\ %m
    setlocal equalprg=indent
    setlocal noexpandtab

    " color/paged man
    runtime! ftplugin/man.vim
    nmap K <esc>:Man <cword><cr>
endfunction
if has("autocmd")
    autocmd Filetype c call s:c_custom()
endif
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim macro to jump to devhelp topics. {{{
"function! DevHelpCurrentWord()
"    let word = expand("<cword>")
"    exe "!devhelp -s " . word
"endfunction
"nmap hdh :call DevHelpCurrentWord()<CR>
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" auto update ctags {{{
"
"function! UPDATE_TAGS()
"  let _f_ = expand("%:p")
"  let _cmd_ = '"ctags -a -f /dvr/tags --c++-kinds=+p --fields=+iaS --extra=+q " ' . '"' . _f_ . '"'
"  let _resp = system(_cmd_)
"  unlet _cmd_
"  unlet _f_
"  unlet _resp
"endfunction
"autocmd BufWritePost *.cpp,*.h,*.c call UPDATE_TAGS()
"}}}

"[End Function & autocmd]}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" [ MISC ]                                                  {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Search code sample from Google code {{{
"
"function! OnlineDoc()
"    let s:browser = "google-chrome"
"    let s:wordUnderCursor = expand("<cword>")
"
"    if &ft == "cpp" || &ft == "c" || &ft == "ruby" || &ft == "php" || &ft == "python"
"        let s:url = "http://www.google.com/codesearch?q=".s:wordUnderCursor."+lang:".&ft
"    elseif &ft == "vim"
"        let s:url = "http://www.google.com/codesearch?q=".s:wordUnderCursor
"    else
"        return
"    endif
"
"    let s:cmd = "silent !" . s:browser . " " . s:url
"    "echo  s:cmd
"    execute  s:cmd
"    redraw!
"endfunction

" online doc search
"map <LocalLeader>k :call OnlineDoc()<CR>
" }}}

" spelling {{{
"
if v:version >= 700
    let b:lastspelllang='en'
    function! ToggleSpell()
        if &spell == 1
            let b:lastspelllang=&spelllang
            setlocal spell!
        elseif b:lastspelllang
            setlocal spell spelllang=b:lastspelllang
        else
            setlocal spell spelllang=en
        endif
    endfunction

    nmap <Leader>ss :call ToggleSpell()<CR>

    setlocal spell spelllang=en
    setlocal nospell
endif

highlight SpellErrors ctermfg=Red guifg=Red cterm=underline gui=underline term=reverse
" }}}

" vim as a calcuator"{{{
"
:command! -nargs=+ Calc :py print <args>
:py from math import *
""}}}

" Script test {{{
"
function! CapitalizeCenterAndMoveDown()
    s/\<./\u&/g "Built-in substitution capitalizes each word
    center      "Built-in center command centers entire line
    +1          "Built-in relative motion (+1 line down)
endfunction

nmap <silent><LocalLeader>C :call CapitalizeCenterAndMoveDown()<CR>

" au! CursorHold * nested call To_tell_time()
" func To_tell_time()
    " echo strftime("%Y%m%dT%H%M%S", localtime())
" endfun

" }}}

" vim:fdm=marker:et:fdl=0:
