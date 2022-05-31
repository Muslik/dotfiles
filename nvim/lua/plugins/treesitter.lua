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
    disable = function(lang)
      if lang == "html" then -- Buggy highlight
        return true
      end
    end
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}
