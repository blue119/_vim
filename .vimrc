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

set background=dark

if has("gui_running")
    colorscheme molokai
    set guioptions-=T
    set gfn=Consolas:h14
    set gfn=Monospace\ 10
else
    " colorscheme jellybeans
    colorscheme molokai

    let g:molokai_original = 1
    let g:rehash256 = 1
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
set whichwrap+=h,l,<,>,[,]
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
set wildignore+=tmp/**
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

" Solid line for vsplit separator
" set fcs=vert:│

set splitright      "splitting a window will put the right

" Give one virtual space at end of line
set virtualedit=onemore

" listchar=trail is not as flexible, use the below to highlight trailing
" whitespace. Don't do it for unite windows or readonly files
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
augroup MyAutoCmd
  autocmd BufWinEnter * if &modifiable && &ft!='unite' | match ExtraWhitespace /\s\+$/ | endif
  autocmd InsertEnter * if &modifiable && &ft!='unite' | match ExtraWhitespace /\s\+\%#\@<!$/ | endif
  autocmd InsertLeave * if &modifiable && &ft!='unite' | match ExtraWhitespace /\s\+$/ | endif
  autocmd BufWinLeave * if &modifiable && &ft!='unite' | call clearmatches() | endif
augroup END

" Allow backspacing over these
set backspace=indent,eol,start  

" colorcolumn
if v:version >= 703
    :set cc=81
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
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

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
    nmap <F1> [unite]h

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
    map <F9> :set list!<bar>set list?<CR>

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
    nnoremap <Leader>1 :split<CR>

    " <Leader>3: vsplit 
    nnoremap <Leader>1 :vsplit<CR>

    " <Leader>a for Auto Commplete Pop: ACP
    " <Leader>b TODO
    " <Leader>c TODO
    " <Leader>cq for cscopequickfix
    " <Leader>d TODO
    " <Leader>e TODO
    " <Leader>f for vimgrep settings
    nnoremap <Leader>fv :exec 'vimgrep /\<'.expand('<cword>').'\>/g **/*.vala' <CR>
    nnoremap <Leader>fp :exec 'vimgrep /\<'.expand('<cword>').'\>/g **/*.py' <CR>
    nnoremap <Leader>fc :exec 'vimgrep /\<'.expand('<cword>').'\>/g **/*.[ch]' <CR>
    nnoremap <Leader>fn :cn <CR>
    nnoremap <Leader>fN :cp <CR>

    " <Leader>g TODO
    " <Leader>h for Edit(e) & Generate(g) help tags
    nnoremap <Leader>he :tabedit $HOME/.vim/doc/MyNote.txt <CR>
    nnoremap <Leader>hg :helptags $HOME/.vim/doc <CR>

    " <Leader>i TODO
    " <Leader>j TODO
    " <Leader>k TODO
    " <Leader>l TODO
    " <Leader>m TODO
    " <Leader>n Remap to mark 
    " <Leader>nt Remap to NERDTree
    " <Leader>o Remmap to bufExplorer
    " <Leader>p: Copy the full path of the current file to the clipboard
    nnoremap <silent> <Leader>p :let @+=expand("%:p")<cr>:echo "Copied current file
        \ path '".expand("%:p")."' to clipboard"<cr>

    " <Leader>q TODO
    " <Leader>r TODO
    " <Leader>s Spell Checking
    " <Leader>t for tag Operation
    " <Leader>u for unite
    " <Leader>v for View text file in two column
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

    " <Leader>w Fast saving
    nnoremap <leader>w :w!<cr>

    " <Leader>x TODO
    " <Leader>y TODO
    " <Leader>z TODO
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
    " -----------------------------------------------------------------------------
    " a: append text after the cursor N times
    " s: (substitute) delete N characters [into buffer x] and start insert
    " addition another search work hls
    map sa :exec "/\\(".getreg('/')."\\)\\\\|".expand("<cword>")<CR>

    " Add new keyword in search under cursor (*)
    map a* :exec "/\\(".getreg('/')."\\)\\\\|".expand("<cword>")<CR>

    " d: delete Nmove text [into buffer x]
    " dd: delete N lines [into buffer x]
    " f: cursor to Nth occurrence of {char} to the right
    " g: extended commands
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
    " #: search backward for the Nth occurrence of the ident under the cursor
    " $: cursor to the end of Nth next line
    " %: find the next (curly/square) bracket on this line and go to its match, or go to matching comment bracket, or go to matching preprocessor directive.
    " ^: cursor to the first CHAR of the line
    " &: repeat last :s
    " *: search forward for the Nth occurrence of the ident under the cursor
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
    " C: Deletes rest of line and go to insert mode
    " V: Visual line mode
    " B: Move word backward (TODO Replaced by <C-H>, maybe remap?)
    " N: Remap to 'Find next occurrence backward'
    nnoremap N Nzzzv

    " M: Move cursor to mid screen
    " <: Indent left
    " >: Indent right
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
    " Ctrl-p: same as k
    " Ctrl-[: Esc
    " Ctrl-]: Go forward in tag stack
    " Ctrl-\: TODO
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
    " Ctrl-n: same as "j"
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
    vnoremap <tab> >gv
    vnoremap <s-tab> <gv
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
    nnoremap <C-m> <C-w>_<C-w><Bar> 
    nnoremap <C-=> <C-w>= 
    nnoremap - <C-w>-
    nnoremap = <C-w>+
    " Define different behavior in left/right window
    if has("autocmd")
        augroup MyAutoCmd
            autocmd BufEnter,BufLeave *
            \     if winnr() == 1 |
            \        nmap < <C-w><|
            \        nmap > <C-w>>|
            \     else            |
            \        nmap < <C-w>>|
            \        nmap > <C-w><|
            \     endif           |
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
    nmap ,d :DiffSaved<CR>

    "DirDiff
    let g:DirDiffExcludes = "*.git,*.svn,.*.swp,tags,cscope.*"
    let g:DirDiffWindowSize = 10

    " WinMerge-style (Alt + hjkl) mapping for vimdiff
    nmap j ]c
    nmap k [c
    nmap h do
    nmap l dp
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
    " [ cs-mgmt.vim ]                                                      {{{
    "
    let g:CsMgmtCtags = 1
    let g:CsMgmtReAttach = 1
    " [ cs-mgmt.vim ]                                                      }}}

    " -------------------------------------------------------------------------
    " [ cscope ]                                                           {{{
    "
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
    " [ cscope ]                                                           }}}

    " -------------------------------------------------------------------------
    " [ Javascript ]                                                       {{{
    "
    " json = javascript syntax highlight
    augroup MyAutoCmd
        autocmd FileType json setlocal syntax=javascript
    augroup END
    " [ Javascript ]                                                       }}}

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
    " [ vala ]                                                             }}}
    
    " -------------------------------------------------------------------------
    " [ Auto Commplete Pop: ACP ]                                           {{{
    "
    nnoremap <Leader>af :AcpDisable<CR>
    nnoremap <Leader>an :AcpEnable<CR>
    " let g:acp_behaviorSnipmateLength = 1

    augroup MyAutoCmd
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
        autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
        autocmd FileType java setlocal omnifunc=eclim#java#complete#CodeComplete
    augroup END
    " [ Auto Commplete Pop: ACP ]                                           }}}
    
    " -------------------------------------------------------------------------
    " [ EnhancedCommentify ]                                                {{{
    "
    let g:EnhCommentifyRespectIndent = 'Yes'
    let g:EnhCommentifyPretty = 'Yes'
    let g:EnhCommentifyMultiPartBlocks = 'Yes'
    let g:EnhCommentifyAlignRight = 'Yes'
    " let g:EnhCommentify = 'Yes'
    " [ EnhancedCommentify ]                                                }}}

    " -------------------------------------------------------------------------
    " [ bufExplorer plugin ]                                                {{{
    "
    let g:bufExplorerDefaultHelp = 0
    let g:bufExplorerShowRelativePath = 1
    let g:bufExplorerSortBy = "fullpath"
    nnoremap <leader>o :BufExplorer<cr>
    " [ bufExplorer plugin ]                                                }}}
    
    " -------------------------------------------------------------------------
    " [ CtrlP ]                                                             {{{
    "
    let g:ctrlp_working_path_mode = 'ra'
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip
    let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
    " let g:ctrlp_custom_ignore = {
        " \ 'dir':  '\v[\/]\.(git|hg|svn)$',
        " \ 'file': '\v\.(exe|so|dll)$',
        " \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
        " \ }
    let g:ctrlp_user_command = 'find %s -type f'
    " [ CtrlP ]                                                             }}}
    
    " -------------------------------------------------------------------------
    " [ unite ]                                                             {{{
    " http://goo.gl/Uq95Wj #Unite.vim, the Plugin You Didn't Know You Need
    "
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
    " [ unite ]                                                             }}}
    
    " -------------------------------------------------------------------------
    " [ Hex/Binary Edit ]                                       {{{
    "
    " autocmds to automatically enter hex mode and handle file writes properly
   "if has("autocmd")
   "" vim -b : edit binary using xxd-format!
   "    augroup MyAutoCmd
   "        au!
   "        au BufReadPre *.bin,*.hex,*.pkg,*.img,*.out setlocal binary
   "        au BufReadPost *
   "            \ if &binary | Hexmode | endif
   "        au BufWritePre *
   "            \ if exists("b:editHex") && b:editHex && &binary |
   "            \  let oldro=&ro | let &ro=0 |
   "            \  let oldma=&ma | let &ma=1 |
   "            \  exe "%!xxd -r" |
   "            \  let &ma=oldma | let &ro=oldro |
   "            \  unlet oldma | unlet oldro |
   "            \ endif
   "        au BufWritePost *
   "            \ if exists("b:editHex") && b:editHex && &binary |
   "            \  let oldro=&ro | let &ro=0 |
   "            \  let oldma=&ma | let &ma=1 |
   "            \  exe "%!xxd" |
   "            \  exe "set nomod" |
   "            \  let &ma=oldma | let &ro=oldro |
   "            \  unlet oldma | unlet oldro |
   "            \ endif
   "    augroup END
   "endif

   "" ex command for toggling hex mode - define mapping if desired
   "command! -bar Hexmode call ToggleHex()
   "" helper function to toggle hex mode
   "function ToggleHex()
   "    " hex mode should be considered a read-only operation
   "    " save values for modified and read-only for restoration later,
   "    " and clear the read-only flag for now
   "    let l:modified=&mod
   "    let l:oldreadonly=&readonly
   "    let &readonly=0
   "    let l:oldmodifiable=&modifiable
   "    let &modifiable=1
   "    if !exists("b:editHex") || !b:editHex
   "        " save old options
   "        let b:oldft=&ft
   "        let b:oldbin=&bin
   "        " set new options
   "        setlocal binary " make sure it overrides any textwidth, etc.
   "        let &ft="xxd"
   "        " set status
   "        let b:editHex=1
   "        " switch to hex editor
   "        %!xxd
   "    else
   "        " restore old options
   "        let &ft=b:oldft
   "        if !b:oldbin
   "            setlocal nobinary
   "        endif
   "        " set status
   "        let b:editHex=0
   "        " return to normal editing
   "        %!xxd -r
   "    endif
   "    " restore values for modified and read only state
   "    let &mod=l:modified
   "    let &readonly=l:oldreadonly
   "    let &modifiable=l:oldmodifiable
   "endfunction

   "nnoremap <C-x> :Hexmode<CR>
    " [ Hex/Binary Edit ]                                       }}}

" [ Programming Related ]                                  }}}
" =============================================================================

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
    nnoremap <Leader>nt :NERDTreeToggle<CR>
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

    """"""""""""""""""""""""""""""
    " => powerline {{{
    """"""""""""""""""""""""""""""
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

    " }}}

    """"""""""""""""""""""""""""""
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
    set completeopt=longest,menuone

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
    augroup MyAutoCmd
        autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
    augroup END
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" QUICKFIX WINDOW for :make {{{
command! -bang -nargs=? QFix call QFixToggle(<bang>0)
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
augroup MyAutoCmd
    autocmd FileType vala,perl,python,html,js autocmd FileWritePre,BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
augroup End
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

autocmd MyAutoCmd CursorMoved * call ColumnHighlight()
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd Filetype sh call s:sh_custom) {{{
function! s:sh_custom()
    noremap <F2> :% w !bash<CR>
    autocmd MyAutoCmd FileWritePre,BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
endfunction
if has("autocmd")
    autocmd MyAutoCmd Filetype sh call s:sh_custom()
endif
" }}}

" autocmd Filetype csv call {{{
function! s:csv_custom()
    setlocal cc=0
endfunction
if has("autocmd")
    autocmd MyAutoCmd Filetype csv call s:csv_custom()
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

    autocmd MyAutoCmd FileType python setl omnifunc=pythoncomplete#Complete
    " setlocal tabstop=4 noexpandtab shiftwidth=4
    setlocal tabstop=4 shiftwidth=4
    setlocal foldmethod=indent foldcolumn=4 foldlevel=3 foldnestmax=3

    " imap iii import IPython; IPython.Shell.IPShellEmbed()()
    imap iii import IPython; IPython.embed()
    imap ddd import pdb; pdb.set_trace()
    noremap <F2> :% w !python<CR>

endfunction
if has("autocmd")
    autocmd MyAutoCmd Filetype python call s:python_custom()
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
    autocmd MyAutoCmd Filetype go call s:go_custom()
endif
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd Filetype ls call s:ls_custom) {{{
function! s:ls_custom()
    noremap <F2> :% w !lsc %<CR>
    autocmd MyAutoCmd FileType ls autocmd MyAutoCmd FileWritePre,BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

endfunction
set expandtab      " Use spaces for tabs
if has("autocmd")
    autocmd MyAutoCmd Filetype ls call s:ls_custom()
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
    autocmd MyAutoCmd Filetype c call s:c_custom()
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
