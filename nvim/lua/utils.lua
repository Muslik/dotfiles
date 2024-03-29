local tbl_extend = vim.tbl_extend
local api = vim.api
local M = {}

local extend_options = function(opt)
  local options = { noremap = true, silent = true }
  if opt then
    options = tbl_extend('force', options, opt)
  end
  return options
end

M.isempty = function(s)
  return s == nil or s == ''
end

M.get_buf_option = function(opt)
  local status_ok, buf_option = pcall(vim.api.nvim_buf_get_option, 0, opt)
  if not status_ok then
    return nil
  else
    return buf_option
  end
end

M.is_buffer_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) == 1 then
    return true
  end
  return false
end

M.split = function(inputstr, sep)
  if sep == nil then
    sep = '%s'
  end
  local t = {}
  for str in string.gmatch(inputstr, '([^' .. sep .. ']+)') do
    table.insert(t, str)
  end
  return t
end

M.slice = function(tbl, first, last, step)
  local sliced = {}

  for i = first or 1, last or #tbl, step or 1 do
    sliced[#sliced + 1] = tbl[i]
  end

  return sliced
end

M.dump = function(o)
  if type(o) == 'table' then
    local s = '{ '
    for k, v in pairs(o) do
      if type(k) ~= 'number' then
        k = '"' .. k .. '"'
      end
      s = s .. '[' .. k .. '] = ' .. M.dump(v) .. ','
    end
    return s .. '} '
  else
    return tostring(o)
  end
end

M.capture = function(command)
  local handle = io.popen(command)
  if not handle then
    return nil
  end
  if not handle:read(0) then
    handle:close()
    return nil
  end
  local commit = handle:read('*a')
  handle:close()
  return commit
end

M.match = function(str, pattern)
  local string = str:match(pattern)
  if string then
    return true
  else
    return false
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

local diagnostics_active = true
M.toggle_diagnostics = function()
  diagnostics_active = not diagnostics_active
  if diagnostics_active then
    vim.diagnostic.show()
  else
    vim.diagnostic.hide()
  end
end

M.t = function(str)
  return api.nvim_replace_termcodes(str, true, true, true)
end

return M
