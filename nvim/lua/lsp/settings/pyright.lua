return {
  root_dir = function(bufnr, on_dir)
    on_dir(vim.fs.root(bufnr, { '.git', 'pyproject.toml', 'uv.lock' }) or vim.fn.getcwd())
  end
}
