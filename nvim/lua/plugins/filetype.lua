local status_ok, filetype = pcall(require, 'filetype')
if not status_ok then
  return
end

filetype.setup({
  overrides = {
    literal = {
      ['.lintstagedrc'] = 'json',
      ['.prettierrc'] = 'json',
    },
  },
})
