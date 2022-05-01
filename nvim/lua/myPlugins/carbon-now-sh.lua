local ENCODE_URI_COMMAND = 'echo "%s" | jq -sRr @uri'
local OPEN_COMMAND = 'open "%s"'
local CARBON_URL = 'https://carbon.now.sh'
local MAX_LENGTH = 1000

local default_params = {
  bg = "rgba(0,0,0,0)",
  t = "night-owl",
  ds = true,
  wc = true,
  wa = true,
  pv = "24px",
  ph = "16px",
  ln = false,
  f = "fira-code",
  fs = "16px"
}

local function create_url(params)
  params = params or default_params
  local url = CARBON_URL
  for k, v in pairs(params) do
    local separator = url:match("%?") and "&" or "?"
    url = url .. separator .. k .. "=" .. tostring(v)
  end
  return url
end

local function get_buffer_filetype()
  local buf = vim.api.nvim_get_current_buf()
  local ft = vim.api.nvim_buf_get_option(buf, 'filetype')
  return ft
end

local language_map = {
  css = "css",
  markdown = "markdown",
  json = "application/json",
  html = "htmlmixed",
  javascript = "javascript",
  javascriptreact = "jsx",
  typescriptreact = "text/typescript-jsx",
  typescript = "application/typescript",
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
  local params = default_params;
  params.code = code
  params.l = language
  return params
end

-- TODO: Add support for select and run command
-- now i can't figure out how to get current selected text instead of previous
local function carbon()
  local selection = get_visual_selection();
  if (selection ~= nil and string.len(selection) > MAX_LENGTH) then
    return
  end
  local language = get_language()
  local params = get_url_params(selection, language)
  local url = create_url(params)
  local command = string.format(OPEN_COMMAND, url)
  os.execute(command)
end

vim.api.nvim_create_user_command("Carbon", carbon, {})
