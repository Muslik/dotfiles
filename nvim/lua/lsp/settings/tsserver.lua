local util = require('lspconfig').util

return {
  disable_commands = false, -- prevent the plugin from creating Vim commands
  debug = false, -- enable debug logging for commands
  server = { -- pass options to lspconfig's setup method
    root_dir = function(fname)
      local primary = util.root_pattern('tsconfig.json', 'jsconfig.json', '.git')(fname)
      return primary or vim.loop.cwd(fname)
    end,
  },
}
