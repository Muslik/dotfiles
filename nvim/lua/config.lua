VimConfig = {
  colorscheme = 'rose-pine',
  icons = require('icons'),
  colors = require('colors'),
}

Utils = require('utils')

require('catppuccin').setup({
  integrations = {
    cmp = true,
    fidget = true,
    gitsigns = true,
    harpoon = true,
    indent_blankline = {
      enabled = true,
      scope_color = 'mocha',
      colored_indent_levels = false,
    },
    mason = true,
    native_lsp = { enabled = true },
    noice = true,
    notify = true,
    symbols_outline = true,
    telescope = true,
    treesitter = true,
    treesitter_context = true,
  },
})

