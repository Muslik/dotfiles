local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  return
end

local function is_big_file(buf)
  local max_filesize = 100 * 1024 -- 100 KB

  local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
  if ok and stats and stats.size > max_filesize then
    return true
  end
end

configs.setup({
  ensure_installed = {
    'bash',
    'c',
    'erlang',
    'elixir',
    'eex',
    'make',
    'javascript',
    'json',
    'lua',
    'python',
    'typescript',
    'tsx',
    'css',
    'rust',
    'yaml',
    'html',
    'css'
  },
  sync_install = false,
  ignore_install = { 'phpdoc', 'comment' },
  indent = {
    enable = true,
    disable = { 'html', 'css' },
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
    disable = function(lang, buf)
      if vim.tbl_contains({ 'latex' }, lang) then
        return true
      end

      return is_big_file(buf)
    end,
  },
})

local autotag_status_ok, autotag = pcall(require, 'nvim-ts-autotag')
if not autotag_status_ok then
  return
end

autotag.setup({
  opts = {
    enable_close = true, -- Auto close tags
    enable_rename = true, -- Auto rename pairs of tags
    enable_close_on_slash = false -- Auto close on trailing </
  },
})
