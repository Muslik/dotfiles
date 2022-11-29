local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()

local status_cmp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not status_cmp_ok then
  return
end

local icons = require('icons')

M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

M.setup = function()
  local signs = {
    { name = 'DiagnosticSignError', text = icons.diagnostics.Error },
    { name = 'DiagnosticSignWarn', text = icons.diagnostics.Warning },
    { name = 'DiagnosticSignHint', text = icons.diagnostics.Hint },
    { name = 'DiagnosticSignInfo', text = icons.diagnostics.Information },
  }
  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
  end

  local config = {
    -- disable virtual text
    virtual_text = false,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = 'minimal',
      border = 'rounded',
      source = 'always',
      header = '',
      prefix = '',
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = 'rounded',
    width = 60,
  })
  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = 'rounded',
    width = 60,
  })
end

local function remove_augroup(name)
  if vim.fn.exists('#' .. name) == 1 then
    vim.cmd('au! ' .. name)
  end
end

M.enable_format_on_save = function()
  vim.cmd([[
    augroup format_on_save
      autocmd! 
      autocmd BufWritePre * lua vim.lsp.buf.format() 
    augroup end
  ]])
  vim.notify('Enabled format on save')
end

M.disable_format_on_save = function()
  remove_augroup('format_on_save')
  vim.notify('Disabled format on save')
end

M.toggle_format_on_save = function()
  if vim.fn.exists('#format_on_save#BufWritePre') == 0 then
    M.enable_format_on_save()
  else
    M.disable_format_on_save()
  end
end

M.on_attach = function(client)
  if client.name ~= 'efm' then
    client.server_capabilities.documentFormattingProvider = false
  end
end

return M
