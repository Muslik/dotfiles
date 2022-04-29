vim.cmd([[highlight NeoTreeTitleBar guibg=#96cdfb guifg=#000000]])

require("neo-tree").setup({
  default_component_configs = {
    name = {
      trailing_slash = true,
      use_git_status_colors = true,
      highlight = "NeoTreeFileName",
    },
  },
  nesting_rules = {
    jsx = { "module.css", "module.scss", "scss" },
    -- tsx = { "module.css", "module.scss", "scss" },
  },
  filesystem = {
    components = {
      icon = function(config, node, state)
        local icon = config.default or " "
        local padding = config.padding or "  "
        local highlight = config.highlight

        if node.type == "directory" then
          if node:is_expanded() then
            icon = config.folder_open or "-"
          else
            icon = config.folder_closed or "+"
          end
        elseif node.type == "file" then
          local success, web_devicons = pcall(require, "nvim-web-devicons")
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
        ".DS_Store",
        ".git"
      },
    },
    follow_current_file = true,
  },
  window = {
    position = "float",
    mappings = {
      ["<Tab>"] = {
        "toggle_node",
        nowait = false,
      },
      ["S"] = "split_with_window_picker",
      ["s"] = "vsplit_with_window_picker",
    }
  }
})
