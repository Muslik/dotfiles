local status_ok, trouble = pcall(require, 'trouble')
if not status_ok then
  return
end

trouble.setup({
  auto_jump = { 'lsp_references' }, -- for the given modes, automatically jump if there is only a single result
  signs = {
    other = '',
  },
})
