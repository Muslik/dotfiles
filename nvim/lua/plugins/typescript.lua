local status_ok, typescript = pcall(require, 'typescript-tools')
if not status_ok then
  return
end

typescript.setup({})
