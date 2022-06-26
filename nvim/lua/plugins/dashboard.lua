local status_ok, db = pcall(require, "dashboard")
if not status_ok then
	return
end

local icons = VimConfig.icons

-- Created with figlet
db.custom_header = {
"                                                                ",
"                                                                ",
"                                                                ",
"                                                                ",
"                                                                ",
"████████▄   ▄███████▄     ▄█    █▄       ▄████████ ▀█████████▄  ",
"███   ▀███ ██▀     ▄██   ███    ███     ███    ███   ███    ███ ",
"███    ███       ▄███▀   ███    ███     ███    ███   ███    ███ ",
"███    ███  ▀█▀▄███▀▄▄  ▄███▄▄▄▄███▄▄   ███    ███  ▄███▄▄▄██▀  ",
"███    ███   ▄███▀   ▀ ▀▀███▀▀▀▀███▀  ▀███████████ ▀▀███▀▀▀██▄  ",
"███    ███ ▄███▀         ███    ███     ███    ███   ███    ██▄ ",
"███   ▄███ ███▄     ▄█   ███    ███     ███    ███   ███    ███ ",
"████████▀   ▀████████▀   ███    █▀      ███    █▀  ▄█████████▀  ",
"                                                                ",
"                                                                ",
"                                                                ",
"                                                                ",
"                                                                ",
                                                                }

db.custom_center = {
  {
    icon = icons.fileNoBg .. ' ',
    desc = 'Find File                  ',
    action = 'Telescope find_files',
  },
  {
    icon = icons.t .. ' ',
    desc = 'Find Word                  ',
    action = 'Telescope live_grep',
  },
  {
    icon = icons.folder .. ' ',
    desc = 'Recent Projects            ',
    action = 'Telescope projects',
  },
  {
    icon = icons.vim .. ' ',
    desc = 'Settings                   ',
    action = 'edit $MYVIMRC'},
  {
    icon = icons.container .. ' ',
    desc = 'Exit                       ',
    action = 'exit'
  },
}
