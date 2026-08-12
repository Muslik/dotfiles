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
  'tailwindcss',
  'ts_ls',
  'tsgo',
  'astro',
  'volar',
  'pyright',
  'pylsp',
  'yamlls',
}

local handlers = require('lsp.handlers')

local server_settings = {
  clangd = 'lsp.settings.clangd',
  cssls = 'lsp.settings.cssls',
  cssmodules_ls = 'lsp.settings.cssmodules-ls',
  efm = 'lsp.settings.efm-ls',
  eslint = 'lsp.settings.eslint',
  jsonls = 'lsp.settings.jsonls',
  lua_ls = 'lsp.settings.sumneko-lua',
  pyright = 'lsp.settings.pyright',
  rust_analyzer = 'lsp.settings.rust',
  tailwindcss = 'lsp.settings.tailwindcss',
  ts_ls = 'lsp.settings.ts_ls',
  tsgo = 'lsp.settings.tsgo',
}

local function get_server_opts(server)
  local settings_module = server_settings[server]
  if not settings_module then
    return {}
  end

  return require(settings_module)
end

for _, server in pairs(servers) do
  local base_opts = {
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
  }

  local server_opts = get_server_opts(server)
  base_opts = vim.tbl_deep_extend('force', server_opts, base_opts)

  if server_opts.on_attach then
    local base_on_attach = handlers.on_attach
    local server_on_attach = server_opts.on_attach

    base_opts.on_attach = function(client, bufnr)
      base_on_attach(client, bufnr)
      server_on_attach(client, bufnr)
    end
  end

  if server == 'html' then
    base_opts.filetypes = { 'html', 'vue' }
  end
  
  vim.lsp.config(server, base_opts)
  vim.lsp.enable(server)
end
