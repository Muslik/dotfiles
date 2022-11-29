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
  ensure_installed = { "bash", "c", "javascript", "json", "lua", "python", "typescript", "tsx", "css", "rust", "yaml"},
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
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  autotag = {
    enable = true,
    disable = { 'xml', 'markdown' },
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = 1000,
    colors = {
      '#68a0b0',
      '#946EaD',
      '#c7aA6D',
    },
    disable = function(_, buf)
      return is_big_file(buf)
    end
  },
})
