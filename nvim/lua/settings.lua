local options = {
  so = 8, -- middle cursor when it's 8 lines before bottom
  autoread = true,
  autowrite = true,
  cindent = true,
  encoding = 'utf-8',
  history = 500, -- number of lines to keep in history
  laststatus = 2,
  mouse = 'a',
  backup = false, -- don't backup files
  writebackup = false, -- don't backup files
  number = true, -- number lines
  relativenumber = true, -- relativenumber lines
  sessionoptions = 'tabpages,globals',
  shiftwidth = 2,
  pumheight = 12, -- height of the popup menu
  expandtab = true, -- expand tabs to spaces
  incsearch = true, -- incremental search
  cursorline = true, -- enable cursorline
  smartcase = true, -- don't ignore case if search with uppercase
  ignorecase = true, -- ignore case on search
  smarttab = true, -- smart tab behavior
  swapfile = false, -- creates swapfile
  showcmd = false, -- don't show command in status line
  tabstop = 2, -- tab size
  undofile = true, -- create undo file
  updatetime = 750, -- faster completion
  termguicolors = true, -- set term gui colors (most terminals support this)
  background = 'dark', -- background
  signcolumn = "yes",
  clipboard = 'unnamedplus', -- allow for system clipboard
  splitright = true, -- split windows to the right
  splitbelow = true, -- split windows below
  completeopt = 'menuone,noselect',
  guifont = { "Fira Code", ":h15" },
  foldmethod= "expr",
  foldexpr = "nvim_treesitter#foldexpr()",
  foldenable = false
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.bo.undofile = true

vim.g.neovide_cursor_animation_length= 0
vim.g.neovide_input_use_logo = "v:true"
