local status_ok, typescript = pcall(require, 'typescript')
if not status_ok then
  return
end

typescript.setup({})
