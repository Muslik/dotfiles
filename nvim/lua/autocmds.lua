local api = vim.api
local highlight_group = api.nvim_create_augroup("YankHighlight", { clear = true })
-- return to last position
api.nvim_command([[autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |  exe "normal! g`\"" | endif]])

api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "qf", "help", "man", "lspinfo" },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR> 
      set nobuflisted 
    ]]
  end,
})

-- Disabled autocomment string
api.nvim_create_autocmd("BufWinEnter", {
    callback = function()
        vim.opt_local.formatoptions:remove { "c", "r", "o" }
    end,
})

-- Highlight on yank
api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
})

api.nvim_create_autocmd({ "CursorMoved", "BufWinEnter", "BufFilePost", "InsertEnter", "BufWritePost" }, {
  callback = function()
    require("winbar").get_winbar()
  end,
})
