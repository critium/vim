"" Calls tabular on first space
"function! RetabSpace() range
"  '<,'>s/^\s*//g
"  '<,'>s/\s\+/ /g
"  '<,'>Tab/^\S*\s\+\zs/l1
"  '<,'>s/^/    /g
"endfunction
"command! -range -complete=buffer RetabSpace call RetabSpace()

"if has("gui_macvim")
"  macmenu &File.New\ Tab key=<nop>
"  map <D-left> <C-O>
"  map <D-right> <C-I>
"endif


"let g:projHome = $HOME.'/shortcuts/betareturn/trunk/play'
"" // jq .

"nmap <silent> <C-Up> :call <SID>LocationPrevious()<CR>
"nmap <silent> <C-Down> :call <SID>LocationNext()<cr>
function! <SID>LocationPrevious()
  try
    lprev!
  catch /:E776:/ " No location list
  catch /:E553:/ " End/Start of location list
    call <SID>LocationLast()
  catch /:E926:/ " Location list changed
    ll!
  endtry
endfunction
function! <SID>LocationNext()
  try
    lnext!
  catch /:E776:/ " No location list
  catch /:E553:/ " End/Start of location list
    call <SID>LocationFirst()
  catch /:E926:/ " Location list changed
    call <SID>LocationNext()
  endtry
endfunction
function! <SID>LocationFirst()
  try
    lfirst!
  catch /:E926:/ " Location list changed
    call <SID>LocationFirst()
  endtry
endfunction
function! <SID>LocationLast()
  try
    llast!
  catch /:E926:/ " Location list changed
    call <SID>LocationLast()
  endtry
endfunction
