local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
parser_config.markdown.used_by = "vimwiki"

require'nvim-treesitter.configs'.setup {
	ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
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
	}
}
