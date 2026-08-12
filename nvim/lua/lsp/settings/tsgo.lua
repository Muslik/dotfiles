local ts_project = require('lsp.settings.typescript-project')

local function executable_tsc(root_dir)
  if root_dir then
    local local_cmd = ts_project.local_tsc(root_dir)
    if local_cmd and ts_project.supports_lsp(local_cmd) then
      return { local_cmd, '--lsp', '--stdio' }
    end
  end

  if vim.fn.executable('tsc') == 1 and ts_project.supports_lsp('tsc') then
    return { 'tsc', '--lsp', '--stdio' }
  end

  if vim.fn.executable('npm') == 1 then
    return { 'npm', 'exec', '--package', 'typescript@latest', '--', 'tsc', '--lsp', '--stdio' }
  end

  return { 'tsc', '--lsp', '--stdio' }
end

return {
  root_dir = function(bufnr, on_dir)
    local root = ts_project.project_root(bufnr)
    if not root then
      return
    end

    if ts_project.has_legacy_local_tsc(root) then
      return
    end

    on_dir(root)
  end,
  cmd = function(dispatchers, config)
    return vim.lsp.rpc.start(executable_tsc((config or {}).root_dir), dispatchers)
  end,
}
