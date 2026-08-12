return {
  root_dir = function(bufnr, on_dir)
    on_dir(vim.fs.root(bufnr, { 'tsconfig.json', 'jsconfig.json', '.git' }) or vim.fn.getcwd())
  end,
  handlers = {
    ['eslint/noLibrary'] = function()
      return {}
    end,
  }
}
