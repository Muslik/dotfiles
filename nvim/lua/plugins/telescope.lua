local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
  return
end

local actions = require('telescope.actions')
local action_layout = require('telescope.actions.layout')

telescope.setup({
  defaults = {
    layout_strategy = 'vertical',
    preview = {
      timeout = 1000,
    },
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
    },
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
        width = 0.6,
        height = 0.5,
        preview_height = 0,
      },
      prompt_position = 'top',
    },
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    file_ignore_patterns = { 'node_modules', '^.git/' },
    prompt_prefix = '   ',
    color_devicons = true,

    sorting_strategy = 'ascending',

    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,

    mappings = {
      i = {
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
    live_grep = {
      layout_config = {
        vertical = {
          height = 0.7,
          preview_height = 0.4,
        },
      },
    },
    live_grep_args = {
      layout_config = {
        vertical = {
          preview_height = 0.5,
        },
      },
    },
    lsp_code_actions = {
      theme = 'cursor',
    },
  },
  extensions = {
    fzf = {
      override_generic_sorter = false,
      override_file_sorter = true,
      case_mode = 'smart_case',
    },
  },
})

require('telescope').load_extension('live_grep_args')
require('telescope').load_extension('fzf')
require('telescope').load_extension('projects')
require('telescope').load_extension('node_modules')
