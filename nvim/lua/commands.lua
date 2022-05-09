local api = vim.api;
local cmd = vim.cmd;

api.nvim_create_user_command("Postman", function() cmd("tabnew http.http") end, {})
