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

local function contains(t, value)
  for _, v in pairs(t) do
    if v == value then
      return true
    end
  end
  return false
end

local mode = {
  function()
    return '▊'
  end,
  color = function()
    return { fg = mode_color[vim.fn.mode()] }
  end,
  padding = 0,
}

local hide_in_width = function(width)
  return function()
    return vim.fn.winwidth(0) > width
  end
end

local icons = VimConfig.icons

local diagnostics = {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  sections = { 'error', 'warn' },
  symbols = { error = icons.diagnostics.Error .. '  ', warn = icons.diagnostics.Warning .. '  ' },
  update_in_insert = false,
  always_visible = true,
  cond = hide_in_width(80),
}

local diff = {
  'diff',
  symbols = {
    added = icons.git.Add .. '  ',
    modified = icons.git.Mod .. '  ',
    removed = icons.git.Remove .. '  ',
  },
  cond = hide_in_width(80),
  separator = '│',
}

local filetype = {
  'filetype',
  fmt = function(str)
    local ui_filetypes = {
      'help',
      'packer',
      'Trouble',
      'Outline',
      'toggleterm',
      '',
    }

    if contains(ui_filetypes, str) then
      return ''
    else
      return str
    end
  end,
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
  cond = hide_in_width(50),
}

local progress = {
  'progress',
  color = 'SLProgress',
  cond = hide_in_width(40),
}

local location = {
  'location',
  color = function()
    return { fg = '#252525', bg = mode_color[vim.fn.mode()] }
  end,
  cond = hide_in_width(40),
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
    lualine_b = {},
    lualine_c = { filetype, filename, 'lsp_progress' },
    lualine_x = { diff, diagnostics },
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
