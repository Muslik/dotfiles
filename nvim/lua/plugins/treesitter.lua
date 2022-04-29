require'nvim-treesitter.configs'.setup {
  ensure_installed = {"bash", "c", "cmake", "comment", "cpp", "css", "dockerfile", "elixir", "fish", "go", "graphql", "html", "http", "java", "javascript", "jsdoc", "json", "json5", "lua", "php", "prisma", "pug", "python", "ruby", "rust", "scss", "svelte", "typescript", "vim", "vue", "yaml"},
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
