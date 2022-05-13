require('impatient')
local fn = vim.fn
local cmd = vim.cmd

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local compile_path = install_path .. "/plugin/packer_compiled.lua"
local is_installed = fn.empty(fn.glob(install_path)) == 0

if not is_installed then
  if fn.input("Install packer.nvim? ") == "y" then
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
use({
  "catppuccin/nvim",
  as = "catppuccin",
})
use { 'lalitmee/cobalt2.nvim', requires = 'tjdevries/colorbuddy.nvim' }
use 'marko-cerovac/material.nvim'
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
    {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
    {'nvim-telescope/telescope-node-modules.nvim'}
  }
}
use {'ahmedkhalf/project.nvim', config = "require('plugins.project')"}

use {'stevearc/dressing.nvim'}

-- LSP Base
use 'neovim/nvim-lspconfig'

-- LSP Cmp
use {'hrsh7th/nvim-cmp', event = 'InsertEnter', config = "require('plugins.cmp')"}
use {'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp'}
use {'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp'}
use {'hrsh7th/cmp-buffer', after = 'nvim-cmp' }
use {'hrsh7th/cmp-path', after = 'nvim-cmp' }
use { 'hrsh7th/cmp-calc', after = 'nvim-cmp' }
use {'David-Kunz/cmp-npm', requires = 'nvim-lua/plenary.nvim', config = "require('plugins.cmp-npm')", after = 'nvim-cmp'}
use { 'L3MON4D3/LuaSnip', config = "require('plugins.luasnip')" }
use { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' }

-- LSP Addons
use 'williamboman/nvim-lsp-installer'
use 'onsails/lspkind-nvim'

-- VIM WIKI
use {
  'vimwiki/vimwiki',
  config = function()
    vim.g.vimwiki_list = {
      {
        path = '~/Documents/wiki/',
        syntax = 'markdown',
        ext = '.md',
      }
    }
    vim.g.vimwiki_global_ext = 0
  end
}
use {
  'lukas-reineke/headlines.nvim',
  config = function()
    require('headlines').setup()
  end
}

-- General
use 'simrat39/symbols-outline.nvim'
use 'lewis6991/impatient.nvim'
use {'lukas-reineke/indent-blankline.nvim',
  config = function()
    require('indent_blankline').setup({
      buftype_exclude = { 'terminal' },
      filetype_exclude = { 'dashboard' },
    })
  end
}
use 'tpope/vim-surround'
use {'numToStr/Comment.nvim', config = "require('plugins.comment')"}
use 'JoosepAlviste/nvim-ts-context-commentstring'
use {"akinsho/toggleterm.nvim", config = "require('plugins.toggleterm')"}
use {
  'junegunn/fzf.vim',
  requires = {{'junegunn/fzf', run = 'fzf#install()'}}
}
use { 'glepnir/galaxyline.nvim', config = "require('plugins.galaxyline')" }

-- Snippets & Language & Syntax
-- use { 'github/copilot.vim', config = "require('plugins.copilot')" }
use { 'NTBBloodbath/rest.nvim', config = "require('plugins.rest')" }
use { 'mattn/emmet-vim', config = "require('plugins.emmet')"}
use 'David-Kunz/jester'
use { 'windwp/nvim-autopairs', config = "require('plugins.autopairs')"}
use { 'norcalli/nvim-colorizer.lua', ft = {'css', 'scss', 'sass', 'html'}, config = "require('plugins.colorizer')"}
use 'rafamadriz/friendly-snippets'

-- Nvim Tree
use {
  "nvim-neo-tree/neo-tree.nvim",
    config = "require('plugins.tree')",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      {
        's1n7ax/nvim-window-picker',
        config = "require('plugins.window-picker')"
      }
    }
  }

-- Git
use {'lewis6991/gitsigns.nvim',
  requires = { 'nvim-lua/plenary.nvim' },
  config = "require('plugins.gitsigns')",
}

use {
  "folke/zen-mode.nvim",
  config = "require('plugins.zenmode')"
}
