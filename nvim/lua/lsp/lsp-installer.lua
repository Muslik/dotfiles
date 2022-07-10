local status_ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not status_ok then
  return
end

local servers = {
  'bashls',
  'cssmodules_ls',
  'dockerls',
  'efm',
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
  rust_analyzer = require('lsp/settings/rust'),
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
  user_options.root_dir = vim.loop.cwd
  opts = vim.tbl_deep_extend('force', opts, user_options)

  if server == 'rust_analyzer' then
    local rust_tools_status_ok, rust_tools = pcall(require, 'rust-tools')
    if not rust_tools_status_ok then
      return
    end

    rust_tools.setup(server_options[server])
    goto continue
  end

  lspconfig[server].setup(opts)
  ::continue::
end
