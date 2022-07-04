local api = vim.api
local cmd = vim.cmd

api.nvim_create_user_command('Postman', function()
  cmd('tabnew http.http')
end, {})
api.nvim_create_user_command('Telescope live_grep_raw', function()
  cmd("lua require('telescope').extensions.live_grep_raw.live_grep_raw()")
end, {})
