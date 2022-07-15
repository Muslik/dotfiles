local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  L = {
    name = "Typescript",
    i = { "<cmd>TypescriptAddMissingImports<Cr>", "Add missing imports" },
    o = { "<cmd>TypescriptOrganizeImports<cr>", "Organize imports" },
    d = { "<cmd>TypescriptRemoveUnused<Cr>", "Remove unused" },
    f = { "<cmd>TypescriptFixAll<Cr>", "Fix all" },
    r = { "<cmd>TypescriptRenameFile<Cr>", "Rename file" },
  },
}

which_key.register(mappings, opts)

local notify_filter = vim.notify
vim.notify = function(msg, ...)
  if msg:match "message with no corresponding" then
    return
  end

  notify_filter(msg, ...)
end
