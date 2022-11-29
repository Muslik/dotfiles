local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  return
end

configs.setup({
  ensure_installed = 'all',
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
      if vim.tbl_contains({ "latex" }, lang) then
        return true
      end

      local status_ok, big_file_detected = pcall(vim.api.nvim_buf_get_var, buf, "bigfile_disable_treesitter")
      return status_ok and big_file_detected
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
    disabled = { 'html' },
  },
})
