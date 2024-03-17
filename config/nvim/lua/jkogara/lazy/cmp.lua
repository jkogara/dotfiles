return {
	{
		"Forsigg/nvim-cmp", -- hrsh7th/nvim-cmp",
		commit = "d884a049bb66722668ebe5de97f341327e8422cf",
		dependencies = {
			{
				"quangnguyen30192/cmp-nvim-tags",
				ft = {
					"ruby",
					"eruby",
				},
			},
			"hrsh7th/cmp-buffer",
			"L3MON4D3/LuaSnip",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"sar/friendly-snippets.nvim",
			"lukas-reineke/cmp-under-comparator", -- Tweak completion order
			"f3fora/cmp-spell",
		},
		config = function()
			local kind_icons = {
				Text = "",
				Method = "",
				Function = "",
				Constructor = "",
				Field = "",
				Variable = "",
				Class = "ﴯ",
				Interface = "",
				Module = "",
				Property = "ﰠ",
				Unit = "",
				Value = "",
				Enum = "",
				Keyword = "",
				Snippet = "",
				Color = "",
				File = "",
				Reference = "",
				Folder = "",
				EnumMember = "",
				Constant = "",
				Struct = "",
				Event = "",
				Operator = "",
				TypeParameter = "",
			}
			local cmp = require("cmp")
			local cmp_lsp = require("cmp_nvim_lsp")
			require("luasnip/loaders/from_vscode").lazy_load()
			require("luasnip").filetype_extend("ruby", { "rails" })

			cmp_lsp.default_capabilities()
			local cmp_select = { behavior = cmp.SelectBehavior.Select }

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
					["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete(),
				}),
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = function(entry, vim_item)
						vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)

						vim_item.menu = ({
							buffer = "[Buffer]",
							luasnip = "[Snippet]",
							nvim_lsp = "[LSP]",
							spell = "[Spelling]",
						})[entry.source.name]

						return vim_item
					end,
				},
				sources = cmp.config.sources({
					{ name = "buffer" },
					{ name = "cmp_tabnine" },
					{ name = "luasnip" },
					{ name = "nvim_lsp" },
					{ name = "nvim_lua" },
					{ name = "path" },
					{
						name = "tags",
						option = {
							-- this is the default options, change them if you want.
							-- Delayed time after user input, in milliseconds.
							complete_defer = 100,
							-- Max items when searching `taglist`.
							max_items = 10,
							-- Use exact word match when searching `taglist`, for better searching
							-- performance.
							exact_match = false,
							-- Prioritize searching result for current buffer.
							current_buffer_only = false,
						},
					},
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
}
