local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
	return
end

local cmd = vim.cmd

catppuccin.setup({
  transparent_background = true,
  transparent_panel = false,
  term_colors = false,
  which_key = true,
})
cmd('colorscheme ' .. VimConfig.colorscheme)
cmd('hi DiagnosticWarn guibg=none')
cmd('hi DiagnosticError guibg=none')
cmd('hi DiagnosticHint guibg=none')
cmd('hi DiagnosticInformation guibg=none')
cmd('hi NeoTreeTitleBar guibg=#96cdfb guifg=#000000')
cmd('hi Todo guibg=none')
cmd('hi Pmenu guibg=none')
