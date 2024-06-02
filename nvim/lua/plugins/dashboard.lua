local status_ok, db = pcall(require, 'dashboard')
if not status_ok then
  return
end

local icons = VimConfig.icons

db.setup({
  theme = 'doom',
  config = {
    week_header = {
      enable = true,
    },
    project = {
      icon = icons.folderOpenNoBg,
    },
    mru = {
      icon = icons.fileNoBg,
    },
    shortcut = {
      {
        icon = icons.ui.CloudDownload .. '  ',
        desc = 'Update',
        group = '@property',
        action = 'Lazy update',
        key = 'u',
      },
      { icon = icons.fileNoBg .. ' ', desc = 'Files', group = 'Label', action = 'Telescope find_files', key = 'f' },
      {
        icon = icons.settings .. ' ',
        desc = 'Dotfiles',
        group = 'Number',
        action = 'cd ~/dotfiles | edit $MYVIMRC',
        key = 'd',
      },
      {
        icon = icons.container .. ' ',
        desc = 'Exit',
        group = 'DiagnosticHint',
        action = ':q!',
        key = 'q',
      },
    },
  },
})
