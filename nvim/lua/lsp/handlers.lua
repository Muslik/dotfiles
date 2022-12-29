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

  vim.lsp.handlers['textDocument/definition'] = function(_, result)
    local util = require('vim.lsp.util')
    if result == nil or vim.tbl_isempty(result) then
      return nil
    end

    if vim.tbl_islist(result) then
      --[[ this is opens a buffer to that result ]]
      --[[ you could loop the result and choose what you want ]]

      util.jump_to_location(result[1], 'utf-8')

      if #result > 1 then
        local isReactDTs = false
        for _, value in pairs(result) do
          if string.match(value.targetUri, 'react/index.d.ts') then
            isReactDTs = true
            break
          end
        end
        if not isReactDTs then
          --[[ this sets the value for the quickfix list ]]
            vim.fn.setqflist(util.locations_to_items(result))
          --[[ this opens the quickfix window ]]
          vim.api.nvim_command('copen')
          vim.api.nvim_command('wincmd p')
        end
      end
    else
      util.jump_to_location(result, 'utf-8')
    end
  end

  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = 'rounded',
    width = 70,
  })
  vim.lsp.handlers['textDocument/hover'] = function(_, result, ctx, config)
    local c = config or {}
    c.border = 'rounded'
    c.max_width = 80
    c.max_height = 80
    c.focus_id = ctx.method
    if not (result and result.contents) then
      return
    end
    local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
    markdown_lines = vim.lsp.util.trim_empty_lines(markdown_lines)
    if vim.tbl_isempty(markdown_lines) then
      return
    end
    return vim.lsp.util.open_floating_preview(markdown_lines, 'markdown', c)
  end
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
