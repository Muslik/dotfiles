local status_ok, gitsigns = pcall(require, 'gitsigns')
local icons = require('icons')
if not status_ok then
  return
end

gitsigns.setup({
  signs = {
    add = {
      hl = 'GitSignsAdd',
      text = icons.ui.BoldLineLeft,
      numhl = 'GitSignsAddNr',
      linehl = 'GitSignsAddLn',
    },
    change = {
      hl = 'GitSignsChange',
      text = icons.ui.BoldLineLeft,
      numhl = 'GitSignsChangeNr',
      linehl = 'GitSignsChangeLn',
    },
    delete = {
      hl = 'GitSignsDelete',
      text = icons.ui.Triangle,
      numhl = 'GitSignsDeleteNr',
      linehl = 'GitSignsDeleteLn',
    },
    topdelete = {
      hl = 'GitSignsDelete',
      text = icons.ui.Triangle,
      numhl = 'GitSignsDeleteNr',
      linehl = 'GitSignsDeleteLn',
    },
    changedelete = {
      hl = 'GitSignsChange',
      text = icons.ui.BoldLineLeft,
      numhl = 'GitSignsChangeNr',
      linehl = 'GitSignsChangeLn',
    },
  },
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
  keymaps = {
    -- Default keymap options
    noremap = true,
    buffer = true,

    ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'" },
    ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_huk()<CR>'" },

    ['n <leader>ghs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    ['n <leader>ghu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    ['n <leader>ghr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
    ['n <leader>ghp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
    ['n <leader>gm'] = '<cmd>lua require"gitsigns".blame_line{full=true}<CR>',
  },
  watch_gitdir = {
    interval = 10000,
    follow_files = true,
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 700,
  },
  current_line_blame_formatter_opts = {
    relative_time = false,
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1,
  },
  diff_opts = {
    internal = true, -- If vim.diff or luajit is present
  },
  yadm = {
    enable = false,
  },
})
