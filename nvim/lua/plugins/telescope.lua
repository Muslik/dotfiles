local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
  return
end

local actions = require('telescope.actions')
local action_layout = require('telescope.actions.layout')

telescope.setup({
  defaults = {
    path_display = { 'smart' },
    file_ignore_patterns = { 'node_modules', '^.git/' },
    prompt_prefix = '   ',
    mappings = {
      i = {
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-d>'] = actions.delete_buffer,
        ['?'] = action_layout.toggle_preview,
      },
      n = {
        ['<C-d>'] = actions.delete_buffer,
        ['?'] = action_layout.toggle_preview,
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
    lsp_code_actions = {
      theme = 'cursor',
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = false,
      case_mode = 'smart_case',
    },
    bookmarks = {
      selected_browser = 'chrome',
      url_open_command = 'open',
      full_path = false,
    },
  },
})

require('telescope').load_extension('live_grep_args')
require('telescope').load_extension('fzf')
require('telescope').load_extension('node_modules')
require('telescope').load_extension('bookmarks')
