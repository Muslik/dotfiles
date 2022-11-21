local util = require('lspconfig').util

return {
  root_dir = function(fname)
    local primary = util.root_pattern('tsconfig.json', 'jsconfig.json', '.git')(fname)
    return primary or vim.loop.cwd(fname)
  end,
  handlers = {
    ['eslint/noLibrary'] = function()
      return {}
    end,
  }
}
