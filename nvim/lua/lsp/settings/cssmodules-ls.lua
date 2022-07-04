local util = require('lspconfig').util

return {
  on_attach = function(client)
    client.server_capabilities.hoverProvider = false
    client.server_capabilities.definitionProvider = false
  end,
  root_dir = util.root_pattern('tsconfig.json', 'jsconfig.json', '.git') or dirname,
}
