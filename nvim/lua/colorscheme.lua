local cmd = vim.cmd

cmd ('colorscheme ' .. VimConfig.colorscheme)
cmd 'hi Normal ctermbg=none guibg=none'
cmd 'hi NonText ctermbg=none guibg=none'
cmd 'hi WarningDiagnostic guibg=none guifg=#ECB340 gui=bold'
cmd 'hi ErrorDiagnostic guibg=none guifg=#CC0000 gui=bold'
cmd 'hi HintDiagnostic guibg=none guifg=#EFEFF5 gui=bold'
cmd 'hi InformationDiagnostic guibg=none guifg=#B3CCFF gui=bold'
