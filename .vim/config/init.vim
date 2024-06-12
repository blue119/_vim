
" Vim Initialization
" ------------------

" Global Mappings "{{{
let g:mapleader = ','
let g:maplocalleader='\\'

" Release keymappings prefixes, evict entirely for use of plug-ins.
nnoremap <Space>  <Nop>
xnoremap <Space>  <Nop>
nnoremap ,        <Nop>
xnoremap ,        <Nop>
nnoremap ;        <Nop>
xnoremap ;        <Nop>
" nnoremap m        <Nop>
" xnoremap m        <Nop>

" }}}
"
" Ensure cache directory "{{{
if ! isdirectory(expand($VARPATH))
	" Create missing dirs i.e. cache/{undo,backup}
	call mkdir(expand('$VARPATH/undo'), 'p')
	call mkdir(expand('$VARPATH/backup'))
	call mkdir(expand('$VARPATH/swp'))
endif
" }}}
"

" Load less plugins while SSHing to remote machines {{{
" if len($SSH_CLIENT)
    " let $VIM_MINIMAL = 1
" endif
" }}}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
