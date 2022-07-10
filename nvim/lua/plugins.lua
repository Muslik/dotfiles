require('impatient')
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

local use = packer.use

-- Packer can manage itself
use('wbthomason/packer.nvim')

use('nvim-lua/plenary.nvim')
use('nathom/filetype.nvim')
use({ 'kyazdani42/nvim-web-devicons', config = "require('plugins.web-devicons')" })
use({ 'glepnir/dashboard-nvim', config = "require('plugins.dashboard')" })

-- Themes
use({
  'catppuccin/nvim',
  as = 'catppuccin',
})
use({ 'lalitmee/cobalt2.nvim', requires = 'tjdevries/colorbuddy.nvim' })
use('marko-cerovac/material.nvim')
use('folke/tokyonight.nvim')
use('pacokwon/onedarkhc.vim')
use('joshdick/onedark.vim')
use('bluz71/vim-nightfly-guicolors')
use('iandwelker/rose-pine-vim')

-- Treesitter
use({ 'nvim-treesitter/nvim-treesitter', config = "require('plugins.treesitter')", run = ':TSUpdate' })

-- Telescope
use({
  'nvim-telescope/telescope.nvim',
  config = "require('plugins.telescope')",
  cmd = { 'Telescope' },
  requires = {
    { 'nvim-telescope/telescope-live-grep-args.nvim' },
    { 'nvim-lua/popup.nvim' },
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-node-modules.nvim' },
  },
})

use({ 'stevearc/dressing.nvim' })

-- LSP Base
use('neovim/nvim-lspconfig')

-- LSP Cmp
use({ 'hrsh7th/nvim-cmp', event = 'InsertEnter', config = "require('plugins.cmp')" })
use({ 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' })
use({ 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' })
use({ 'hrsh7th/cmp-buffer', after = 'nvim-cmp' })
use({ 'hrsh7th/cmp-path', after = 'nvim-cmp' })
use({ 'hrsh7th/cmp-calc', after = 'nvim-cmp' })
use({
  'David-Kunz/cmp-npm',
  requires = 'nvim-lua/plenary.nvim',
  config = "require('plugins.cmp-npm')",
  after = 'nvim-cmp',
})
use({ 'L3MON4D3/LuaSnip', config = "require('plugins.luasnip')" })
use({ 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' })

-- LSP Addons
use({
  'ray-x/lsp_signature.nvim',
  config = "require('lsp.lsp-signature')",
})
use('williamboman/nvim-lsp-installer')
use('onsails/lspkind-nvim')
use({
  'folke/trouble.nvim',
  config = "require('plugins.trouble')",
})

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
use({
  'lukas-reineke/headlines.nvim',
  config = function()
    require('headlines').setup()
  end,
})

-- General
use({ 'lalitmee/browse.nvim', config = "require('plugins.browse')" })
use('windwp/nvim-spectre')
use({ 'folke/which-key.nvim', config = "require('plugins.whichkey')" })
use('lewis6991/impatient.nvim')
use({
  'lukas-reineke/indent-blankline.nvim',
  config = "require('plugins.indent-blankline')",
})
use('tpope/vim-surround')
use({ 'numToStr/Comment.nvim', config = "require('plugins.comment')" })
use('JoosepAlviste/nvim-ts-context-commentstring')
use({ 'akinsho/toggleterm.nvim', config = "require('plugins.toggleterm')" })
use({ 'nvim-lualine/lualine.nvim', config = "require('plugins.lualine')" })

-- Snippets & Language & Syntax
use({ 'simrat39/rust-tools.nvim' })
use({ 'NTBBloodbath/rest.nvim', config = "require('plugins.rest')", cmd = { 'Postman' } })
use({ 'mattn/emmet-vim', config = "require('plugins.emmet')" })
use('David-Kunz/jester')
use({ 'windwp/nvim-autopairs', config = "require('plugins.autopairs')" })
use({ 'norcalli/nvim-colorizer.lua', ft = { 'css', 'scss', 'sass', 'html' }, config = "require('plugins.colorizer')" })
use('rafamadriz/friendly-snippets')

-- Nvim Tree
use({
  'nvim-neo-tree/neo-tree.nvim',
  config = "require('plugins.tree')",
  branch = 'v2.x',
  cmd = { 'Neotree' },
  requires = {
    'nvim-lua/plenary.nvim',
    'kyazdani42/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
    {
      's1n7ax/nvim-window-picker',
      config = "require('plugins.window-picker')",
    },
  },
})

-- Git
use({ 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' }, config = "require('plugins.gitsigns')" })

use({
  'folke/zen-mode.nvim',
  config = "require('plugins.zenmode')",
  cmd = { 'ZenMode' },
})
