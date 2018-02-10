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

    " Dark
    " colorscheme desert256
    " colorscheme luna

    " {{{
    " let g:pencil_higher_contrast_ui = 0   " 0=low (def), 1=high
    " let g:pencil_neutral_headings = 1   " 0=blue (def), 1=normal
    " let g:airline_theme = 'pencil'
    " colorscheme pencil
    " }}}

    "{{{ molokai
    let g:molokai_original = 1
    let g:rehash256 = 1
    colorscheme molokai
    "}}}
endif
"
" [ Font, Theme & Color Setting ]                                           }}}
"
