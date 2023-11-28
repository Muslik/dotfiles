local status_ok, copilot = pcall(require, 'copilot')
if not status_ok then
  return
end

copilot.setup({
  panel = {
    enabled = true,
    auto_refresh = false,
    keymap = {
      accept = "<CR>",
      refresh = "gr",
      open = "<M-CR>"
    },
  },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    debounce = 75,
    keymap = {
     accept = "<C-e>",
     next = "<M-]>",
     prev = "<M-[>",
     dismiss = "<C-c>",
    },
  },
  filetypes = {
    yaml = false,
    markdown = false,
    help = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    ["."] = false,
  },
  copilot_node_command = 'node', -- Node version must be < 18
  server_opts_overrides = {},
})
