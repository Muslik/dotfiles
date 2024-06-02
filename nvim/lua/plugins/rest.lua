local status_ok, rest_nvim = pcall(require, 'rest-nvim')
if not status_ok then
  return
end

rest_nvim.setup({
})
