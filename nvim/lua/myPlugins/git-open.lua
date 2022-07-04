local api = vim.api
local git = require('myFunctions.git')
local split = Utils.split
local match = Utils.match
local capture = Utils.capture
local is_buffer_empty = Utils.is_buffer_empty

local GIT_BLAME_COMMAND = 'git blame -lL %d,%d %s'

local urls = {
  ['bitbucket.org'] = 'https://bitbucket.org/%s/%s/commits/%s',
  ['github.com'] = 'https://github.com/%s/%s/commit/%s',
}

local function remove_symbols_from_commit(commit)
  return commit:gsub('[^%w%s]', '')
end

local function is_ssh(str)
  return match(str, '^git@[%w%p]+:')
end

local function get_domain_from_url(url)
  return url:match('^https?://([^/]+)')
end

local function get_domain_from_ssh(ssh)
  return ssh:match('^git@([^:]+):')
end

local function get_workspace_and_project_from_url(url)
  if is_ssh(url) then
    -- git@github.com:Muslik/dotfiles.git -> Muslik, dotfiles
    return unpack(split(split(url, ':')[2], '/'))
  end
  -- https://github.com/Muslik/dotfiles -> Muslik, dotfiles
  return select(3, unpack(split(url, '/')))
end

local function run_blame_current_line(command)
  local line = api.nvim_win_get_cursor(0)[1]
  local buffer = api.nvim_buf_get_name(0)
  return capture(string.format(command, line, line, buffer))
end

local function create_remote_url(url, commit_hash)
  local workspace, project = get_workspace_and_project_from_url(url)
  local domain = is_ssh(url) and get_domain_from_ssh(url) or get_domain_from_url(url)
  local commit_url = urls[domain]
  -- remvove .git extendsion from name
  project = project:gsub('%.git$', '')
  return string.format(commit_url, workspace, project, commit_hash)
end

local function open_commit_in_browser()
  if is_buffer_empty() or not git.is_git_repo(vim.loop.cwd()) then
    return
  end

  local blame_line_output = run_blame_current_line(GIT_BLAME_COMMAND)
  if blame_line_output == nil then
    return
  end
  local git_commit_hash = unpack(split(blame_line_output))
  local cleaned_commit_hash = remove_symbols_from_commit(git_commit_hash)

  if not git.is_hash_committed(cleaned_commit_hash) then
    return
  end

  local git_remote_url = split(capture('git remote -v'))[2]
  local commit_url = create_remote_url(git_remote_url, cleaned_commit_hash)
  os.execute('open ' .. commit_url)
end

api.nvim_create_user_command('GitOpenCommit', open_commit_in_browser, {})
