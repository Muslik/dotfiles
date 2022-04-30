local lsp_installer = require"nvim-lsp-installer"

local fn = vim.fn
local lsp = vim.lsp

local server_opts = {
	efm = require("lsp/efm-ls"),
  sumneko_lua = require("lsp/sumneko-lua"),
	tsserver = require('lsp/tsserver'),
  jsonls = require('lsp/jsonls'),
  ls_emmet = require('lsp/ls_emmet'),
}

local servers = { "bashls", "cssls", "dockerls", "efm", "html", "jsonls", "sumneko_lua", "tsserver", "yamlls", "rust_analyzer" };

local function setup_diagnostics()
  lsp.handlers['textDocument/signatureHelp'] = lsp.with(
    vim.lsp.handlers.signature_help, {
      border = 'rounded',
      width = 80,
      close_events = {"CursorMoved", "BufHidden", "InsertCharPre"},
    })
  lsp.handlers['textDocument/hover'] = lsp.with(
    vim.lsp.handlers.hover, {
      border = 'rounded',
      width = 80,
    }
  )
  lsp.handlers['textDocument/publishDiagnostics'] = lsp.with(lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = true,
    severity_sort = true,
  })
end

local function install_servers()
  for _, server in ipairs(servers) do
    local _, requested_server = lsp_installer.get_server(server)
    if not requested_server:is_installed() then
      requested_server:install()
    end
  end
end

local function on_attach(client)
  if client.name == 'rust_analyzer' then
    client.resolved_capabilities.document_formatting = false
  end
  if client.name ~= 'efm' then
    client.resolved_capabilities.document_formatting = false
  end
end


local function setup_servers()
  lsp_installer.on_server_ready(function(server)
    local opts = server_opts[server.name] or {}
    opts.on_attach = on_attach
    server:setup(opts)
  end)
end

local function config_diagnostic_signs()
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
		fn.sign_define(hl, config)
	end
end

setup_diagnostics()
install_servers()
setup_servers()
config_diagnostic_signs()
require('lsp/custom-servers');
