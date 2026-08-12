local function reload_workspace(bufnr)
  local clients = vim.lsp.get_clients({ bufnr = bufnr, name = 'rust_analyzer' })
  for _, client in ipairs(clients) do
    vim.notify('Reloading Cargo workspace')
    client:request('rust-analyzer/reloadWorkspace', nil, function(err)
      if err then
        vim.notify(tostring(err), vim.log.levels.ERROR)
        return
      end

      vim.notify('Cargo workspace reloaded')
    end, bufnr)
  end
end

return {
  on_attach = function(_, bufnr)
    vim.api.nvim_buf_create_user_command(bufnr, 'RustReloadWorkspace', function()
      reload_workspace(bufnr)
    end, { desc = 'Reload current Cargo workspace' })

    local group = vim.api.nvim_create_augroup('RustCodeLensRefresh:' .. bufnr, { clear = true })
    vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufEnter', 'CursorHold', 'InsertLeave' }, {
      group = group,
      buffer = bufnr,
      callback = function()
        vim.lsp.codelens.refresh()
      end,
    })
  end,
  settings = {
    ['rust-analyzer'] = {
      lens = {
        enable = true,
      },
      checkOnSave = {
        command = 'clippy',
      },
    },
  },
}
