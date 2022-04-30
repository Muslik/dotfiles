require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  tree_docs = {
    enable = true,
    spec_config = {
      jsdoc = {
        slots = {
          class = {author = true}
        }
      }
    }
  },
  indent = {
    enable = true,
    disable = { "html" }
  },
  highlight = {
    enable = true,
    disable = { "html" }, -- Buggy highlight
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}
