local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
parser_config.org = {
  install_info = {
    url = 'https://github.com/milisims/tree-sitter-org',
    revision = 'f110024d539e676f25b72b7c80b0fd43c34264ef',
    files = {'src/parser.c', 'src/scanner.cc'},
  },
  filetype = 'org',
}

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
    additional_vim_regex_highlighting = {'org'}
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	}
}
