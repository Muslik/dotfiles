local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local status_ok, lazy = pcall(require, 'lazy')
if not status_ok then
  return
end

lazy.setup({
  'nvim-lua/plenary.nvim',
  'nathom/filetype.nvim',
  'kyazdani42/nvim-web-devicons',
  'glepnir/dashboard-nvim',
  -- Themes
  'catppuccin/nvim',
  'folke/tokyonight.nvim',
  'oxfist/night-owl.nvim',
  'craftzdog/solarized-osaka.nvim',
  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end,
  },
  'p00f/nvim-ts-rainbow',
  'windwp/nvim-ts-autotag',
  'JoosepAlviste/nvim-ts-context-commentstring',
  'nvim-telescope/telescope.nvim',
  'nvim-lua/popup.nvim',
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  'nvim-telescope/telescope-live-grep-args.nvim',
  'nvim-telescope/telescope-node-modules.nvim',
  'dhruvmanila/telescope-bookmarks.nvim',
  'stevearc/dressing.nvim',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-nvim-lua',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-calc',
  'David-Kunz/cmp-npm',
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  'j-hui/fidget.nvim',
  'ray-x/lsp_signature.nvim',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',
  'onsails/lspkind-nvim',
  'folke/trouble.nvim',
  'b0o/SchemaStore.nvim',
  'ahmedkhalf/project.nvim',
  'kevinhwang91/nvim-bqf',
  'folke/todo-comments.nvim',
  'ghillb/cybu.nvim',
  'rcarriga/nvim-notify',
  'RRethy/vim-illuminate',
  'christianchiarulli/hop.nvim',
  { 'Muslik/browse.nvim', branch = 'mac-os-devdocs-fix' },
  'windwp/nvim-spectre',
  'folke/which-key.nvim',
  'lewis6991/impatient.nvim',
  { 'lukas-reineke/indent-blankline.nvim', main = 'ibl' },
  'tpope/vim-surround',
  'numToStr/Comment.nvim',
  'akinsho/toggleterm.nvim',
  'nvim-lualine/lualine.nvim',
  'simrat39/symbols-outline.nvim',

  { 'ThePrimeagen/harpoon', branch = 'harpoon2' },

  -- Snippets & Language & Syntax
  'jose-elias-alvarez/typescript.nvim',
  'simrat39/rust-tools.nvim',
  'NTBBloodbath/rest.nvim',
  'mattn/emmet-vim',
  'windwp/nvim-autopairs',
  'norcalli/nvim-colorizer.lua',
  'rafamadriz/friendly-snippets',
  'abecodes/tabout.nvim',

  'nvim-neo-tree/neo-tree.nvim',
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.files').setup()
    end,
  },
  'MunifTanjim/nui.nvim',
  's1n7ax/nvim-window-picker',

  { 'iamcco/markdown-preview.nvim', build = 'cd app && npm install' },
  'lewis6991/gitsigns.nvim',
  'tpope/vim-fugitive',
  'zbirenbaum/copilot.lua',
  'folke/zen-mode.nvim',
})
