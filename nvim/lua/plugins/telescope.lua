local actions    = require('telescope.actions')
local previewers = require('telescope.previewers')
local builtin    = require('telescope.builtin')

require('telescope').setup {
  defaults = {
    layout_strategy = "center",
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
    prompt_prefix    = ' 🔍 ',
    color_devicons   = true,

    sorting_strategy = "ascending",

    file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
    -- qflist_previewer = require('telescope.previewers').vi_buffer_qflist.new,

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

require('telescope').load_extension('fzf')
require('telescope').load_extension('projects')
require('telescope').load_extension('node_modules')
require('telescope').load_extension('vimwiki')

-- Implement delta as previewer for diffs

local M = {}

local delta = previewers.new_termopen_previewer {
  get_command = function(entry)
    return { 'git', '-c', 'core.pager=delta', '-c', 'delta.side-by-side=false', 'diff', entry.value .. '^!' }
  end
}

M.my_git_commits = function(opts)
  opts = opts or {}
  opts.previewer = {
    delta,
    previewers.git_commit_message.new(opts),
    previewers.git_commit_diff_as_was.new(opts),
  }

  builtin.git_commits(opts)
end

M.my_git_bcommits = function(opts)
  opts = opts or {}
  opts.previewer = {
    delta,
    previewers.git_commit_message.new(opts),
    previewers.git_commit_diff_as_was.new(opts),
  }

  builtin.git_bcommits(opts)
end

M.edit_neovim = function()
  builtin.git_files {
    cwd = "~/.config/nvim",
    prompt = "~ dotfiles ~",
    color_devicons   = true,
    sorting_strategy = "ascending",
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
      prompt_position = "top",
    },
  }
end

return M
