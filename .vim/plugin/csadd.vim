" http://vimdoc.sourceforge.net/htmldoc/if_pyth.html
" http://brainacle.com/how-to-write-vim-plugins-with-python.html
" http://www.slideshare.net/c9s/vim-script-programming

if !has('python3')
  echo "Error: Required vim compiled with +python"
  finish
endif

if !has('cscope')
  echo "Error: Required cscope"
  finish
endif

" Vim comments start with a double quote.
" Function definition is VimL. We can mix VimL and Python in
" function definition.
function! CSADD(CPNT, ...)

" We start the python code like the next line.
python3 << EOF
import vim, os, sys
from copy import copy

# CREATE_DB_SCRIPT = "/home/blue119/iSoftware/bin/csupdate.sh"
try:
  # vim.current.buffer is the current buffer. It's list-like object.
  # each line is an item in the list. We can loop through them delete
  # them, alter them etc.
  # Here we delete all lines in the current buffer

  PWD = os.getcwd()
  cscope_db_path = "cscope_db/"
  cpnt_transform = {"zd":"controller", "ap":"video54", "kernel":"atheros", "app":"apps"}
  prjs = ["ml", "toronto", "toronto_kddi"]

  if len(PWD.split('/work/')) > 1:
      #del vim.current.buffer[:]
    work_path = PWD.split('work/')[0] + 'work/'
    prj = PWD.split('work/')[1].split('/')[0] + '/'
    component = vim.eval("a:CPNT")
    cscope_db = work_path + prj + cscope_db_path + cpnt_transform[component] + ".out"

    #vim.command("echomsg '%s - %s'" % (vim.eval("a:CPNT"), vim.eval("a:1")))
    vim.command("cs add %s" % cscope_db)

except Exception as e:
  pass

EOF
" Here the python code is closed. We can continue writing VimL or python again.
endfunction

:call CSADD('zd', '')
command! -nargs=* Ics call CSADD(<f-args>, '')

