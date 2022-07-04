local status_ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not status_ok then
  return
end

local servers = {
  'bashls',
  'cssls',
  'cssmodules_ls',
  'dockerls',
  'efm',
  'emmet_ls',
  'eslint',
  'html',
  'jsonls',
  'rust_analyzer',
  'sumneko_lua',
  'tsserver',
  'yamlls',
}

local server_options = {
  efm = require('lsp/settings/efm-ls'),
  sumneko_lua = require('lsp/settings/sumneko-lua'),
  tsserver = require('lsp/settings/tsserver'),
  jsonls = require('lsp/settings/jsonls'),
  emmet_ls = require('lsp/settings/ls-emmet'),
  eslint = require('lsp/settings/eslint'),
  cssmodules_ls = require('lsp/settings/cssmodules-ls'),
}

local settings = {
  ensure_installed = servers,
}

lsp_installer.setup(settings)

local lspconfig_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status_ok then
  return
end

for _, server in pairs(servers) do
  local opts = {
    on_attach = require('lsp.handlers').on_attach,
    capabilities = require('lsp.handlers').capabilities,
  }

  local user_options = server_options[server] or {}
  opts = vim.tbl_deep_extend('force', opts, user_options)
  lspconfig[server].setup(opts)
end
