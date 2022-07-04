local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
  return
end

vim.api.nvim_set_hl(0, 'SLGitIcon', { fg = '#E8AB53', bg = '#303030' })
vim.api.nvim_set_hl(0, 'SLBranchName', { fg = '#D4D4D4', bg = '#303030', bold = false })
vim.api.nvim_set_hl(0, 'SLProgress', { fg = '#D4D4D4', bg = '#303030' })
vim.api.nvim_set_hl(0, 'SLSeparator', { fg = '#808080', bg = '#252525' })
local mode_color = {
  n = '#569cd6',
  i = '#6a9955',
  v = '#c586c0',
  [''] = '#c586c0',
  V = '#c586c0',
  c = '#4EC9B0',
  no = '#569cd6',
  s = '#ce9178',
  S = '#ce9178',
  [''] = '#ce9178',
  ic = '#dcdcaa',
  R = '#d16969',
  Rv = '#d16969',
  cv = '#569cd6',
  ce = '#569cd6',
  r = '#d16969',
  rm = '#4EC9B0',
  ['r?'] = '#4EC9B0',
  ['!'] = '#4EC9B0',
  t = '#D7BA7D',
}

local mode = {
  function()
    return '▊'
  end,
  color = function()
    return { fg = mode_color[vim.fn.mode()] }
  end,
  padding = 0,
}

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local icons = VimConfig.icons

local diagnostics = {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  sections = { 'error', 'warn' },
  symbols = { error = icons.diagnostics.Error .. '  ', warn = icons.diagnostics.Warning .. '  ' },
  colored = false,
  update_in_insert = false,
  always_visible = true,
}

local diff = {
  'diff',
  colored = true,
  symbols = {
    added = icons.git.Add .. '  ',
    modified = icons.git.Mod .. '  ',
    removed = icons.git.Remove .. '  ',
  }, -- changes diff symbols
  cond = hide_in_width,
  separator = '│ ',
}

local filetype = {
  'filetype',
  icon_only = true,
}

local filename = {
  'filename',
  color = 'Normal',
}

local branch = {
  'branch',
  icons_enabled = true,
  icon = '%#SLGitIcon#' .. ' ' .. '%*' .. '%#SLBranchName#',
  colored = false,
}

local progress = {
  'progress',
  color = 'SLProgress',
}

local spaces = {
  function()
    return 'spaces: ' .. vim.api.nvim_buf_get_option(0, 'shiftwidth') .. ' '
  end,
  padding = 0,
  separator = ' │ ' .. '%*',
}

local location = {
  'location',
  color = function()
    return { fg = '#252525', bg = mode_color[vim.fn.mode()] }
  end,
}

lualine.setup({
  options = {
    globalstatus = false,
    icons_enabled = true,
    theme = 'catppuccin',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = { 'alpha', 'dashboard' },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { mode, branch },
    lualine_b = { diagnostics },
    lualine_c = { filetype, filename },
    lualine_x = { diff, spaces },
    lualine_y = { progress },
    lualine_z = { location },
  },
  inactive_sections = {
    lualine_a = { filetype, filename },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
})
