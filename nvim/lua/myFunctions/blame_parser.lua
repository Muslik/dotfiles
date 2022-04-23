local split = Utils.split;
local slice = Utils.slice;

local BLAME_MAPPING = {
  ['author'] = 'author',
  ['author-mail'] = 'author_email',
  ['author-time'] = 'author_time',
  ['author-tz'] = 'author_timezone',
  ['committer'] = 'committer',
  ['committer-mail'] = 'committer_email',
  ['committer-time'] = 'committer_time',
  ['committer-tz'] = 'committer_timezone',
  ['summary'] = 'summary',
  ['previous'] = 'previous',
  ['filename'] = 'filename',
}

local BlameParser = {}

function BlameParser:new()
  local o = {
    author = '',
    author_email = '',
    author_time = '',
    author_timezone = '',
    committer = '',
    committer_email = '',
    committer_time = '',
    committer_timezone = '',
    summary = '',
    previous = '',
    filename = '',
    hash = '',
  }
  setmetatable(o, self)
  self.__index = self
  return o
end

function BlameParser:_parse_line(line_arr)
  local key = BLAME_MAPPING[line_arr[1]]
  if (not key) then
    return
  end
  if (key == 'committer' or key == 'summary' or key == 'previous' or key == 'author') then
    self[key] = table.concat(slice(line_arr, 2), ' ')
  else
    self[key] = line_arr[2]
  end
end

function BlameParser:parse(blame)
  local lines = split(blame, '\n')
  for _, v in pairs(lines) do
    local line_arr = split(v)
    -- This is hash
    if (string.len(line_arr[1] or "") == 40) then
      self.hash = line_arr[1]
    else
      self:_parse_line(line_arr)
    end
  end
  return self;
end

return BlameParser
