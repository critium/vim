" Calls tabular on first space
function! RetabSpace() range
  '<,'>s/^\s*//g
  '<,'>s/\s\+/ /g
  '<,'>Tab/^\S*\s\+\zs/l1
  '<,'>s/^/    /g
endfunction
command! -range -complete=buffer RetabSpace call RetabSpace()

if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>
  map <D-left> <C-O>
  map <D-right> <C-I>
endif


let g:projHome = $HOME.'/shortcuts/betareturn/trunk/play'
" // jq .

