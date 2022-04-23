local api = vim.api
-- return to last position
api.nvim_command([[autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |  exe "normal! g`\"" | endif]])
api.nvim_exec([[ autocmd FileType scss setl iskeyword+=@-@ ]], false)

api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*",
  callback = function()
    api.nvim_command("set updatetime=300")
  end,
})

api.nvim_create_autocmd("CursorHold", {
  pattern = "*",
  callback = function()
    api.nvim_command("checktime")
  end,
})
