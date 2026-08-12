local ts_project = require('lsp.settings.typescript-project')

return {
  root_dir = function(bufnr, on_dir)
    local root = ts_project.project_root(bufnr)
    if not root then
      return
    end

    if ts_project.has_legacy_local_tsc(root) then
      on_dir(root)
    end
  end,
}
