local util = require('lspconfig').util

return {
  root_dir = util.root_pattern("tsconfig.json", "jsconfig.json", ".git") or dirname
}
