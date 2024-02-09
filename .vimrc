""""""""""""""""""""""
" package management "
""""""""""""""""""""""

" Required by Pathogen and Vundle
filetype plugin indent on

" pathogen stuff
" call pathogen#infect()

" vundle stuff
filetype on
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
"
" Vundle Bundles
Bundle 'mxw/vim-jsx'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-abolish'
Bundle 'dhruvasagar/vim-vinegar'
Bundle 'godlygeek/tabular'
Bundle 'altercation/vim-colors-solarized'
Bundle 'flazz/vim-colorschemes'
Bundle 'majutsushi/tagbar'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'derekwyatt/vim-scala'
Bundle 'pangloss/vim-javascript'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'Raimondi/delimitMate'
Bundle 'vim-scripts/loremipsum'
Bundle 'vim-scripts/Workspace-Manager'
Bundle 'vim-scripts/AnsiEsc.vim'
"Bundle 'vim-scripts/grep.vim'
Bundle 'vim-scripts/jade.vim'
Bundle 'gre/play2vim'
Bundle 'javacomplete'
Bundle 'matchit.zip'
Bundle 'kien/ctrlp.vim'
Bundle 'SuperTab'
Bundle 'vim-scripts/dbext.vim'
Bundle 'scratch.vim'
Bundle 'triglav/vim-visual-increment'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'wesQ3/vim-windowswap'
Bundle 'csv.vim'
Bundle 'LargeFile'
Bundle 'scrooloose/syntastic'
Bundle 'zmre/vim-scala-async-integration'
Bundle 'luochen1990/rainbow'


"disable the follwing until i learn how to use them"
"Bundle 'Valloric/YouCompleteMe'
"Bundle 'marijnh/tern_for_vim'
"Plugin 'ensime/ensime-vim'
"Bundle 'lukaszb/vim-web-indent'
"Bundle 'rosenfeld/conque-term'
"Bundle 'ShowMarks'
"Bundle 'scrooloose/syntastic'
"neo complcache"
""Bundle 'yankrink.vim'
""Bundle 'jpalardy / vim-slime'
""Bundle 'msanders/snipmate.vim'
"Bundle 'mikelue/vim-maven-plugin'





"""""""""""""""""""""""""
" General Mapping Stuff "
"""""""""""""""""""""""""

" modify the mapleader
let mapleader = ","

" Swap ; and :  Convenient.
nnoremap ; :
nnoremap : ;

" cd to current directory
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>

" easier moving between viewports
map <C-J> <C-W>j<C-W>10+
map <C-K> <C-W>k<C-W>10+
map <C-H> <C-W>h<C-W>10>
map <C-L> <C-W>l<C-W>10>
"map <C-J> <C-W>j
"map <C-K> <C-W>k
"map <C-H> <C-W>h
"map <C-L> <C-W>l
"
" map go back a file
nnoremap !! :b#<CR>


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

colors desert
"colors solarized
"colors busybee
"colors zenburn
if has('gui_running')
  set background=dark
  "show the relative numbers"
  set relativenumber
else
  set background=light
endif

" i like this font
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 18
  elseif has("gui_vimr")
    set guifont=Consolas:h11
    " set guifont=Monoid\ Retina:h8
    " set guifont=Inconsolata-dz_for_Powerline:h9:cANSI
  elseif has("gui_macvim")
    " set guifont=Consolas:h11
    " set guifont=Monoid\ Retina:h8
    " set guifont=Inconsolata-dz_for_Powerline:h9:cANSI
    set guifont=Menlo\ Regular\ for\ Powerline\ for\ Powerline:h11
    colors desert
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

autocmd Filetype scala setl makeprg=sbt_compile
"autocmd Filetype scala setl efm=%A\ %#[error]\ %f:%l:\ %m,%-Z\ %#[error]\ %p^,%-C%.%#
"autocmd Filetype scala setl efm=%A\ %#[error]\ %f:%l:\ %m,%-Z\ %#[error]\ %p^,%-C%.%#
"autocmd Filetype scala setl efm=
      "\ %E%f:%l: %trror: %m,%Z%p^,%-G%.%#
autocmd Filetype scala setl errorformat=
      \%E\ %#[error]\ %f:%l:\ %m,%C\ %#[error]\ %p^,%-C%.%#,%Z,
      \%W\ %#[warn]\ %f:%l:\ %m,%C\ %#[warn]\ %p^,%-C%.%#,%Z,


"autocmd FileType javascript setl tabstop=2 sw=2 sts=2 noet
autocmd FileType javascript setl tabstop=2 sw=2 sts=2
autocmd FileType html setl makeprg=play_compile
"autocmd FileType html setl tabstop=2 sw=2 sts=2 noet
autocmd FileType html setl tabstop=2 sw=2 sts=2


""""""""""""""""
" folding "
""""""""""""""""
"DISABLE - " au BufWinLeave * mkview
"DISABLE - " au BufWinEnter * silent loadview
"DISABLE -
"DISABLE - autocmd BufWinLeave *.* mkview!
"DISABLE - autocmd BufWinEnter *.* silent loadview
"DISABLE -
"DISABLE - set foldmethod=syntax
"DISABLE - set foldlevelstart=2
"DISABLE -
"DISABLE - let javaScript_fold=1         " JavaScript
"DISABLE - let perl_fold=1               " Perl
"DISABLE - let php_folding=1             " PHP
"DISABLE - let r_syntax_folding=1        " R
"DISABLE - let ruby_fold=1               " Ruby
"DISABLE - let sh_fold_enabled=1         " sh
"DISABLE - let vimsyn_folding='af'       " Vim script
"DISABLE - let xml_syntax_folding=1      " XML
"DISABLE - "syntax clear javaBraces
"DISABLE - "syntax clear javaDocComment
"DISABLE -
"DISABLE - syn region javaBraces start="{" end="}" transparent fold
"DISABLE - syn region javaDocComment start="/\*\*" end="\*/" keepend contains=javaCommentTitle,@javaHtml,javaDocTags,javaDocSeeTag,javaTodo,@Spell fold


"""""""""""""""""""
" JSLINT settings "
"""""""""""""""""""
" disable JSLINT by default
" :JSLintToggle
let g:JSLintHighlightErrorLine = 0


"""""""""""""""""
" minibuf stuff "
"""""""""""""""""
let g:miniBufExplorerMoreThanOne = 0
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1



""""""""""""""""""
" NERDTree Stuff "
""""""""""""""""""
" open at startup
" use nerdtree " autocmd vimenter * NERDTree



"""""""""""""""""""
" Powerline Stuff "
"""""""""""""""""""
let g:Powerline_symbols = 'fancy'
set encoding=utf-8




"""""""""""""""""""""
" Supertab settings "
"""""""""""""""""""""
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover', 's:ContextP']
let g:SuperTabContextTextOmniPrecedence = ['&completefunc', '&omnifunc', '&autoComp']
let g:SuperTabContextDiscoverDiscovery =
      \ ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>", "&autoComp:<c-p>"]

"let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
"let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
"let g:SuperTabDefaultCompletionTypeDiscovery = [
"\ "&completefunc:<c-x><c-u>",
"\ ]
"let g:SuperTabLongestHighlight = 1




""""""""""""""""""
" ctrlp settings "
""""""""""""""""""
let g:ctrlp_root_markers = ['src/', 'pom.xml']
let g:ctrlp_custom_ignore = {
      \ 'dir': '\v[\/](node_modules|target|dist|deploy)|(\.(swp|ico|git|svn))$',
			\ 'file': '\v\.(exe|so|dll|class)$',
			\ 'link': 'some_bad_symbolic_links',
			\ }




""""""""""""""""""
" Eclim settings "
""""""""""""""""""
"nnoremap <silent> <Leader>jf :JavaFormat<cr>
"nnoremap <silent> <Leader>ji :JavaImport<cr>
"nnoremap <silent> <Leader>jd :JavaDocSearch -x declarations<cr>
"nnoremap <silent> <Leader>js :JavaSearchContext<cr>
"nnoremap <silent> <Leader>jv :Validate<cr>
"nnoremap <silent> <Leader>jc :JavaCorrect<cr>
"nnoremap <silent> <Leader>cc :Checkstyle<cr>
"let g:EclimBrowser='open'




""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set javacomplete to run omnifunc for all java filetypes
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
  autocmd Filetype java setlocal omnifunc=javacomplete#Complete
endif

" Delete buffer while keeping window layout (don't close buffer's windows).
" Version 2008-11-18 from http://vim.wikia.com/wiki/VimTip165
if v:version < 700 || exists('loaded_bclose') || &cp
  finish
endif
let loaded_bclose = 1
if !exists('bclose_multiple')
  let bclose_multiple = 1
endif


" Calls tabular on first space
function! RetabSpace()
  '<,'>s/^\s*//g
  '<,'>s/\s\+/ /g
  Tab/^\S*\s\+\zs/l1
  '<,'>s/^/    /g
endfunction
command! -complete=buffer RetabSpace call RetabSpace()

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


""""""""""""""""""""""""""""""""""""""""
" sets the default connection to mysql "
""""""""""""""""""""""""""""""""""""""""
":DBSetOption user=betareturn:passwd=g0lfsw1ng:dbname=betareturn
"
let g:dbext_default_profile_mysql_local = 'type=MYSQL:user=root:passwd=whatever:dbname=mysql'
let g:dbext_default_profile_sqlite_for_rails = 'type=SQLITE:dbname=/path/to/my/sqlite.db'
let g:dbext_default_profile_rf_unit = 'type=PGSQL:user=rf_dev:dbname=rf_unit'
let g:dbext_default_profile = 'rf_unit'


"""""""""""""""""""""""""""""
" Options for indent guides "
"""""""""""""""""""""""""""""
let g:indent_guides_enable_on_vim_startup = 1

"""""""""""""""""""""""""
" overridden map settings
"""""""""""""""""""""""""

" set tt for tagbar "
noremap <Leader>tt :TagbarToggle<CR>

"settings for ctrlp
nmap <Leader>bp :CtrlP<CR>
nmap <Leader>bb :CtrlPBuffer<CR>

" maven plugin settings
" Disabled for BR -noremap <Leader>mc :Mvn! compile<CR>
" Disabled for BR -"noremap <Leader>mt :Mvn! test<CR>
" Disabled for BR -noremap <Leader>mt :Mvn! test -Dtest=%:t:r<CR>
" Disabled for BR -map <Leader>ms maven#switch-unittest-file
" Disabled for BR -map <Leader>mr maven#open-test-result

"AddTabularPattern f_space /^\S*\s\+\zs/l1

"" make Esc happen without waiting for timeoutlen
"" fixes Powerline delay
"augroup FastEscape
"  autocmd!
"  au InsertEnter * set timeoutlen=0
"  au InsertLeave * set timeoutlen=1000
"augroup END




" Temporarily disable this for now until I figure out how to get it running
"au FileType java :so /users/pule/.vim/opt/javakit/vim/javakit.vim



" jsx plugin, not require the jsx ext
let g:jsx_ext_required = 0

" rainbo parens
let g:rainbow_active = 1

" ensime error style
let EnErrorStyle='EnError'
