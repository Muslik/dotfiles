local status_ok, zen_mode = pcall(require, "zen-mode")
if not status_ok then
	return
end

zen_mode.setup {
  window = {
    backdrop = 0.95,
    width = 120,
    height = 1,
  }
}
