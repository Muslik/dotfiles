local status_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not status_ok then
  return
end

local servers = {
  'clangd',
  'cssls',
  'bashls',
  'cssmodules_ls',
  'dockerls',
  'efm',
  'eslint',
  'html',
  'jsonls',
  'rust_analyzer',
  'lua_ls',
  'tsserver',
  'yamlls',
  'tailwindcss'
}

local settings = {
  ensure_installed = servers,
}

mason_lspconfig.setup(settings)

local lspconfig_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status_ok then
  return
end

for _, server in pairs(servers) do
  local handlers = require('lsp.handlers')
  local opts = {
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
  }

  if server == 'cssls' then
    local server_opts = require('lsp/settings/cssls')
    opts = vim.tbl_deep_extend('force', server_opts, opts)
  end

  if server == 'efm' then
    local server_opts = require('lsp/settings/efm-ls')
    opts = vim.tbl_deep_extend('force', server_opts, opts)
  end

  if server == 'lua_ls' then
    local server_opts = require('lsp/settings/sumneko-lua')
    opts = vim.tbl_deep_extend('force', server_opts, opts)
  end

  if server == 'tsserver' then
    local typescript_opts = require('lsp/settings/tsserver')

    local typescript_status_ok, typescript = pcall(require, 'typescript')
    if not typescript_status_ok then
      return
    end

    typescript_opts.server.on_attach = opts.on_attach
    typescript_opts.server.capabilities = opts.capabilities
    typescript.setup(typescript_opts)
    goto continue
  end

  if server == 'jsonls' then
    local server_opts = require('lsp/settings/jsonls')
    opts = vim.tbl_deep_extend('force', server_opts, opts)
  end

  if server == 'eslint' then
    local server_opts = require('lsp/settings/eslint')
    opts = vim.tbl_deep_extend('force', server_opts, opts)
  end

  if server == 'cssmodules_ls' then
    local server_opts = require('lsp/settings/cssmodules-ls')
    opts = vim.tbl_deep_extend('force', server_opts, opts)
  end

  if server == 'clangd' then
    local server_opts = require('lsp/settings/clangd')
    opts = vim.tbl_deep_extend('force', server_opts, opts)
  end

  if server == 'rust_analyzer' then
    local rust_opts = require('lsp/settings/rust')
    local rust_tools_status_ok, rust_tools = pcall(require, 'rust-tools')

    if not rust_tools_status_ok then
      return
    end

    rust_opts = vim.tbl_deep_extend('force', rust_opts, opts)
    rust_tools.setup(rust_opts)
    goto continue
  end

  lspconfig[server].setup(opts)
  ::continue::
end
