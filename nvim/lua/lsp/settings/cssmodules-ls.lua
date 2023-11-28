return {
  on_attach = function(client)
    client.server_capabilities.hoverProvider = false
    client.server_capabilities.definitionProvider = false
  end,
  root_dir = vim.loop.cwd,
}
