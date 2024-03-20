let $NVIM_COC_LOG_LEVEL = 'debug'

 """"""""""""""""""""""
" package management "
""""""""""""""""""""""
" - VIM PLUG
call plug#begin('~/.local/share/nvim/plugged')

Plug 'Raimondi/delimitMate'
Plug 'derekwyatt/vim-scala'
Plug 'dhruvasagar/vim-vinegar'
Plug 'godlygeek/tabular'
Plug 'BurntSushi/ripgrep'

" For Metals and the like
Plug 'nvim-lua/plenary.nvim'
Plug 'scalameta/nvim-metals'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'sharkdp/fd'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Development Stuff
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'rickhowe/spotdiff.vim'

" Pretty Stuff
Plug 'triglav/vim-visual-increment'
Plug 'aklt/plantuml-syntax'
Plug 'altercation/vim-colors-solarized'
Plug 'challenger-deep-theme/vim'
Plug 'flazz/vim-colorschemes'
Plug 'itchyny/calendar.vim'
Plug 'luochen1990/rainbow'
Plug 'rakr/vim-two-firewatch'
Plug 'rizzatti/dash.vim'
Plug 'vim-airline/vim-airline'

"Kotlin
Plug 'udalov/kotlin-vim'


" Initialize plugin system
call plug#end()

" Initialize metals
:lua require('nvim-metals-conf')
:lua require('treesitter-conf')

" easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Set python
let g:python3_host_prog='/usr/local/bin/python3'
let g:python_host_prog='/usr/bin/python2.7'

"""""""""""""""""""""""""
" General Mapping Stuff "
"""""""""""""""""""""""""

map <C-J> <C-W>j<C-W>10+
map <C-K> <C-W>k<C-W>10+
map <C-H> <C-W>h<C-W>10>
map <C-L> <C-W>l<C-W>10>

nnoremap <a-j> <c-w>j
nnoremap <a-k> <c-w>k
nnoremap <a-h> <c-w>h
nnoremap <a-l> <c-w>l
vnoremap <a-j> <c-\><c-n><c-w>j
vnoremap <a-k> <c-\><c-n><c-w>k
vnoremap <a-h> <c-\><c-n><c-w>h
vnoremap <a-l> <c-\><c-n><c-w>l
inoremap <a-j> <c-\><c-n><c-w>j
inoremap <a-k> <c-\><c-n><c-w>k
inoremap <a-h> <c-\><c-n><c-w>h
inoremap <a-l> <c-\><c-n><c-w>l
cnoremap <a-j> <c-\><c-n><c-w>j
cnoremap <a-k> <c-\><c-n><c-w>k
cnoremap <a-h> <c-\><c-n><c-w>h
cnoremap <a-l> <c-\><c-n><c-w>l

tnoremap <Esc> <C-\><C-n>
if has('nvim')
  tnoremap <a-j> <c-\><c-n><c-w>j
  tnoremap <a-k> <c-\><c-n><c-w>k
  tnoremap <a-h> <c-\><c-n><c-w>h
  tnoremap <a-l> <c-\><c-n><c-w>l
  au WinEnter *pid:* call feedkeys('i')
endif

" modify the mapleader
let mapleader = ","

" Swap ; and :  Convenient.
nnoremap ; :
nnoremap : ;

" cd to current directory
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>

" map go back a file
nnoremap !! :b#<CR>

" prefer vertical to horizontal split on diff
set diffopt=vertical

""""""""""""""""""""""""
" General Vim Settings "
""""""""""""""""""""""""
set laststatus=2
set encoding=utf-8
" why not?
syntax on

" set tabstops and show whitespaces
set list
"set listchars=tab:\|\ ,trail:\ ,eol:·
set listchars=tab:⋅\ ,trail:\ ,eol:·
set tabstop=2
set shiftwidth=2
"set noexpandtab
set expandtab
set smarttab
set ci
set pi
set sts=0

"when using tabs instead of spaces
"set noet ci pi sts=0 sw=2 ts=2

"to switch back to using spaces
"set et ci pi sts=0 sw=2 ts=2

" set the color column @ 120
set colorcolumn=120

" turn of anti-aliasing only for larger font sizes
"set noantialias

" Ignoring case is a fun trick
set ignorecase

" And so is Artificial Intellegence!
set smartcase

" Necesary  for lots of cool vim things
set nocompatible

" This shows what you are typing as a command.  I love this!
set showcmd

" Cool tab completion stuff
set wildmenu
set wildmode=list:longest,full

" Line Numbers PWN!
set number

" make sure that the backups dont pollute the fs
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" just a nice way to indicate ent ehd of the insert register
set cpoptions+=$ " add the $ to the end of the cw
set virtualedit=all " allow to go to places no other editor can go

" allow for moving between unsaved buffers
set hidden

" Don't update the display while executing macros
set lazyredraw

" At least let yourself know what mode you're in
set showmode

" Set the status line the way I like it
" set stl=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]

" tell Vim to always put a status line in, even if there is only one
" window
set laststatus=2

" Hide the mouse pointer while typing
set mousehide

" hide the toolbar and the menubadr
set guioptions=ergLt

" highlight the cursor ilne and columen"
noremap <leader>cl set cursorline<cr> set cursorcolumn<cr>

" fast terminat showing"
set ttyfast

"show the relative numbers"
"set relativenumber

"undofile for even files that are closed by accident"
set undofile
set undodir=~/.vim/tmp

"""""""""""""""""""""""""""""""
" set the colors and the font "
"""""""""""""""""""""""""""""""

"selenized
"colors selenized
set t_Co=16
"colors desert
"colors busybee
"colors zenburn
"colors solarized

set termguicolors
colors gruvbox
"colors challenger_deep

set background=dark

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 18
  elseif has("gui_macvim")
    set guifont=Consolas:h11
    "set guifont=Inconsolata-dz_for_Powerline:h9:cANSI
  elseif has("gui_win32")
    " set guifont=Consolas:h13:cANSI
    set guifont=Inconsolata-dz_for_Powerline:h9:cANSI
  endif
endi




"""""""""""""""""
" autocmd stuff "
"""""""""""""""""

" set JSON to javascript filetype
autocmd BufNewFile,BufRead *.json set ft=javascript

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

"autocmd Filetype java setl makeprg=play_compile
"autocmd Filetype java setl efm=%A\ %#[error]\ %f:%l:\ %m,%-Z\ %#[error]\ %p^,%-C%.%#
"autocmd FileType java setl tabstop=4 sw=4 sts=4 noet
"autocmd FileType java setl tabstop=4 sw=4 sts=4

au BufRead,BufNewFile *.sbt set filetype=scala
autocmd Filetype scala setl makeprg=sbt_compile
"autocmd Filetype scala setl efm=%A\ %#[error]\ %f:%l:\ %m,%-Z\ %#[error]\ %p^,%-C%.%#
"autocmd Filetype scala setl errorformat=
      "\%E\ %#[error]\ %f:%l:\ %m,%C\ %#[error]\ %p^,%-C%.%#,%Z,
      "\%W\ %#[warn]\ %f:%l:\ %m,%C\ %#[warn]\ %p^,%-C%.%#,%Z,
"autocmd Filetype scala setl errorformat=%E[%trror]\ %f:%l:\ %m

autocmd FileType javascript setl tabstop=2 sw=2 sts=2

autocmd FileType html setl makeprg=play_compile
autocmd FileType html setl tabstop=2 sw=2 sts=2


"""""""""""""""""""
" Powerline Stuff "
"""""""""""""""""""
let g:Powerline_symbols = 'fancy'
set encoding=utf-8


" Calls tabular on first space
" function! RetabSpace()
"   '<,'>s/^\s*//g
"   '<,'>s/\s\+/ /g
"   Tab/^\S*\s\+\zs/l1
"   '<,'>s/^/    /g
" endfunction
" command! -complete=buffer RetabSpace call RetabSpace()

" Display an error message.
function! s:Warn(msg)
  echohl ErrorMsg
  echomsg a:msg
  echohl NONE
endfunction

" Command ':Bclose' executes ':bd' to delete buffer in current window.
" The window will show the alternate buffer (Ctrl-^) if it exists,
" or the previous buffer (:bp), or a blank buffer if no previous.
" Command ':Bclose!' is the same, but executes ':bd!' (discard changes).
" An optional argument can specify which buffer to close (name or number).
function! s:Bclose(bang, buffer)
  if empty(a:buffer)
    let btarget = bufnr('%')
  elseif a:buffer =~ '^\d\+$'
    let btarget = bufnr(str2nr(a:buffer))
  else
    let btarget = bufnr(a:buffer)
  endif
  if btarget < 0
    call s:Warn('No matching buffer for '.a:buffer)
    return
  endif
  if empty(a:bang) && getbufvar(btarget, '&modified')
    call s:Warn('No write since last change for buffer '.btarget.' (use :Bclose!)')
    return
  endif
  " Numbers of windows that view target buffer which we will delete.
  let wnums = filter(range(1, winnr('$')), 'winbufnr(v:val) == btarget')
  if !g:bclose_multiple && len(wnums) > 1
    call s:Warn('Buffer is in multiple windows (use ":let bclose_multiple=1")')
    return
  endif
  let wcurrent = winnr()
  for w in wnums
    execute w.'wincmd w'
    let prevbuf = bufnr('#')
    if prevbuf > 0 && buflisted(prevbuf) && prevbuf != w
      buffer #
    else
      bprevious
    endif
    if btarget == bufnr('%')
      " Numbers of listed buffers which are not the target to be deleted.
      let blisted = filter(range(1, bufnr('$')), 'buflisted(v:val) && v:val != btarget')
      " Listed, not target, and not displayed.
      let bhidden = filter(copy(blisted), 'bufwinnr(v:val) < 0')
      " Take the first buffer, if any (could be more intelligent).
      let bjump = (bhidden + blisted + [-1])[0]
      if bjump > 0
        execute 'buffer '.bjump
      else
        execute 'enew'.a:bang
      endif
    endif
  endfor
  execute 'bdelete'.a:bang.' '.btarget
  execute wcurrent.'wincmd w'
endfunction
command! -bang -complete=buffer -nargs=? Bclose call s:Bclose('<bang>', '<args>')
nnoremap <silent> <Leader>bd :Bclose<CR>


"""""""""""""""""""""""""""""
" Options for indent guides "
"""""""""""""""""""""""""""""
let g:indent_guides_enable_on_vim_startup = 1

" Find files using Telescope command-line sugar.
" Find files using Telescope command-line sugar.
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


"""""""""""""""""""""""""
" overridden map settings
"""""""""""""""""""""""""

" set tt for tagbar "
noremap <Leader>tt :TagbarToggle<CR>
"
"
" rainbo parens
let g:rainbow_active = 1

" vim -scla plugin stuff
let g:scala_scaladoc_indent = 1
"
" arrange the imports alphabetically
nnoremap <Leader>ar {jV}k:!sort<CR>
" import the object underneath the cursorm using ctags
nnoremap <Leader>im <C-]>ve"zyggV"xy<CR>:b#<CR>ggjj"xPdwiimport <esc>$a.<esc>"zp

" dash
nnoremap <leader>da :Dash<CR>

function! OpenOnMacvim()
  :!mvim --remote-silent %:p
endfunction


"""""""""""""""""""""
" Metals/COC bindings
"""""""""""""""""""""
"set cmdheight=2
"
set shortmess-=F
" ctrl-space
noremap <silent><expr> <c-space> coc#refresh()
" jump commands
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
" rename
nmap <leader>rn <Plug>(coc-rename)
" codeaction
nmap <leader>ac <Plug>(coc-codeaction)


" SAVE MY FOLDS
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview
"

" URLENCODE/DECOD
vnoremap <leader>en :!python -c 'import sys,urllib;print urllib.quote(sys.stdin.read().strip())'<cr>
vnoremap <leader>de :!python -c 'import sys,urllib;print urllib.unquote(sys.stdin.read().strip())'<cr>
