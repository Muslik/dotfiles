local servers = {
  'clangd',
  'cssls',
  'bashls',
  'cssmodules_ls',
  'dockerls',
  'efm',
  'eslint',
  'elixirls',
  'html',
  'jsonls',
  'rust_analyzer',
  'lua_ls',
  'prismals',
  'volar',
  'ts_ls',
  'pyright',
  'python-lsp-server',
  'yamlls',
}

local lspconfig_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status_ok then
  return
end

local handlers = require('lsp.handlers')

for _, server in pairs(servers) do
  local base_opts = {
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
  }

  if server == 'cssls' then
    local server_opts = require('lsp/settings/cssls')
    base_opts = vim.tbl_deep_extend('force', server_opts, base_opts)
  end

  if server == 'efm' then
    local server_opts = require('lsp/settings/efm-ls')
    base_opts = vim.tbl_deep_extend('force', server_opts, base_opts)
  end

  if server == 'lua_ls' then
    local server_opts = require('lsp/settings/sumneko-lua')
    base_opts = vim.tbl_deep_extend('force', server_opts, base_opts)
  end

  --[[ if server == 'ts_ls' then ]]
  --[[   local server_opts = require('lsp/settings/ts_ls') ]]
  --[[   base_opts = vim.tbl_deep_extend('force', server_opts, base_opts) ]]
  --[[]]
  --[[   base_opts.init_options = { ]]
  --[[     plugins = { -- I think this was my breakthrough that made it work ]]
  --[[       { ]]
  --[[         name = '@vue/typescript-plugin', ]]
  --[[         location = '/usr/local/lib/node_modules/@vue/language-server', ]]
  --[[         languages = { 'vue' }, ]]
  --[[       }, ]]
  --[[     }, ]]
  --[[   } ]]
  --[[   base_opts.filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' } ]]
  --[[ end ]]

  if server == 'jsonls' then
    local server_opts = require('lsp/settings/jsonls')
    base_opts = vim.tbl_deep_extend('force', server_opts, base_opts)
  end

  --[[ if server == 'volar' then ]]
  --[[   local server_opts = require('lsp/settings/volar') ]]
  --[[   base_opts = vim.tbl_deep_extend('force', server_opts, base_opts) ]]
  --[[ end ]]

  if server == 'eslint' then
    local server_opts = require('lsp/settings/eslint')
    base_opts = vim.tbl_deep_extend('force', server_opts, base_opts)
  end

  if server == 'cssmodules_ls' then
    local server_opts = require('lsp/settings/cssmodules-ls')
    base_opts = vim.tbl_deep_extend('force', server_opts, base_opts)
  end

  if server == 'clangd' then
    local server_opts = require('lsp/settings/clangd')
    base_opts = vim.tbl_deep_extend('force', server_opts, base_opts)
  end

  if server == 'rust_analyzer' then
    local rust_opts = require('lsp/settings/rust')
    local rust_tools_status_ok, rust_tools = pcall(require, 'rust-tools')

    if not rust_tools_status_ok then
      return
    end

    rust_opts = vim.tbl_deep_extend('force', rust_opts, base_opts)
    rust_tools.setup(rust_opts)
    goto continue
  end

  if server == 'html' then
    base_opts.filetypes = { 'html', 'vue' }
  end
  
  lspconfig[server].setup(base_opts)
  ::continue::
end

local status_ok, typescript = pcall(require, 'typescript-tools')
if not status_ok then
  return
end

typescript.setup({
  on_attach = handlers.on_attach,
  capabilities = handlers.capabilities,
  settings = {
    tsserver_plugins = {
      '@vue/typescript-plugin',
    }
  },
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
})
