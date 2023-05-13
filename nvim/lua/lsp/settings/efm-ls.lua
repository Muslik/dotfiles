local tbl_keys = vim.tbl_keys
local loop = vim.loop

local prettier = {
  formatCommand = './node_modules/.bin/prettier --stdin-filepath ${INPUT} || prettier --config ~/dotfiles/prettierconfig_default.yaml --stdin-filepath ${INPUT}',
  formatStdin = true,
}

local rust_fmt = {
  formatCommand = 'rustfmt --emit=stdout --edition 2021',
  formatStdin = true,
}

local stylua = {
  formatCommand = 'stylua -',
  formatStdin = true,
  rootMarkers = { 'stylua.toml', '.stylua.toml' },
}

local format_config = {
  css = { prettier },
  html = { prettier },
  javascript = { prettier },
  javascriptreact = { prettier },
  json = { prettier },
  lua = { stylua },
  markdown = { prettier },
  scss = { prettier },
  typescript = { prettier },
  typescriptreact = { prettier },
  yaml = { prettier },
  rust = { rust_fmt },
}

return {
  cmd = { 'efm-langserver' },
  -- cmd = {'efm-langserver', '-logfile', '/tmp/efm.log', '-loglevel', '5'},
  init_options = { documentFormatting = true },
  root_dir = loop.cwd,
  filetypes = tbl_keys(format_config),
  settings = { languages = format_config },
}
