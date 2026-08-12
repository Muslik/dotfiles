local status_ok, tailwind = pcall(require, 'tailwind-tools')
if not status_ok then
  return
end

tailwind.setup({
  server = {
    override = false,
  },
})
