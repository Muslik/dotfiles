local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
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
  'kyazdani42/nvim-web-devicons',
  'glepnir/dashboard-nvim',
  -- Themes
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
  { 'rose-pine/neovim', name = 'rose-pine' },
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
  'windwp/nvim-ts-autotag',
  'JoosepAlviste/nvim-ts-context-commentstring',
  'nvim-telescope/telescope.nvim',
  'nvim-lua/popup.nvim',
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  'nvim-telescope/telescope-live-grep-args.nvim',
  'nvim-telescope/telescope-node-modules.nvim',
  'dhruvmanila/browser-bookmarks.nvim',
  'stevearc/dressing.nvim',
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-calc',
      'onsails/lspkind.nvim',
      'saadparwaiz1/cmp_luasnip',
    },
  },
  'L3MON4D3/LuaSnip',
  'j-hui/fidget.nvim',
  'ray-x/lsp_signature.nvim',
  'williamboman/mason.nvim',
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
},
  'neovim/nvim-lspconfig',
  'onsails/lspkind-nvim',
  'folke/trouble.nvim',
  'b0o/SchemaStore.nvim',
  'ahmedkhalf/project.nvim',
  'kevinhwang91/nvim-bqf',
  'folke/todo-comments.nvim',
  'ghillb/cybu.nvim',
  'RRethy/vim-illuminate',
  'folke/noice.nvim',
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

  'SmiteshP/nvim-navic',
  'LunarVim/breadcrumbs.nvim',

  -- Snippets & Language & Syntax
  {
    'luckasRanarison/tailwind-tools.nvim',
    name = 'tailwind-tools',
    build = ':UpdateRemotePlugins',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-telescope/telescope.nvim', -- optional
      'neovim/nvim-lspconfig', -- optional
    },
  },
  'pmizio/typescript-tools.nvim',
  'simrat39/rust-tools.nvim',
  {
    'vhyrro/luarocks.nvim',
    priority = 1000,
    config = true,
  },
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
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    lazy = false,
  },
  'MunifTanjim/nui.nvim',
  's1n7ax/nvim-window-picker',

  {
    'moyiz/git-dev.nvim',
    event = 'VeryLazy',
    opts = {},
  },

  { 'iamcco/markdown-preview.nvim', build = 'cd app && npm install' },
  'lewis6991/gitsigns.nvim',
  'tpope/vim-fugitive',
  'zbirenbaum/copilot.lua',
  'folke/zen-mode.nvim',
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'marilari88/neotest-vitest',
    },
  },
  {
    'coder/claudecode.nvim',
    dependencies = { 'folke/snacks.nvim' },
    config = true,
    opts = {
      terminal_cmd = "SHELL=/bin/bash " .. os.getenv("HOME") .. "/.claude/local/claude"
    }
  },
  -- Database
  'kndndrj/nvim-dbee',
  dependencies = {
    'MunifTanjim/nui.nvim',
  },
  build = function()
    require('dbee').install()
  end,
})
