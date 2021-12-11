local bmap = require("utils").bmap
local cmd = vim.cmd

local function http_mappings()
	bmap('n', '<leader>r', ':lua require("rest-nvim").run()<CR>')
end

local filetypes = {
  http = http_mappings,
}

for filetype, _ in pairs(filetypes) do
	local command = "autocmd FileType "..filetype.." lua require('filetype-mappings')."..filetype.."()"
	cmd(command)
end

return filetypes
