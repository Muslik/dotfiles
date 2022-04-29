local icons = VimConfig.icons

-- Created with figlet
vim.g.dashboard_custom_header = {
"████████▄   ▄███████▄     ▄█    █▄       ▄████████ ▀█████████▄  ",
"███   ▀███ ██▀     ▄██   ███    ███     ███    ███   ███    ███ ",
"███    ███       ▄███▀   ███    ███     ███    ███   ███    ███ ",
"███    ███  ▀█▀▄███▀▄▄  ▄███▄▄▄▄███▄▄   ███    ███  ▄███▄▄▄██▀  ",
"███    ███   ▄███▀   ▀ ▀▀███▀▀▀▀███▀  ▀███████████ ▀▀███▀▀▀██▄  ",
"███    ███ ▄███▀         ███    ███     ███    ███   ███    ██▄ ",
"███   ▄███ ███▄     ▄█   ███    ███     ███    ███   ███    ███ ",
"████████▀   ▀████████▀   ███    █▀      ███    █▀  ▄█████████▀  ",
                                                                }

vim.g.dashboard_session_directory = '~/.config/nvim/sessions'
vim.g.dashboard_default_executive = 'fzf'
vim.g.dashboard_custom_section = {
  a = {description = {icons.fileNoBg ..     ' Find File          '}, command = 'Telescope find_files'},
  b = {description = {icons.t ..            ' Find Word          '}, command = 'Telescope live_grep'},
  c = {description = {icons.folder ..       ' Recent Projects    '}, command = 'Telescope projects'},
  d = {description = {icons.fileCopy ..     ' History            '}, command = 'Hist'},
  e = {description = {icons.timer ..        ' Load Last Session  '}, command = 'SessionLoad'},
  f = {description = {icons.container ..    ' Sync Plugins       '}, command = 'PackerSync'},
  g = {description = {icons.container ..    ' Install Plugins    '}, command = 'PackerInstall'},
  h = {description = {icons.vim ..          ' Settings           '}, command = 'edit $MYVIMRC'},
  i = {description = {icons.container ..    ' Exit               '}, command = 'exit'},
}

