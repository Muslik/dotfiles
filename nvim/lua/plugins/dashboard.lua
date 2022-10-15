local status_ok, db = pcall(require, 'dashboard')
if not status_ok then
  return
end

local icons = VimConfig.icons

-- Created with figlet
db.custom_header = {
  '                                                                ',
  '                                                                ',
  '                                                                ',
  '                                                                ',
  '                                                                ',
  '████████▄   ▄███████▄     ▄█    █▄       ▄████████ ▀█████████▄  ',
  '███   ▀███ ██▀     ▄██   ███    ███     ███    ███   ███    ███ ',
  '███    ███       ▄███▀   ███    ███     ███    ███   ███    ███ ',
  '███    ███  ▀█▀▄███▀▄▄  ▄███▄▄▄▄███▄▄   ███    ███  ▄███▄▄▄██▀  ',
  '███    ███   ▄███▀   ▀ ▀▀███▀▀▀▀███▀  ▀███████████ ▀▀███▀▀▀██▄  ',
  '███    ███ ▄███▀         ███    ███     ███    ███   ███    ██▄ ',
  '███   ▄███ ███▄     ▄█   ███    ███     ███    ███   ███    ███ ',
  '████████▀   ▀████████▀   ███    █▀      ███    █▀  ▄█████████▀  ',
  '                                                                ',
  '                                                                ',
  '                                                                ',
  '                                                                ',
  '                                                                ',
}

db.custom_center = {
  {
    icon = icons.fileNoBg .. ' ',
    desc = 'Find File                  ',
    action = "lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{path_display = {'smart'}, previewer = false})",
    shortcut = 'SPC f f'
  },
  {
    icon = icons.t .. ' ',
    desc = 'Find Word                  ',
    action = 'Telescope live_grep theme=ivy',
    shortcut = 'SPC f t'
  },
  {
    icon = icons.settings .. ' ',
    desc = 'Open configuration         ',
    action = 'cd ~/dotfiles | edit $MYVIMRC',
    shortcut = 'SPC e c'
  },
  {
    icon = icons.container .. ' ',
    desc = 'Exit                       ',
    action = 'exit',
    shortcut = 'SPC q  '
  },
}
