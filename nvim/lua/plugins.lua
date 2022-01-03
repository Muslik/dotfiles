local fn = vim.fn
local cmd = vim.cmd

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local compile_path = install_path .. "/plugin/packer_compiled.lua"
local is_installed = fn.empty(fn.glob(install_path)) == 0

if not is_installed then
  if fn.input("Install packer.nvim?") == "y" then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    cmd 'packadd packer.nvim'
    print("Installed packer.nvim.")
    is_installed = 1
  end
end

local packer = nil
if not is_installed then return end
if packer == nil then
  packer = require('packer')
  packer.init({
    compile_path = compile_path
  })
end

local use = packer.use

-- Packer can manage itself
use 'wbthomason/packer.nvim'

use 'nvim-lua/plenary.nvim'
use 'nathom/filetype.nvim'
use {'kyazdani42/nvim-web-devicons', config = "require('plugins.web-devicons')"}
use {'glepnir/dashboard-nvim', config = "require('plugins.dashboard')"}

-- Themes
use { 'xolox/vim-colorscheme-switcher', requires = { 'xolox/vim-misc' }}
use 'flazz/vim-colorschemes'
use 'folke/tokyonight.nvim'
use 'pacokwon/onedarkhc.vim'
use 'joshdick/onedark.vim'
use 'bluz71/vim-nightfly-guicolors'
use 'iandwelker/rose-pine-vim'

-- Treesitter
use {'nvim-treesitter/nvim-treesitter',
  config = "require('plugins.treesitter')",
  run = ':TSUpdate'}

-- Telescope
use {'nvim-telescope/telescope.nvim',
  config = "require('plugins.telescope')",
  requires = {
    {'nvim-lua/popup.nvim'},
    {'nvim-lua/plenary.nvim'},
    {'nvim-telescope/telescope-fzf-native.nvim'},
    {'nvim-telescope/telescope-node-modules.nvim'}
  }
}
use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
use {'ahmedkhalf/project.nvim', config = "require('plugins.project')"}

-- LSP Base
use 'neovim/nvim-lspconfig'

-- LSP Cmp
use {'hrsh7th/nvim-cmp', event = 'InsertEnter', config = "require('plugins.cmp')"}
use {'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp'}
use {'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp'}
use {'hrsh7th/cmp-buffer', after = 'nvim-cmp' }
use {'hrsh7th/cmp-path', after = 'nvim-cmp' }
use { 'hrsh7th/cmp-calc', after = 'nvim-cmp' }
use {'tzachar/cmp-tabnine', run='./install.sh', config = "require('plugins.tabnine')", after = 'nvim-cmp'}
use {'David-Kunz/cmp-npm', requires = 'nvim-lua/plenary.nvim', config = "require('plugins.cmp-npm')", after = 'nvim-cmp'}
use { 'L3MON4D3/LuaSnip', config = "require('plugins.luasnip')" }
use { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' }

-- LSP Addons
use 'williamboman/nvim-lsp-installer'
use 'onsails/lspkind-nvim'
use {'SmiteshP/nvim-gps', config = "require('plugins.gps')"}

-- ORG MODE
use {
  'nvim-orgmode/orgmode',
  config = "require('plugins.orgmode')",
}
use {
  'akinsho/org-bullets.nvim',
  config = "require('plugins.orgbullets')"
}
use {
  'lukas-reineke/headlines.nvim',
  config = function()
    require('headlines').setup()
  end,
}

-- General
use {'kevinhwang91/rnvimr', config = "require('plugins.rnvimr')"}
use "lukas-reineke/indent-blankline.nvim"
use 'tpope/vim-surround'
use {'numToStr/Comment.nvim', config = "require('plugins.comment')"}
use 'JoosepAlviste/nvim-ts-context-commentstring'
use {'numtostr/FTerm.nvim', config = "require('plugins.fterm')"}
use { 'junegunn/goyo.vim', config = "require('plugins.goyo')"}
use {
  'junegunn/fzf.vim',
  requires = {{'junegunn/fzf', run = 'fzf#install()'}}
}
use { 'glepnir/galaxyline.nvim', after = 'nvim-gps', config = "require('plugins.galaxyline')" }

-- Snippets & Language & Syntax
use({
    "vuki656/package-info.nvim",
    requires = "MunifTanjim/nui.nvim",
    config = "require('plugins.package-info')"
})
use { 'NTBBloodbath/rest.nvim', config = "require('plugins.rest')" }
use { 'mattn/emmet-vim', config = "require('plugins.emmet')"}
use 'pangloss/vim-javascript'
use 'David-Kunz/jester'
use { 'windwp/nvim-autopairs', config = "require('plugins.autopairs')"}
use { 'norcalli/nvim-colorizer.lua', ft = {'css', 'scss', 'sass', 'html'}, config = "require('plugins.colorizer')"}
use 'rafamadriz/friendly-snippets'
use { 'fatih/vim-go', run = ':GoUpdateBinaries', ft = {'go'} }
use 'simrat39/rust-tools.nvim'

-- Nvim Tree
use {'kyazdani42/nvim-tree.lua', config = "require('plugins.tree')"}

-- Git
use 'kdheepak/lazygit.nvim'
use {'lewis6991/gitsigns.nvim',
  requires = { 'nvim-lua/plenary.nvim' },
  config = "require('plugins.gitsigns')",
  event = "BufRead"
}
use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
