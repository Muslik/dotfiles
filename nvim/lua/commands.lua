local api = vim.api;
local cmd = vim.cmd;

api.nvim_create_user_command("Postman", function() cmd("tabnew http.http") end, {})

cmd([[command Jest lua require"jester".run({cmd = "npx jest -t '$result' -- $file"})]])
cmd([[command JestWatch lua require"jester".run({cmd = "npx jest --watch -t '$result' -- $file"})]])
cmd([[command JestFile lua require"jester".run_file({cmd = "npx jest -- $file"})]])
cmd([[command JestFileWatch lua require"jester".run_file({cmd = "npx jest --watch -- $file"})]])
cmd([[command JestLast lua require"jester".run_last()]])


-- Disabled autocomment string
api.nvim_create_autocmd({ "BufEnter"}, {
  pattern = { "*" },
  command = [[set formatoptions-=cro]],
})
api.nvim_create_autocmd({ "BufEnter"}, {
  pattern = { "*" },
  command = [[setlocal formatoptions-=cro]],
})

