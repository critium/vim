""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Necesary  for lots of cool vim things
" Need this on top or else get all sorts of stupid errors on startup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible


"""""""""""""""""""""""""""
" Boilerplate for windows "
"""""""""""""""""""""""""""

"g:my_vim_dir is used elsewhere in my vim configurations
let g:my_vim_dir=expand("$USERPROFILE/.vim")

"$HOME/.vim and $HOME/.vim/after are in the &rtp on unix
"But on windows, they need to be added.
if has("win16") || has("win32") || has("win64")
  "add g:my_vim_dir to the front of the runtimepath
  execute "set rtp^=".g:my_vim_dir

  "add g:my_vim_dir\after to the end of the runtimepath
  execute "set rtp+=".g:my_vim_dir."\\after"

  "Note, pathogen#infect() looks for the 'bundle' folder in each path
  "of the &rtp, where the last dir in the '&rtp path' is not 'after'. The
  "<path>\bundle\*\after folders will be added if and only if
  "the corresponding <path>\after folder is in the &rtp before
  "pathogen#infect() is called.  So it is very important to add the above
  "'after' folder.
  "(This applies to vim plugins such as snipmate, tabularize, etc.. that
  " are loaded by pathogen (and perhaps vundle too.))

  " Not necessary, but I like to cleanup &rtp to use \ instead of /
  " when on windows machines
  let &rtp=substitute(&rtp,"[/]","\\","g")

  "On windows, if called from cygwin or msys, the shell needs to be changed
  "to cmd.exe to work with certain plugins that expect cmd.exe on windows versions
  "of vim.
  if &shell=~#'bash$'
    set shell=$COMSPEC " sets shell to correct path for cmd.exe
  endif
endif



""""""""""""""""""""""
" package management "
""""""""""""""""""""""

" Required by Pathogen and Vundle
filetype plugin indent on

" pathogen stuff
" call pathogen#infect()

" vundle stuff
filetype off
execute "set rtp+=".g:my_vim_dir."/bundle/vundle/"
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
" Vundle Bundles
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'godlygeek/tabular'
Bundle 'altercation/vim-colors-solarized'
Bundle 'majutsushi/tagbar'
Bundle 'Lokaltog/vim-powerline'
Bundle 'The-NERD-Commenter'
Bundle 'scrooloose/nerdcommenter'
" Bundle 'lukaszb/vim-web-indent'
Bundle 'pangloss/vim-javascript'
Bundle 'AutoClose'
"disable the follwing until i learn how to use them"
""Bundle 'kien / ctrlp.vim'
""Bundle 'kien/ctrlp.vim'
""Bundle 'yankrink.vim'
""Bundle 'jpalardy / vim-slime'
""Bundle 'msanders/snipmate.vim'
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

""""""""""""""""""""""""
" General Vim Settings "
""""""""""""""""""""""""
set laststatus=2
set encoding=utf-8
" why not?
syntax on

" set tabstops
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab

" turn of anti-aliasing only for larger font sizes
set noantialias

" Ignoring case is a fun trick
set ignorecase

" And so is Artificial Intellegence!
set smartcase


" This shows what you are typing as a command.  I love this!
set showcmd

" Cool tab completion stuff
set wildmenu
set wildmode=list:longest,full

" Line Numbers PWN!
set number

" make sure that the backups dont pollute the fs
set backup
execute "set backupdir=".g:my_vim_dir."/backup"
execute "set directory=".g:my_vim_dir."/tmp"
execute "set undodir=".g:my_vim_dir."/undo"
"set backupdir=~/.vim/backup
"set directory=~/.vim/tmp

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
set cursorline
set cursorcolumn

" fast terminat showing"
set ttyfast

"show the relative numbers"
set relativenumber

"undofile for even files that are closed by accident"
""set undofile

"""""""""""""""""""""""""""""""
" set the colors and the font "
"""""""""""""""""""""""""""""""

" yummy
" colors desert
colors solarized
if has('gui_running')
    set background=dark
else
    set background=light
endif

" i like this font
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Consolas:h13
  elseif has("gui_win32")
    " set guifont=Consolas:h13:cANSI
    set guifont=Inconsolata-dz_for_Powerline:h11:cANSI
  endif
endi



"""""""""""""""""
" autocmd stuff "
"""""""""""""""""

" set JSON to javascript filetype
autocmd BufNewFile,BufRead *.json set ft=javascript

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif



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
" set tt for tagbar "
"""""""""""""""""""""
noremap <Leader>tt :TagbarToggle<CR>

