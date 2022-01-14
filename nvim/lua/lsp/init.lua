local lsp_installer = require"nvim-lsp-installer"

local cmd = vim.cmd
local fn = vim.fn
local lsp = vim.lsp

local capabilities = lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = { 'documentation', 'detail', 'additionalTextEdits' },
}

local server_opts = {
	efm = require("lsp/efm-ls"),
  sumneko_lua = require("lsp/sumneko-lua"),
	tsserver = require('lsp/tsserver'),
  jsonls = require('lsp/jsonls'),
  ls_emmet = require('lsp/ls_emmet'),
}

local servers = { "bashls", "cssls", "dockerls", "efm", "html", "jsonls", "sumneko_lua", "tsserver", "yamlls" };

local function disable_virtual_text()
	lsp.handlers['textDocument/publishDiagnostics'] = lsp.with(lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = false,
		signs = true,
		underline = true,
		update_in_insert = true,
		severity_sort = true,
	})
	cmd [[autocmd CursorHoldI * silent! lua  vim.lsp.buf.signature_help()]]
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
  if client.name ~= 'efm' then
    client.resolved_capabilities.document_formatting = false
  end
end


local function setup_servers()
  lsp_installer.on_server_ready(function(server)
    local opts = server_opts[server.name] or {}
    opts.capabilities = capabilities;
    opts.on_attach = on_attach
    server:setup(opts)
  end)
end

local function config_diagnostic_signs()
	local signs = {
		Error = {
			text = " ",
			texthl = 'DiagnosticSignError',
		},
		Warn = {
			text = " ",
			texthl = "DiagnosticSignWarn",
		},
		Hint = {
			text = " ",
			texthl = "DiagnosticSignHint",
		},
		Info = {
			text = " ",
			texthl = "DiagnosticSignInfo",
		}
	}
	for type, config in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		fn.sign_define(hl, config)
	end
end

disable_virtual_text()
install_servers()
setup_servers()
config_diagnostic_signs()
require('lsp/custom-servers');
