local status_ok, window_picker = pcall(require, 'window-picker')
if not status_ok then
  return
end

window_picker.setup({
  autoselect_one = true,
  include_current = false,
  filter_rules = {
    bo = {
      filetype = { 'neo-tree', 'neo-tree-popup', 'notify', 'quickfix' },
      buftype = { 'terminal' },
    },
  },
  other_win_hl_color = '#e35e4f',
})
