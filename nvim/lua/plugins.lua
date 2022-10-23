local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  })
  print('Installing packer close and reopen Neovim...')
  vim.cmd([[packadd packer.nvim]])
end
-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'rounded' })
    end,
  },
})

packer.startup(function(use)
  -- Packer can manage itself
  use('wbthomason/packer.nvim')

  use('nvim-lua/plenary.nvim')
  use('nathom/filetype.nvim')
  use('kyazdani42/nvim-web-devicons')
  use('glepnir/dashboard-nvim')

  -- Themes
  use({
    'catppuccin/nvim',
    as = 'catppuccin',
    commit = '863500ba19d49e30a399f8bf99d19871b46f3b09',
  })
  use('marko-cerovac/material.nvim')
  use('folke/tokyonight.nvim')
  use('pacokwon/onedarkhc.vim')
  use('joshdick/onedark.vim')
  use('bluz71/vim-nightfly-guicolors')
  use('iandwelker/rose-pine-vim')

  -- Treesitter
  use({
    'nvim-treesitter/nvim-treesitter',
    run = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end,
  })
  use({ 'p00f/nvim-ts-rainbow', requires = 'nvim-treesitter/nvim-treesitter', after = 'nvim-treesitter' })
  use({ 'windwp/nvim-ts-autotag', requires = 'nvim-treesitter/nvim-treesitter', after = 'nvim-treesitter' })
  use({
    'JoosepAlviste/nvim-ts-context-commentstring',
    requires = 'nvim-treesitter/nvim-treesitter',
    after = 'nvim-treesitter',
  })

  -- Telescope
  use({
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    },
  })

  use('nvim-telescope/telescope-live-grep-args.nvim')
  use('nvim-telescope/telescope-node-modules.nvim')
  use('dhruvmanila/telescope-bookmarks.nvim')

  use({ 'stevearc/dressing.nvim' })

  -- LSP Base
  use('neovim/nvim-lspconfig')

  -- LSP Cmp
  use({ 'hrsh7th/nvim-cmp' })
  use({ 'hrsh7th/cmp-nvim-lsp' })
  use({ 'hrsh7th/cmp-nvim-lua' })
  use({ 'hrsh7th/cmp-buffer' })
  use({ 'hrsh7th/cmp-path' })
  use({ 'hrsh7th/cmp-calc' })
  use({
    'David-Kunz/cmp-npm',
    requires = 'nvim-lua/plenary.nvim',
  })
  use({ 'L3MON4D3/LuaSnip' })
  use({ 'saadparwaiz1/cmp_luasnip' })

  -- LSP Addons
  use('j-hui/fidget.nvim')
  use('ray-x/lsp_signature.nvim')
  use('williamboman/nvim-lsp-installer')
  use('onsails/lspkind-nvim')
  use('folke/trouble.nvim')
  use('b0o/SchemaStore.nvim')

  -- VIM WIKI
  use({
    'vimwiki/vimwiki',
    ft = { 'markdown', 'wiki' },
    config = function()
      vim.g.vimwiki_list = {
        {
          path = '~/Documents/wiki/',
          syntax = 'markdown',
          ext = '.md',
        },
      }
      vim.g.vimwiki_global_ext = 0
    end,
  })

  -- General
  use('ahmedkhalf/project.nvim')
  use('kevinhwang91/nvim-bqf')
  use('folke/todo-comments.nvim')
  use('ghillb/cybu.nvim')
  use('rcarriga/nvim-notify')
  use('RRethy/vim-illuminate')
  use('christianchiarulli/hop.nvim')
  use({ 'Muslik/browse.nvim', branch = 'mac-os-devdocs-fix' })
  use('windwp/nvim-spectre')
  use('folke/which-key.nvim')
  use('lewis6991/impatient.nvim')
  use('lukas-reineke/indent-blankline.nvim')
  use('tpope/vim-surround')
  use({ 'numToStr/Comment.nvim' })
  use({ 'akinsho/toggleterm.nvim' })
  use({ 'nvim-lualine/lualine.nvim' })

  -- Snippets & Language & Syntax
  use('jose-elias-alvarez/typescript.nvim')
  use('simrat39/rust-tools.nvim')
  use('NTBBloodbath/rest.nvim')
  use('mattn/emmet-vim')
  use('windwp/nvim-autopairs')
  use({ 'norcalli/nvim-colorizer.lua' })
  use('rafamadriz/friendly-snippets')
  use('abecodes/tabout.nvim')

  -- Nvim Tree
  use({
    'nvim-neo-tree/neo-tree.nvim',
    tag = 'v2.27',
    requires = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
      {
        's1n7ax/nvim-window-picker',
      },
    },
  })

  use({
    'iamcco/markdown-preview.nvim',
    run = 'cd app && npm install',
    config = function()
      vim.g.mkdp_filetypes = { 'markdown', 'vimwiki' }
    end,
  })

  -- Git
  use({ 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } })

  -- Dap
  use('mfussenegger/nvim-dap')
  use({ 'rcarriga/nvim-dap-ui', requires = { 'mfussenegger/nvim-dap' } })

  use('folke/zen-mode.nvim')

  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
