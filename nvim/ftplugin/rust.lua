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
    name = "Rust",
    h = { "<cmd>lua vim.lsp.inlay_hint.enable(true, { bufnr = 0 })<Cr>", "Enable Hints" },
    H = { "<cmd>lua vim.lsp.inlay_hint.enable(false, { bufnr = 0 })<Cr>", "Disable Hints" },
    l = { "<cmd>lua vim.lsp.codelens.run()<Cr>", "Run CodeLens" },
    t = { "<cmd>lua _CARGO_TEST()<cr>", "Cargo Test" },
    R = { "<cmd>RustReloadWorkspace<Cr>", "Reload Workspace" },
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
