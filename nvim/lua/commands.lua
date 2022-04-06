local cmd = vim.cmd

cmd([[command Postman tabnew .http]])
cmd([[command Jest lua require"jester".run({cmd = "npx jest -t '$result' -- $file"})]])
cmd([[command JestWatch lua require"jester".run({cmd = "npx jest --watch -t '$result' -- $file"})]])
cmd([[command JestFile lua require"jester".run_file({cmd = "npx jest -- $file"})]])
cmd([[command JestFileWatch lua require"jester".run_file({cmd = "npx jest --watch -- $file"})]])
cmd([[command JestLast lua require"jester".run_last()]])


-- Disabled autocomment string
cmd("autocmd BufEnter * set formatoptions-=cro")
cmd("autocmd BufEnter * setlocal formatoptions-=cro")

