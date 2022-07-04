local ENCODE_URI_COMMAND = 'printf "%s" | jq -sRr @uri'
local ADD_TO_CLIPBOARD_COMMAND = 'echo "%s" | pbcopy'
local OPEN_COMMAND = 'open "%s"'
local CARBON_URL = 'https://carbon.now.sh'
local MAX_LENGTH = 1000

local default_params = {
  bg = 'rgba(0,0,0,0)',
  t = 'night-owl',
  ds = true,
  wc = false,
  wa = true,
  pv = '24px',
  ph = '16px',
  ln = false,
  f = 'Fira Code',
  fs = '16px',
}

local function create_url(params)
  params = params or default_params
  local url = CARBON_URL
  for k, v in pairs(params) do
    local separator = url:match('%?') and '&' or '?'
    url = url .. separator .. k .. '=' .. tostring(v)
  end
  return url
end

local function get_buffer_filetype()
  local buf = vim.api.nvim_get_current_buf()
  local ft = vim.api.nvim_buf_get_option(buf, 'filetype')
  return ft
end

local language_map = {
  css = 'css',
  lua = 'lua',
  markdown = 'markdown',
  json = 'application/json',
  html = 'htmlmixed',
  javascript = 'javascript',
  javascriptreact = 'jsx',
  typescriptreact = 'text/typescript-jsx',
  typescript = 'application/typescript',
}

local function get_language()
  local ft = get_buffer_filetype()
  local language = language_map[ft] or 'auto'
  return language
end

local function get_visual_selection()
  local s_start = vim.fn.getpos("'<")
  local s_end = vim.fn.getpos("'>")
  local n_lines = math.abs(s_end[2] - s_start[2]) + 1
  local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
  if next(lines) == nil then
    return nil
  end
  lines[1] = string.sub(lines[1], s_start[3], -1)
  if n_lines == 1 then
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3] - s_start[3] + 1)
  else
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
  end
  return table.concat(lines, '\n')
end

local function encode_uri(text)
  local cmd = string.format(ENCODE_URI_COMMAND, text)
  return Utils.capture(cmd)
end

local function get_url_params(selection, language)
  local code = selection ~= nil and encode_uri(selection) or ''
  local params = default_params
  params.code = code
  params.l = language
  return params
end

local function get_carbon_url(selection)
  local language = get_language()
  local params = get_url_params(selection, language)
  local url = create_url(params)
  return url
end

local function selection_to_url()
  local selection = get_visual_selection()
  if selection ~= nil and string.len(selection) > MAX_LENGTH then
    print("Sorry, input shouldn't be empty or more than " .. MAX_LENGTH .. ' symbols')
    return nil
  end
  return get_carbon_url(selection)
end

local function carbon_open()
  local url = selection_to_url()
  if url == nil then
    return
  end
  local command = string.format(OPEN_COMMAND, url)
  os.execute(command)
end

local function carbon_to_clipboard()
  local url = selection_to_url()
  if url == nil then
    return
  end
  local command = string.format(ADD_TO_CLIPBOARD_COMMAND, url)
  os.execute(command)
  print('Url was copied to clipboard')
end

vim.api.nvim_create_user_command('Carbon', carbon_to_clipboard, { range = true })
vim.api.nvim_create_user_command('CarbonOpen', carbon_open, { range = true })
