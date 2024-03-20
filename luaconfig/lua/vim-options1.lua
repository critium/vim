-- Swap ; and :  Convenient.
vim.cmd("nnoremap ; :")
vim.cmd("nnoremap : ;")

-- map go back a file
vim.cmd("nnoremap !! :b#<CR>")

-- prefer vertical to horizontal split on diff
vim.cmd("set diffopt=vertical")

vim.cmd("let mapleader = ','")

--------------------------
-- General Vim Settings --
--------------------------
vim.cmd("set laststatus=2")
vim.cmd("set encoding=utf-8")
vim.cmd("syntax on")

-- set tabstops and show whitespaces
vim.cmd([[
  set list
  set listchars=tab:⋅\ ,trail:\ ,eol:·"
  set tabstop=2
  set shiftwidth=2
  set expandtab
  set smarttab
  set ci
  set pi
  set sts=0
  set nofixeol
  set nofixendofline
]])

-- easier split navigations
vim.cmd([[
  nnoremap <C-J> <C-W><C-J>
  nnoremap <C-K> <C-W><C-K>
  nnoremap <C-L> <C-W><C-L>
  nnoremap <C-H> <C-W><C-H>
  nnoremap <C-I> <C-W>10>
]])


-- Remove whitespace on save
autocmd('BufWritePre', {
  pattern = '',
  command = ":%s/\\s\\+$//e"
})

-- set the color column @ 120
vim.cmd("set colorcolumn=120")

-- Ignoring case is a fun trick
vim.cmd("set ignorecase")

-- And so is Artificial Intellegence!
vim.cmd("set smartcase")

-- Necesary  for lots of cool vim things
vim.cmd("set nocompatible")

-- This shows what you are typing as a command.  I love this!
vim.cmd("set showcmd")

-- Cool tab completion stuff
vim.cmd([[
  set wildmenu
  set wildmode=list:longest,full
]])

-- Line Numbers PWN!
vim.cmd("set number")

-- allow for moving between unsaved buffers
vim.cmd("set hidden")

-- Hide the mouse pointer while typing
vim.cmd("set mousehide")

-- highlight the cursor ilne and columen"
vim.cmd("noremap <leader>tc :set cursorline!<cr> :set cursorcolumn!<cr>")
vim.cmd("set cursorline")
vim.cmd("set cursorcolumn")

-- ndofile for even files that are closed by accident"
vim.cmd([[
  set undofile
  set undodir=~/.vim/tmp
]])

----------------------------------
-- OPTIONS -----------------------
----------------------------------
-- global for metals
vim.opt_global.completeopt = { "menuone", "noinsert", "noselect" }
