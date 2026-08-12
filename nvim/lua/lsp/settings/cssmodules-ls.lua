return {
  on_attach = function(client)
    client.server_capabilities.hoverProvider = false
    client.server_capabilities.definitionProvider = false
  end,
  root_dir = function(_, on_dir)
    on_dir(vim.fn.getcwd())
  end,
}
