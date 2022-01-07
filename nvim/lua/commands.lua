local cmd = vim.cmd

function Org_mode()
  vim.fn.execute("cd ~/Documents/org-notes")
  require'telescope.builtin'.find_files({cwd = '~/Documents/org-notes', prompt_title = "Select note", results_title = "Notes"})
end

cmd([[command Notes lua Org_mode()]])
cmd([[command Postman tabnew .http]])
cmd([[command Jest lua require"jester".run({cmd = "npx jest -t '$result' -- $file"})]])
cmd([[command JestWatch lua require"jester".run({cmd = "npx jest --watch -t '$result' -- $file"})]])
cmd([[command JestFile lua require"jester".run_file({cmd = "npx jest -- $file"})]])
cmd([[command JestFileWatch lua require"jester".run_file({cmd = "npx jest --watch -- $file"})]])
cmd([[command JestLast lua require"jester".run_last()]])
