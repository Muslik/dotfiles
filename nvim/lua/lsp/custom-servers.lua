local servers = require "nvim-lsp-installer.servers"
local server = require "nvim-lsp-installer.server"
local path = require "nvim-lsp-installer.path"

local my_installer = function (command)
  return function(_, callback, _)
    local is_success = vim.cmd(command);
    if is_success then
      callback(true)
    else
      callback(false)
    end
  end
end

local servers_to_install = {"ls_emmet"}

local server_init = {
  ls_emmet = {
    name = 'ls_emmet',
    root_dir = server.get_server_root_path('ls_emmet'),
    installer = my_installer("!npm install -g ls_emmet"),
    default_options = {
        cmd = { path.concat { server.get_server_root_path('ls_emmet'), 'ls_emmet' }, "--langserver" },
    },
  }
}

for _, s in ipairs(servers_to_install) do
  local registered_server = server.Server:new(server_init[s])
  servers.register(registered_server)
end
