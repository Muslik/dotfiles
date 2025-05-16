local status_oker, neo_tree = pcall(require, 'neo-tree')
if not status_oker then
  return
end

neo_tree.setup({
  default_component_configs = {
    name = {
      trailing_slash = true,
      use_git_status_colors = true,
      highlight = 'NeoTreeFileName',
    },
    icon = {
      folder_closed = '',
      folder_open = '',
      folder_empty = '',
      folder_empty_open = '',
    },
    git_status = {
      symbols = {
        -- Change type
        added = ' ',
        deleted = ' ',
        modified = ' ',
        renamed = ' ',
        -- Status type
        untracked = ' ',
        ignored = ' ',
        unstaged = ' ',
        staged = ' ',
        conflict = ' ',
      },
    },
  },
  filesystem = {
    components = {
      icon = function(config, node)
        local icon = config.default or ' '
        local padding = config.padding or '  '
        local highlight = config.highlight

        if node.type == 'directory' then
          if node:is_expanded() then
            icon = config.folder_open or '-'
          else
            icon = config.folder_closed or '+'
          end
        elseif node.type == 'file' then
          local success, web_devicons = pcall(require, 'nvim-web-devicons')
          if success then
            local devicon, hl = web_devicons.get_icon(node.name, node.ext)
            icon = devicon or icon
            highlight = hl or highlight
          end
        end

        return {
          text = icon .. padding,
          highlight = highlight,
        }
      end,
    },
    filtered_items = {
      visible = false,
      hide_dotfiles = false,
      hide_gitignored = false,
      never_show = {
        '.DS_Store',
        '.git',
      },
    },
  },
  window = {
    position = 'float',
    mappings = {
      ['<space>'] = false,
      ['S'] = 'split_with_window_picker',
      ['s'] = 'vsplit_with_window_picker',
    },
  },
})
