local api = vim.api
local match = Utils.match
local capture = Utils.capture
local blame_parser = require('myFunctions.blame_parser')

local GIT_BLAME_PORCELAIN_COMMAND = 'git blame --line-porcelain -lL %d,%d %s'

local function is_hash_committed(str)
  return match(str, '%l%d')
end

local function run_blame_current_line(command)
  local line = api.nvim_win_get_cursor(0)[1]
  local buffer = api.nvim_buf_get_name(0)
  return capture(string.format(command, line, line, buffer))
end

local function is_git_repo(path)
  local git_dir = capture(string.format('git rev-parse --git-dir 2> /dev/null', path))
  if git_dir == '' then
    return false
  else
    return true
  end
end

local function get_parsed_blame_line()
  if not is_git_repo(vim.loop.cwd()) then
    return
  end
  local parser = blame_parser:new()
  local blame_line_output = run_blame_current_line(GIT_BLAME_PORCELAIN_COMMAND)
  return parser:parse(blame_line_output)
end

return {
  get_parsed_blame_line = get_parsed_blame_line,
  is_git_repo = is_git_repo,
  is_hash_committed = is_hash_committed,
}
