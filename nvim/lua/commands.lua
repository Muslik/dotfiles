local api = vim.api
local cmd = vim.cmd

api.nvim_create_user_command('Postman', function()
  cmd('tabnew http.http')
end, {})

api.nvim_create_user_command('LspToggleAutoFormat', function()
  cmd("lua require('lsp.handlers').toggle_format_on_save()")
end, {})

api.nvim_create_user_command("JsonF", function()
  cmd("%!jq .")
end, {})
