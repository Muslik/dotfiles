local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  return
end

configs.setup({
  ensure_installed = 'all',
  sync_install = false,
  indent = {
    enable = true,
    disable = { 'html' },
  },
  highlight = {
    enable = true,
    disable = { 'html' },
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
})
