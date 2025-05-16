local status_ok, which_key = pcall(require, 'which-key')
if not status_ok then
  return
end

local mappings = {
  { '<leader>L', group = 'Typescript' },
  { '<leader>Li', '<cmd>TSToolsAddMissingImports<Cr>', desc = 'Add missing imports' },
  { '<leader>Lo', '<cmd>TSToolsOrganizeImports<cr>', desc = 'Organize imports' },
  { '<leader>Ls', '<cmd>TSToolsSortImports<cr>', desc = 'Sort imports' },
  { '<leader>Ld', '<cmd>TSToolsRemoveUnusedImports<Cr>', desc = 'Remove unused imports' },
  { '<leader>LD', '<cmd>TSToolsRemoveUnused<cr>', desc = 'Remove unused' },
  { '<leader>Lf', '<cmd>TSToolsFixAll<Cr>', desc = 'Fix all' },
  { '<leader>Lr', '<cmd>TSToolsRenameFile<Cr>', desc = 'Rename file' },
  { '<leader>LR', '<cmd>TSToolsFileReferences<Cr>', desc = 'File references' },
}

which_key.add(mappings)

local map = Utils.map
map('n', 'gD', '<cmd>TypescriptGoToSourceDefinition<CR>')
