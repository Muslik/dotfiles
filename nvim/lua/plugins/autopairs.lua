local status_ok, npairs = pcall(require, 'nvim-autopairs')
if not status_ok then
  return
end

npairs.setup({
  check_ts = true,
  fast_wrap = {},
})
