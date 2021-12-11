local o = vim.opt
local g = vim.g
local bo = vim.bo

g.mapleader = " "

o.so = 7 -- middle cursor when it's 7 lines before bottom
o.sj = -50
o.autoread = true
o.autowrite = true
o.cindent = true
o.encoding = 'utf-8'
o.history = 500
o.laststatus = 2
o.mouse = 'a'
o.backup = false
o.writebackup = false
o.number = true -- number lines
o.relativenumber = true -- relativenumber lines
o.sessionoptions = 'tabpages,globals'
o.shiftwidth = 2
o.expandtab = true
o.incsearch = true
o.cursorline = true -- enable cursorline
o.smartcase = true -- don't ignore case if search with uppercase
o.ignorecase = true -- ignore case on search
o.smarttab = true
o.lazyredraw = true -- don't redray while executing macros (perfomance)
o.swapfile = false -- creates swapfile
o.tabstop = 2 -- tab size
o.undofile = true; bo.undofile = true
o.updatetime = 750 -- faster completion
o.termguicolors = true -- set term gui colors (most terminals support this)
o.background = 'dark' -- background
o.clipboard = 'unnamedplus' -- allow for system clipboard
o.splitright = true
o.splitbelow = true
o.completeopt = 'menuone,noselect'
