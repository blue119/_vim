"
" Author: Yao-Po Wang
" Web:
" Last Modified: 四  5月 26, 2011  11:43上午
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ============================================================================
" [ General Setting ]                                                      {{{
"
" For pathogen.vim: auto load all plugins in .vim/bundle
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Set augroup
augroup MyAutoCmd
  autocmd!
augroup END

" auto generated file: filename~
set backup
set backupdir=$HOME/.vim/backup

if has ('vim_starting')
    set runtimepath+=~/.vim
endif

" ----------------------------------------------------------------------------
" [ Font, Theme & Color Setting ]                                              {{{
"
" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

" set background=dark
" set background=light

if has("gui_running")
    colorscheme molokai
    set guioptions-=T
    set gfn=Consolas:h14
    set gfn=Monospace\ 10
else
    " Light
    " colorscheme summerfruit256
    " colorscheme Tomorrow

    " Dark
    " colorscheme jellybeans
    " colorscheme desert256
    " colorscheme luna
    " colorscheme lucius

    " {{{
    " let g:pencil_higher_contrast_ui = 0   " 0=low (def), 1=high
    " let g:pencil_neutral_headings = 1   " 0=blue (def), 1=normal
    " let g:airline_theme = 'pencil'
    " colorscheme pencil
    " }}}

    "{{{ molokai
    colorscheme molokai
    let g:molokai_original = 1
    let g:rehash256 = 1
    "}}}
endif
"
" [ Font, Theme & Color Setting ]                                           }}}

" Searching
set hlsearch        " enable search highlight globally
set showmatch       " show matching brackets when typing
set incsearch       " do incremental searching
set ignorecase      " ignore case
set smartcase       " but don't ignore it, when search string contains
set noshowmatch     " Don't show matching brackets
set showcmd         " display incomplete commands

set magic           " Make regex a little easier to type

" Text display settings
set autoindent      " Auto Indent
set smartindent     " Smart Indent
set cindent         " C-style Indent
set nowrap
" set whichwrap+=h,l,<,>,[,]
" set textwidth=78    " Set text width
" set linebreak

" Tab settings
set smarttab        " Smart handling of the tab key
set expandtab       " Use spaces for tabs
set shiftround      " Round indent to multiple of shiftwidth
set shiftwidth=4    " Number of spaces for each indent
set tabstop=4       " Number of spaces for tab key

set history=10000   " keep 200 lines of command line history
set ruler           " show the cursor position all the time

set lazyredraw      " Do not redraw while running macros

"set list           " display unprintable with '^' and put $ after the line.
set confirm
set number          " Turn on line number
set numberwidth=1   " Min width of the number column to the left

" Turn off sound
set visualbell
set t_vb=

set scrolloff=4     " 6 lines bevore and after the current line when scrolling
set sidescrolloff=10

set hidden

"in ESC: (command mode), disbled auto completion next part, Cool!
set wildmode=list:longest,full
set wildmenu        "turn on wild menu
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
" set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/Library/**,*/.rbenv/**
set wildignore+=*/.nx/**,*.app

" folding
set foldmethod=marker
set foldlevelstart=99
set foldlevel=1000
set foldnestmax=5

" file encoding setting
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8

" tmux will send xterm-style keys when its xterm-keys option is on
if &term =~ '^screen'
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

" Solid line for vsplit separator
" set fcs=vert:│

set splitright      "splitting a window will put the right

" Give one virtual space at end of line
" set virtualedit=onemore

" listchar=trail is not as flexible, use the below to highlight trailing
" whitespace. Don't do it for unite windows or readonly files
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
augroup MyAutoCmd
    autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
    autocmd BufWinEnter * if &modifiable && &ft!='unite' | match ExtraWhitespace /\s\+$/ | endif
    autocmd InsertEnter * if &modifiable && &ft!='unite' | match ExtraWhitespace /\s\+\%#\@<!$/ | endif
    autocmd InsertLeave * if &modifiable && &ft!='unite' | match ExtraWhitespace /\s\+$/ | endif
    autocmd BufWinLeave * if &modifiable && &ft!='unite' | call clearmatches() | endif
augroup END

" Allow backspacing over these
set backspace=indent,eol,start

" colorcolumn
if v:version >= 703
    :set colorcolumn=80
    :hi colorcolumn guibg=lightgreen
endif

" Favorite file types
filetype plugin indent on
syntax on
set ffs=unix,dos,mac

hi Folded ctermbg=237

"show CursorLine
highlight CursorLine guifg=red guibg=background
set cursorline

"  Status Line
set ls=2
set statusline=\ [%F]
set statusline+=\ [%{&encoding}, " encoding
set statusline+=%{&fileformat}]%m " file format
set statusline+=%=\ %y\ %l,\ %c\ \<\ %P\ \>

" Change special highlight
highlight Search term=reverse ctermbg=4 ctermfg=7

" Spelling highlights. Use underline in term to prevent cursorline highlights
" from interfering
if !has("gui_running")
  hi clear SpellBad
  hi SpellBad cterm=underline ctermfg=red
  hi clear SpellCap
  hi SpellCap cterm=underline ctermfg=blue
  hi clear SpellLocal
  hi SpellLocal cterm=underline ctermfg=blue
  hi clear SpellRare
  hi SpellRare cterm=underline ctermfg=blue
endif

" Cursor settings. This makes terminal vim sooo much nicer!
" Tmux will only forward escape sequences to the terminal if surrounded by a DCS
" sequence
"if exists('$TMUX')
"  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
"else
"  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"endif

"replace 'SHIFT+:' with ';' COOL!
noremap ; :

" disable direct-key
nnoremap <up> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <down> <nop>

" -----------------------------------------------------------------------------
" [ Mouse + gVim-Killer Related Setting ]                                   {{{
"
" This is AWESOME, INCREDIBLE! Could be used do Tab-Click, window resizing, scrolling...

" use mouse in xterm to scroll
set mouse=nv

" To function correctly in Screen
set ttymouse=xterm

" ,p and shift-insert will paste the X buffer, even on the command line
nmap <LocalLeader>p i<S-MiddleMouse><ESC>
imap <S-Insert> <S-MiddleMouse>
cmap <S-Insert> <S-MiddleMouse>

" this makes the mouse paste a block of text without formatting it
map <MouseMiddle> <esc>"*p

" Enable block-mode selection
noremap <C-LeftMouse> <LeftMouse><Esc><C-V>
noremap <C-LeftDrag> <LeftDrag>
"
" [ Mouse + gVim-Killer Related Setting ]                                   }}}
"
" -----------------------------------------------------------------------------
" [ Abbreviations ]                                                         {{{
"
" command mode : cabbrev
" insert mode : iabbr
" Remove : una, cuna, iuna
"
cabbrev vds vertical diffsplit
cabbrev hds diffsplit

" Force to split right!
cabbrev h help
cabbrev vh vertical help
"
" [ Abbreviations ]                                                         }}}
"
" [ General Setting ]                                                       }}}
" =============================================================================

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
    let mapleader = ","
    let g:mapleader = ","

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
    " <Leader>x VisualTraditional EnhancedCommentify.vim
    " <Leader>c VisualTraditionalj EnhancedCommentify.vim
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
    inoremap <c-v> <c-g>u<c-o>gP

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
    cnoremap <c-v> <c-r>"

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

" =============================================================================
" [ Programming Related ]                                  {{{

    " -------------------------------------------------------------------------
    " [ General ] {{{
    "
    " Remove unnecessary spaces in the end of line
    " augroup MyAutoCmd
        " autocmd FileType vala,perl,python,html,js autocmd FileWritePre,BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
    " augroup End

    function! YPRemoveTailingSpace()
        :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
    endfunction
    command! YPRemoveTailingSpace call YPRemoveTailingSpace()
    " }}}

    " -------------------------------------------------------------------------
    " [ sh ]                                                                {{{
    "
    function! s:sh_custom()
        noremap <F2> :% w !bash<CR>
        " autocmd MyAutoCmd FileWritePre,BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
    endfunction

    if has("autocmd")
        augroup MyAutoCmd
            autocmd Filetype sh call s:sh_custom()
        augroup END
    endif
    " }}}

    " -------------------------------------------------------------------------
    " [ csv ]                                                               {{{
    "
    function! s:csv_custom()
        setlocal cc=0
    endfunction

    if has("autocmd")
        augroup MyAutoCmd
            autocmd Filetype csv call s:csv_custom()
        augroup END
    endif
    " }}}

    " -------------------------------------------------------------------------
    " [ python ]                                                            {{{
    "
    function! s:python_custom()
        function! s:man(keyword)
            execute '!pydoc ' . a:keyword
        endfunction
        command! -nargs=1 Man call s:man(<f-args>)
        nnoremap K :!pydoc <cword><CR>

        setlocal tabstop=4 shiftwidth=4
        setlocal foldmethod=indent foldcolumn=4 foldlevel=3 foldnestmax=3

        iabbr iii import IPython; IPython.embed()
        iabbr ddd import pdb; pdb.set_trace()

        noremap <F2> :% w !python<CR>
        " let g:pymode_lint_write = 0
        let g:syntastic_python_checkers = 0
    endfunction

    if has("autocmd")
        augroup MyAutoCmd
            autocmd Filetype python call s:python_custom()
        augroup END
    endif
    " }}}

    " -------------------------------------------------------------------------
    " [ golang ]                                                                {{{
    "
    function! s:go_custom()
        noremap <F2> :% w !go run %<CR>
        au FileType go map <leader>t :Tmux go test<CR>
    endfunction

    if has("autocmd")
        augroup MyAutoCmd
            autocmd Filetype go call s:go_custom()
        augroup END
    endif
    " }}}

    " -------------------------------------------------------------------------
    " [ ls ]                                                                {{{
    "
    function! s:ls_custom()
        set expandtab      " Use spaces for tabs
        noremap <F2> :% w !lsc %<CR>
        augroup MyAutoCmd
            " autocmd FileType ls autocmd FileWritePre,BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
        augroup END
    endfunction

    if has("autocmd")
        augroup MyAutoCmd
            autocmd Filetype ls call s:ls_custom()
        augroup END
    endif
    " }}}

    " -------------------------------------------------------------------------
    " [ haskell ]                                                                 {{{
    "

    autocmd BufEnter *.hs compiler ghc
    let g:ghc="/usr/bin/ghc"
    let g:haddock_browser="/home/blue119/iOpt/stow/firefox-bin/bin/firefox"

    function! s:hs_custom()
        " Tab specific option
        set tabstop=8                   "A tab is 8 spaces
        set expandtab                   "Always uses spaces instead of tabs
        set softtabstop=4               "Insert 4 spaces when tab is pressed
        set shiftwidth=4                "An indent is 4 spaces
        set shiftround                  "Round indent to nearest shiftwidth multiple

    endfunction

    if has("autocmd")
        augroup MyAutoCmd
            autocmd Filetype hs,haskell call s:hs_custom()
        augroup END
    endif
    " }}}

    " -------------------------------------------------------------------------
    " [ c ]                                                                 {{{
    "
    function! s:c_custom()
        " http://stackoverflow.com/questions/729249/how-to-efficiently-make-with-vim
        "set makeprg=make
        "set errorformat=%f:%l:\ %m
        setlocal equalprg=indent
        setlocal expandtab

        let g:syntastic_cpp_compiler_options = ' -std=c++14 -stdlib=libc++'

        " color/paged man
        runtime! ftplugin/man.vim
        nmap K <esc>:Man <cword><cr>
    endfunction

    if has("autocmd")
        augroup MyAutoCmd
            autocmd Filetype c,cpp call s:c_custom()
        augroup END
    endif
    " }}}

    " -------------------------------------------------------------------------
    " [ Javascript ]                                                       {{{
    "
    " json = javascript syntax highlight
    " if has("autocmd")
        " augroup MyAutoCmd
            " autocmd FileType json setlocal syntax=javascript
        " augroup END
    " endif
    " }}}

    " -------------------------------------------------------------------------
    " [ vim-cpp-enhanced-highlight ]                                                       {{{
    "
    let g:cpp_class_scope_highlight = 1
    " let g:cpp_experimental_template_highlight = 1
    " }}}

    " -------------------------------------------------------------------------
    " [ HTML/xHTML]                                                       {{{
    "
    function! s:html_custom()
        set makeprg=wkhtmltopdf\ %\ /tmp/%<.pdf
    endfunction

    if has("autocmd")
        augroup MyAutoCmd
            autocmd Filetype html,xhtml call s:html_custom()
        augroup END
    endif
    " }}}

    " -------------------------------------------------------------------------
    " [ vala ]                                                             {{{
    "
    augroup MyAutoCmd
        autocmd BufRead *.vala set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
        autocmd BufRead *.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
    augroup END
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
    " }}}

    " -------------------------------------------------------------------------
    " [ Hex/Binary Edit ]                                       {{{
    "
    " autocmds to automatically enter hex mode and handle file writes properly
    if has("autocmd")
    " vim -b : edit binary using xxd-format!
        augroup MyAutoCmd
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
    command! -bar Hexmode call ToggleHex()

    " helper function to toggle hex mode
    function! ToggleHex()
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
    "nnoremap <C-x> :Hexmode<CR>
    " }}}

" [ Programming Related ]                                  }}}
" =============================================================================

" =============================================================================
" [ Plugin configuration ]                                  {{{
"
    " -------------------------------------------------------------------------
    " [ cs-mgmt.vim ]                                                      {{{
    "
    " let g:CsMgmtDebugEnable = 1
    let g:CsMgmtCscopeEnable = 1
    let g:CsMgmtCtagsEnable = 1
    let g:CsMgmtReAttach = 1
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
    let g:acp_enableAtStartup = 0
    " }}}
    "
    " -------------------------------------------------------------------------
    " [ Auto Commplete Pop: ACP ]                                           {{{
    "
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<tab>"
    let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
    " }}}
    "
    " -------------------------------------------------------------------------
    " [ Ack ]                                                {{{
    "
    if executable("ag")
        let g:ackprg = 'ag --nogroup --nocolor --column'
    endif

    " nnoremap <silent> <leader>a/ :Ack<CR><C-R><C-W>
    nnoremap <silent> <leader>a/ :Ack<CR>
    " let g:EnhCommentify = 'Yes'
    " }}}
    "
    " -------------------------------------------------------------------------
    " [ EnhancedCommentify ]                                                {{{
    "
    let g:EnhCommentifyRespectIndent = 'Yes'
    let g:EnhCommentifyPretty = 'Yes'
    let g:EnhCommentifyMultiPartBlocks = 'Yes'
    let g:EnhCommentifyAlignRight = 'Yes'
    " let g:EnhCommentify = 'Yes'
    " }}}
    "
    " -------------------------------------------------------------------------
    " [ bufExplorer plugin ]                                                {{{
    "
    let g:bufExplorerDefaultHelp = 0
    let g:bufExplorerShowRelativePath = 1
    let g:bufExplorerSortBy = "fullpath"
    nnoremap <leader>o :BufExplorer<cr>
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
    " http://goo.gl/Uq95Wj #Unite.vim, the Plugin You Didn't Know You Need
    "

    call unite#filters#matcher_default#use(['matcher_fuzzy'])
    call unite#filters#sorter_default#use(['sorter_rank'])
    " call unite#set_profile('files', 'smartcase', 1)
    let g:unite_enable_start_insert        = 0
    let g:unite_enable_ignore_case         = 1
    let g:unite_enable_smart_case          = 1
    let g:unite_source_rec_max_cache_files = 5000
    let g:unite_source_rec_async_command   = 'ag --nocolor --nogroup --hidden -g ""'
    let g:unite_data_directory             = '~/.vim/.cache'
    let g:unite_prompt                     = '» '

    if executable('ag')
        let g:unite_source_grep_command='ag'
        let g:unite_source_grep_default_opts='--nocolor --nogroup --column'
        let g:unite_source_grep_recursive_opt=''
    elseif executable('ack-grep')
        let g:unite_source_grep_command='ack-grep'
        let g:unite_source_grep_default_opts='--no-group --no-color'
        let g:unite_source_grep_recursive_opt=''
    else
        let g:unite_source_grep_default_opts = '-iRHn'
    endif
    let g:unite_source_grep_max_candidates = 200

    function! s:unite_settings()
        imap <buffer> <C-j>   <Plug>(unite_select_next_line)
        imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
    endfunction
    autocmd FileType unite call s:unite_settings()
    nnoremap [unite] <Nop>
    nmap <Leader>u [unite]

    " File searching like ctrlp.vim
    nnoremap <C-p> :Unite -start-insert file_rec/async buffer<CR>

    " shortcup
    nnoremap <silent> [unite]m :Unite -start-insert mapping<CR>

    " Execute help.
    nnoremap <silent> [unite]h :Unite -start-insert help<CR>

    " outline
    nnoremap <leader>uo :Unite outline<CR>

    " Content searching like ack.vim
    nnoremap <silent> [unite]/ :Unite vimgrep:**<cr>
    nnoremap <silent> [unite]g :Unite grep:. -buffer-name=search-buffer`<cr>
    " カーソル位置の単語をgrep検索
    nnoremap <silent> [unite]cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>

    " grep検索結果の再呼出
    nnoremap <silent> [unite]rg :UniteResume search-buffer<cr>

    " Yank history like yankring
    let g:unite_source_history_yank_enable = 1
    nnoremap <silent> [unite]y :Unite history/yank<CR>

    " Buffer switching like LustyJuggler
    nnoremap <silent> [unite]b :Unite -quick-match buffer<cr>
    " nnoremap <silent> [unite]b :Unite buffer<CR>

    nnoremap <silent> [unite]f :UniteWithBufferDir -buffer-name=files file<CR>
    nnoremap <silent> [unite]r :Unite file_mru<CR>
    nnoremap <silent> [unite]y :Unite -buffer-name=register register<CR>
    nnoremap <silent> [unite]a :Unite UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

    " }}}
    "
    " -------------------------------------------------------------------------
    " [ vimfiler ]                                                         {{{
    "
    let g:vimfiler_as_default_explorer = 1
    let g:vimfiler_enable_auto_cd = 1
    let g:vimfiler_split_rule = "topleft"
    let g:vimfiler_split_action = 'right'
    " }}}
    "
    " -------------------------------------------------------------------------
    " [ yankring ]                                                         {{{
    "
    let g:yankring_history_file = '.yankring_history'
    " }}}
    "
    " -------------------------------------------------------------------------
    " [ vim-indent-guides ]                                                {{{
    "
    let g:indent_guides_auto_colors = 0
    let g:indent_guides_start_level = 2
    let g:indent_guides_guide_size = 1
    hi IndentGuidesOdd  ctermbg=black
    hi IndentGuidesEven ctermbg=darkgrey
    " }}}
    "
    " -------------------------------------------------------------------------
    " [ NERD_TREE ]                                                        {{{
    "
    let NERDTreeChDirMode=2
    nnoremap <Leader>nt :NERDTreeToggle<CR>
    " }}}
    "
    " -------------------------------------------------------------------------
    " [ EasyGrep ]                                                         {{{
    "
    "Grep 'pattern' in the indicate range (need EasyGrep.vim plugin)
    "map <F3> <ESC>\vv
    let g:EasyGrepRecursive = 1
    let g:EasyGrepIgnoreCase= 0
    let g:EasyGrepJumpToMatch= 1
    " }}}
    "
    " -------------------------------------------------------------------------
    " [ Tag List ]                                                         {{{
    "
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
    "
    " -------------------------------------------------------------------------
    " [ DoxygenToolkit.vim ]                                               {{{
    "
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
    " }}}
    "
    " -------------------------------------------------------------------------
    " [ tagbar ]                                                     {{{
    "
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
        let g:tagbar_autofocus = 1
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
    " let g:airline_theme='wombat'
    let g:airline_enable_branch=1
    let g:airline_enable_syntastic=1
    let g:airline_detect_paste=1

    let g:airline_theme='tomorrow'
    let g:airline_powerline_fonts = 1
    if ! has('gui_running')
        set ttimeoutlen=10
        augroup MyAutoCmd
            au InsertEnter * set timeoutlen=0
            au InsertLeave * set timeoutlen=1000
        augroup END
    endif

    " Always show statusline
    set laststatus=2

    " Hide the default mode text (e.g. -- INSERT -- below the statusline)
    set noshowmode

    " unicode symbols
    " let g:airline_left_sep = '»'
    " let g:airline_left_sep = '▶'
    " let g:airline_right_sep = '«'
    " let g:airline_right_sep = '◀'
    " let g:airline_linecolumn_prefix = '␊ '
    let g:airline_linecolumn_prefix = '␤ '
    " let g:airline_linecolumn_prefix = '¶ '
    let g:airline#extensions#branch#symbol = '⎇ '
    let g:airline#extensions#paste#symbol = 'ρ'
    " let g:airline#extensions#paste#symbol = 'Þ'
    " let g:airline#extensions#paste#symbol = '∥'
    let g:airline#extensions#whitespace#symbol = 'Ξ'

    " powerline symbols
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    " let g:airline#extensions#branch#symbol = ' '
    " let g:airline#extensions#readonly#symbol = ''
    " let g:airline_linecolumn_prefix = ' '
    " }}}

    " -------------------------------------------------------------------------
    " [ rooter ]                                                            {{{
    "
    " To stop vim-rooter changing directory automatically
    let g:rooter_manual_only = 1

    " :lcd instead of :cd
    " let g:rooter_use_lcd = 1

    " own directory and file patterns like this:
    " let g:rooter_patterns = ['Rakefile', '.git/']
    " }}}

    " -------------------------------------------------------------------------
    " [ neocomplete ]                                                            {{{
    " https://github.com/Shougo/neocomplete.vim
    "
    " Disable AutoComplPop.
    " let g:acp_enableAtStartup = 0
    " Use neocomplete.
    let g:neocomplete#enable_at_startup = 1
    " Use smartcase.
    let g:neocomplete#enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

    " Define dictionary.
    let g:neocomplete#sources#dictionary#dictionaries = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

    " Define keyword.
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplete#undo_completion()
    inoremap <expr><C-l>     neocomplete#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
      return neocomplete#close_popup() . "\<CR>"
      " For no inserting <CR> key.
      "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
    endfunction

    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplete#close_popup()
    inoremap <expr><C-e>  neocomplete#cancel_popup()

    " Close popup by <Space>.
    "inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

    " For cursor moving in insert mode(Not recommended)
    "inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
    "inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
    "inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
    "inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"

    " Or set this.
    "let g:neocomplete#enable_cursor_hold_i = 1
    " Or set this.
    "let g:neocomplete#enable_insert_char_pre = 1

    " AutoComplPop like behavior.
    "let g:neocomplete#enable_auto_select = 1

    " Shell like behavior(not recommended).
    "set completeopt+=longest
    "let g:neocomplete#enable_auto_select = 1
    "let g:neocomplete#disable_auto_complete = 1
    "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

    " Enable heavy omni completion.
    if !exists('g:neocomplete#sources#omni#input_patterns')
      let g:neocomplete#sources#omni#input_patterns = {}
    endif
    "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
    "
    " }}}

    " -------------------------------------------------------------------------
    " [ makr.vim ]                                                          {{{
    "
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
    " }}}

    " -------------------------------------------------------------------------
    " [ supertab ]                                                          {{{
    "
    "   let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
        let g:SuperTabDefaultCompletionType = "context"
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

" =============================================================================
" [ Functions & autocmd ]                                                  {{{
"
    " -------------------------------------------------------------------------
    " set vim to chdir for each file                                       {{{
    " if exists('+autochdir')
        " set autochdir
    " else
        augroup MyAutoCmd
            autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
        augroup END
    " endif
    " }}}

    " -------------------------------------------------------------------------
    " Automatically update 'Last Modified' field {{{
    " If buffer modified, update any 'Last modified: ' in the first 20 lines.
    "
    " function! LastModified()
    "   if &modified
    "     normal ms
    "     let n = min([20, line("$")])
    "     exe '1,' . n . 's#^\(.\{,10}Last Modified: \).*#\1' .
    "           \ strftime('%a %b %d, %Y  %I:%M%p') . '#e'
    "     normal `s
    "   endif
    " endfun
    " autocmd BufWritePre * call LastModified()
    " }}}

    " -------------------------------------------------------------------------
    " Remember the line number been edited last time {{{
    if has("autocmd")
        augroup MyAutoCmd
            autocmd BufRead *.txt set tw=78
            autocmd BufReadPost *
            \ if line("'\"") > 0 && line ("'\"") <= line("$") |
            \   exe "normal g'\"" |
            \ endif

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
        augroup END
    endif
    " }}}

    " -------------------------------------------------------------------------
    " QUICKFIX WINDOW for :make {{{
    function! QFixToggle(forced)
        if exists("g:qfix_win") && a:forced == 0
            cclose
            unlet g:qfix_win
        else
            copen 6
            let g:qfix_win = bufnr("$")
        endif
    endfunction

    command! -bang -nargs=? QFix call QFixToggle(<bang>0)
    nnoremap <leader>q :QFix<CR>
    " nnoremap <C-n> :cnext<CR>
    " nnoremap <C-p> :cprev<CR>
    " }}}

    " -------------------------------------------------------------------------
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

    autocmd MyAutoCmd CursorMoved * call ColumnHighlight()
    " }}}

    " -------------------------------------------------------------------------
    " vim macro to jump to devhelp topics. {{{
    "
    "function! DevHelpCurrentWord()
    "    let word = expand("<cword>")
    "    exe "!devhelp -s " . word
    "endfunction
    "
    "nmap hdh :call DevHelpCurrentWord()<CR>
    " }}}

"
" [ Functions & autocmd ]                                                  }}}
" =============================================================================

" =============================================================================
" [ MISC ]                                                                 {{{
"
    "  Search code sample from Google code                                 {{{
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
    " map <LocalLeader>k :call OnlineDoc()<CR>
    " }}}

    " vim as a calcuator"                                                  {{{
    :command! -nargs=+ Calc :py print <args>
    :py from math import *
    " }}}

    " Script test                                                          {{{
    "
    " function! CapitalizeCenterAndMoveDown()
        " s/\<./\u&/g "Built-in substitution capitalizes each word
        " center      "Built-in center command centers entire line
        " +1          "Built-in relative motion (+1 line down)
    " endfunction

    " nmap <silent><LocalLeader>C :call CapitalizeCenterAndMoveDown()<CR>
    " }}}
"
" [ MISC ]                                                                 }}}
" =============================================================================

" vim:fdm=marker:et:fdl=0:

