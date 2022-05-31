local actions    = require('telescope.actions')

require('telescope').setup {
  defaults = {
    layout_strategy = "horizontal",
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
      '--smart-case'
    },
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
      prompt_position = "top",
    },
    file_sorter      = require('telescope.sorters').get_fzy_sorter,
    file_ignore_patterns = { "node_modules" },
    prompt_prefix    = ' 🔍 ',
    color_devicons   = true,

    sorting_strategy = "ascending",

    file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,

    mappings = {
      i = {
        ["<C-x>"] = false,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.send_to_qflist,
        ["<C-s>"] = actions.cycle_previewers_next,
        ["<C-a>"] = actions.cycle_previewers_prev,
      },
      n = {
        ["<C-s>"] = actions.cycle_previewers_next,
        ["<C-a>"] = actions.cycle_previewers_prev,
      }
    }
  },
  pickers = {
    lsp_code_actions = {
      theme = "cursor",
    },
  },
  extensions = {
    fzf = {
      override_generic_sorter = false,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  }
}

require("telescope").load_extension("live_grep_raw")
require('telescope').load_extension('fzf')
require('telescope').load_extension('projects')
require('telescope').load_extension('node_modules')
