local util = require('lspconfig').util

local ts_ls_inlay_hints = {
  includeInlayEnumMemberValueHints = true,
  includeInlayFunctionLikeReturnTypeHints = true,
  includeInlayFunctionParameterTypeHints = true,
  includeInlayParameterNameHints = 'all',
  includeInlayParameterNameHintsWhenArgumentMatchesName = true,
  includeInlayPropertyDeclarationTypeHints = true,
  includeInlayVariableTypeHints = true,
  includeInlayVariableTypeHintsWhenTypeMatchesName = true,
}

return {
  -- use system version of typescript instead of project specific
  disable_commands = false, -- prevent the plugin from creating Vim commands
  debug = false, -- enable debug logging for commands
  go_to_source_definition = {
    fallback = true, -- fall back to standard LSP definition on failure
  },
  server = { -- pass options to lspconfig's setup method
    root_dir = function(fname)
      local primary = util.root_pattern('tsconfig.json', 'jsconfig.json', '.git')(fname)
      return primary or vim.loop.cwd(fname)
    end,
    settings = {
      maxTsServerMemory = 12288,
      typescript = {
        inlayHints = ts_ls_inlay_hints,
      },
      javascript = {
        inlayHints = ts_ls_inlay_hints,
      },
    },
  },
}
