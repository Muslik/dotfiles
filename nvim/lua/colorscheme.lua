local cmd = vim.cmd

cmd('colorscheme ' .. VimConfig.colorscheme)
cmd('hi DiagnosticWarn guibg=none')
cmd('hi DiagnosticError guibg=none')
cmd('hi DiagnosticHint guibg=none')
cmd('hi DiagnosticInformation guibg=none')
cmd('hi NeoTreeTitleBar guibg=#96cdfb guifg=#000000')
cmd('hi Todo guibg=none')
cmd('hi Pmenu guibg=none')
--[[ cmd('hi Normal ctermbg=none guibg=none') ]]

