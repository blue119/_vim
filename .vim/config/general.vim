let g:make = 'gmake'
if system('uname -o') =~ '^GNU/'
    let g:make = 'make'
endif


" auto generated file: filename~
set backup
set backupdir=$HOME/.vim/backup

" List of directory names for the swap file, separated with commas.
set dir=$HOME/.vim/swp


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
set textwidth=78    " Set text width
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
if !has('nvim')
    set ttymouse=xterm
endif

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

