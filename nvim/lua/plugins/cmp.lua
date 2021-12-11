local luasnip = require 'luasnip'
local lspkind = require('lspkind')
local cmp = require 'cmp'
local utils = require 'utils'
local t = utils.t
local fn = vim.fn
local api = vim.api

local source_mapping = {
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	nvim_lua = "[Lua]",
	cmp_tabnine = "[TN]",
	path = "[Path]",
}

-- nvim-cmp setup
cmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		},
		['<Tab>'] = function(fallback)
			if luasnip.expand_or_jumpable() then
				fn.feedkeys(t '<Plug>luasnip-expand-or-jump', '')
			elseif fn.pumvisible() == 1 then
				fn.feedkeys(t '<C-n>', 'n')
			else
				fallback()
			end
		end,
		['<S-Tab>'] = function(fallback)
			if luasnip.jumpable(-1) then
				fn.feedkeys(t '<Plug>luasnip-jump-prev', '')
			elseif fn.pumvisible() == 1 then
				fn.feedkeys(t '<C-p>', 'n')
			else
				fallback()
			end
		end,
	},
	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = lspkind.presets.default[vim_item.kind]
			local menu = source_mapping[entry.source.name]
			if entry.source.name == 'cmp_tabnine' then
				if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
					menu = entry.completion_item.data.detail .. ' ' .. menu
				end
				vim_item.kind = ''
			end
			vim_item.menu = menu
			return vim_item
		end
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = "path" },
		{ name = 'cmp_tabnine' },
	},
}

require("cmp").setup({
	map_cr = true, --  map <CR> on insert mode
	map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
	auto_select = true, -- automatically select the first item
	map_char = { -- modifies the function or method delimiter by filetypes
	all = '(',
	tex = '{'
}
})
