local M = {}

function M.project_root(bufnr)
  local root_markers = { 'package-lock.json', 'yarn.lock', 'pnpm-lock.yaml', 'bun.lockb', 'bun.lock' }
  if vim.fn.has('nvim-0.11.3') == 1 then
    root_markers = { root_markers, { '.git' } }
  else
    root_markers = vim.list_extend(root_markers, { '.git' })
  end

  local deno_root = vim.fs.root(bufnr, { 'deno.json', 'deno.jsonc' })
  local deno_lock_root = vim.fs.root(bufnr, { 'deno.lock' })
  local root = vim.fs.root(bufnr, root_markers)
  if deno_lock_root and (not root or #deno_lock_root > #root) then
    return nil
  end
  if deno_root and (not root or #deno_root >= #root) then
    return nil
  end

  return root or vim.fn.getcwd()
end

function M.local_tsc(root_dir)
  local cmd = vim.fs.joinpath(root_dir, 'node_modules/.bin/tsc')
  if vim.fn.executable(cmd) == 1 then
    return cmd
  end
end

function M.major_version(cmd)
  local result = vim.system({ cmd, '--version' }, { text = true }):wait()
  if result.code ~= 0 or not result.stdout then
    return nil
  end

  local major = result.stdout:match('Version%s+(%d+)')
  return major and tonumber(major) or nil
end

function M.supports_lsp(cmd)
  local major = M.major_version(cmd)
  return major ~= nil and major >= 7
end

function M.has_legacy_local_tsc(root_dir)
  local cmd = M.local_tsc(root_dir)
  return cmd ~= nil and not M.supports_lsp(cmd)
end

return M
