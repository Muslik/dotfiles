local cmd = vim.cmd

require('catppuccin').setup({
  transparent_background = true,
  transparent_panel = true,
  term_colors = false,
  integrations = {
    nvimtree = {
      enabled = true,
      show_root = true,
      transparent_panel = true,
    }
  }
})
cmd ('colorscheme ' .. VimConfig.colorscheme)
cmd 'hi Pmenu guibg=none'
-- cmd 'hi NonText ctermbg=none guibg=none'
cmd 'hi DiagnosticWarn guibg=none'
cmd 'hi DiagnosticError guibg=none'
cmd 'hi DiagnosticHint guibg=none'
cmd 'hi DiagnosticInformation guibg=none'
cmd 'hi NeoTreeTitleBar guibg=#96cdfb guifg=#000000'

