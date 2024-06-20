" Use 256 colours (Use this setting only if your terminal supports 256 colours)
" set t_Co=256
"
" if has('gui_running')
"     colorscheme molokai
"     set guioptions-=T
"     set guifont=Consolas:h14
"     set guifont=Monospace\ 10
    " Disable menu.vim
" set guioptions=Mc
" else
"     "{{{ molokai
"     let g:molokai_original = 1
"     let g:rehash256 = 1
"     colorscheme molokai
"     "}}}
" endif
" colorscheme nightfox
"show CursorLine
set cursorline
hi CursorLine term=bold cterm=bold guibg=background

hi Folded ctermbg=237

colorscheme kanagawa

" colorcolumn
set colorcolumn=120
hi colorcolumn guibg=darkred

" Spelling highlights. Use underline in term to prevent cursorline highlights from interfering
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
