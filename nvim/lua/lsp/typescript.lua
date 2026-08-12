local M = {}

local function code_action(kind)
  return function()
    vim.lsp.buf.code_action({
      apply = true,
      context = {
        only = { kind },
        diagnostics = {},
      },
    })
  end
end

function M.setup_keymaps()
  local opts = { buffer = true, silent = true }

  local ok, which_key = pcall(require, 'which-key')
  if ok then
    which_key.add({
      { '<leader>L', group = 'TypeScript', buffer = true },
    })
  end

  vim.keymap.set('n', '<leader>Li', code_action('source.addMissingImports.ts'), vim.tbl_extend('force', opts, {
    desc = 'Add missing imports',
  }))
  vim.keymap.set('n', '<leader>Lo', code_action('source.organizeImports'), vim.tbl_extend('force', opts, {
    desc = 'Organize imports',
  }))
  vim.keymap.set('n', '<leader>Ls', code_action('source.sortImports.ts'), vim.tbl_extend('force', opts, {
    desc = 'Sort imports',
  }))
  vim.keymap.set('n', '<leader>Ld', code_action('source.removeUnusedImports.ts'), vim.tbl_extend('force', opts, {
    desc = 'Remove unused imports',
  }))
  vim.keymap.set('n', '<leader>LD', code_action('source.removeUnused.ts'), vim.tbl_extend('force', opts, {
    desc = 'Remove unused',
  }))
  vim.keymap.set('n', '<leader>Lf', code_action('source.fixAll.ts'), vim.tbl_extend('force', opts, {
    desc = 'Fix all',
  }))
  vim.keymap.set('n', '<leader>Lr', vim.lsp.buf.rename, vim.tbl_extend('force', opts, {
    desc = 'Rename symbol',
  }))
  vim.keymap.set('n', '<leader>LR', '<cmd>Telescope lsp_references<cr>', vim.tbl_extend('force', opts, {
    desc = 'References',
  }))
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, vim.tbl_extend('force', opts, {
    desc = 'Go to declaration',
  }))
end

return M
