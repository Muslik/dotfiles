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
    disable = { 'html' },
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
    colors = {
      '#68a0b0',
      '#946EaD',
      '#c7aA6D',
    },
    disabled = { 'html' },
  },
})
