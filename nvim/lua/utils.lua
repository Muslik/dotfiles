local tbl_extend = vim.tbl_extend
local api = vim.api
local M = {}

local extend_options = function(opt)
   local options = { noremap = true, silent = true }
   if opt then
      options = tbl_extend("force", options, opt)
   end
	 return options
end

M.dump = function (o)
	if type(o) == 'table' then
		local s = '{ '
		for k,v in pairs(o) do
			if type(k) ~= 'number' then k = '"'..k..'"' end
			s = s .. '['..k..'] = ' .. M.dump(v) .. ','
		end
		return s .. '} '
	else
		return tostring(o)
	end
end

M.map = function(mode, keys, cmd, opt)
	local options = extend_options(opt)
	api.nvim_set_keymap(mode, keys, cmd, options)
end

M.bmap = function(mode, keys, cmd, opt)
	local options = extend_options(opt)
	api.nvim_buf_set_keymap(0, mode, keys, cmd, options)
end

M.t = function (str)
    return api.nvim_replace_termcodes(str, true, true, true)
end

return M
