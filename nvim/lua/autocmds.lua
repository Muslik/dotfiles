local api = vim.api
-- return to last position
api.nvim_command([[autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |  exe "normal! g`\"" | endif]])
api.nvim_exec([[ autocmd FileType scss setl iskeyword+=@-@ ]], false)
