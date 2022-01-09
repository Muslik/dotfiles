local tbl_keys = vim.tbl_keys
local loop = vim.loop

local eslint = {
  lintCommand = 'eslint_d -f visualstudio --stdin --stdin-filename ${INPUT}',
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = {
    "%f(%l,%c): %tarning %m",
    "%f(%l,%c): %rror %m"
  },
}

local prettier = {
  formatCommand = './node_modules/.bin/prettier --stdin-filepath ${INPUT} || prettier --stdin-filepath ${INPUT}',
  formatStdin = true,
}

local rust_fmt = {
  formatCommand = 'rustfmt',
  formatStdin = true
}

local format_config = {
  css = { prettier },
  html = { prettier },
  javascript = { eslint, prettier },
  javascriptreact = { eslint, prettier },
  json = { prettier },
  markdown = { prettier },
  scss = { prettier },
  typescript = { eslint, prettier },
  typescriptreact = { eslint, prettier },
  yaml = { prettier },
  rust = { rust_fmt }
}

return {
  cmd = {'efm-langserver'},
  -- cmd = {'efm-langserver', '-logfile', '/tmp/efm.log', '-loglevel', '5'},
  init_options = { documentFormatting = true, codeAction = true },
  root_dir = loop.cwd,
  filetypes = tbl_keys(format_config),
  settings = { languages = format_config },
}
