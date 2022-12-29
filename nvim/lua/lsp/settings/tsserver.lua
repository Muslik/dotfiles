local util = require('lspconfig').util

return {
  -- use system version of typescript instead of project specific 
  disable_commands = false, -- prevent the plugin from creating Vim commands
  debug = false, -- enable debug logging for commands
  go_to_source_definition = {
    fallback = true, -- fall back to standard LSP definition on failure
  },
  server = { -- pass options to lspconfig's setup method
    -- specify the path to the typescript
    cmd = { 'typescript-language-server', '--stdio', '--tsserver-path', '/usr/local/bin/tsserver' },
    root_dir = function(fname)
      local primary = util.root_pattern('tsconfig.json', 'jsconfig.json', '.git')(fname)
      return primary or vim.loop.cwd(fname)
    end,
  },
}
