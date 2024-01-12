return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(), -- Map Ctrl + K to select the previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- Map Ctrl + J to select the next suggestion
				["<C-b>"] = cmp.mapping.scroll_docs(-4), -- Map Ctrl + B to scroll documentation up
				["<C-f>"] = cmp.mapping.scroll_docs(4), -- Map Ctrl + F to scroll documentation down
				["<C-Space>"] = cmp.mapping.complete(), -- Map Ctrl + Space to show completion suggestions
				["<C-e>"] = cmp.mapping.abort(),        -- Map Ctrl + E to close the completion window
				["<CR>"] = cmp.mapping.confirm({ select = false }), -- Map Enter to confirm without selecting
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			},
		})
	end,
}
