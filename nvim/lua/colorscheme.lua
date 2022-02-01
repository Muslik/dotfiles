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
-- cmd 'hi Normal ctermbg=none guibg=none'
-- cmd 'hi NonText ctermbg=none guibg=none'
-- cmd 'hi WarningDiagnostic guibg=none guifg=#ECB340 gui=bold'
-- cmd 'hi ErrorDiagnostic guibg=none guifg=#CC0000 gui=bold'
-- cmd 'hi HintDiagnostic guibg=none guifg=#EFEFF5 gui=bold'
-- cmd 'hi InformationDiagnostic guibg=none guifg=#B3CCFF gui=bold'
