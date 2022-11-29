local util = require('lspconfig').util

return {
  root_dir = util.root_pattern('tsconfig.json', 'jsconfig.json', '.git') or dirname,
  on_attach = function(client)
    client.server_capabilities.hoverProvider = false
    client.server_capabilities.definitionProvider = false
  end,
}
