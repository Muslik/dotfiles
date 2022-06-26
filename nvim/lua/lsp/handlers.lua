local M = {}

local function setup_diagnostic()
  local signs = {
    Error = {
      text = "",
      numhl = 'DiagnosticSignError',
    },
    Warn = {
      text = "",
      numhl = "DiagnosticSignWarn",
    },
    Hint = {
      text = "",
      numhl = "DiagnosticSignHint",
    },
    Info = {
      text = "",
      numhl = "DiagnosticSignInfo",
    }
  }
  for type, config in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, config)
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
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)
end

local function setup_handlers()
  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signature_help, {
      border = 'rounded',
      width = 80,
      close_events = {"CursorMoved", "BufHidden", "InsertCharPre"},
    })
  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover, {
      border = 'rounded',
      width = 80,
    }
  )
  vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = true,
    severity_sort = true,
  })
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.on_attach = function(client)
  if client.name ~= 'efm' then
    client.server_capabilities.documentFormattingProvider = false
  end
end

M.setup = function()
  setup_diagnostic()
  setup_handlers()
end

return M
