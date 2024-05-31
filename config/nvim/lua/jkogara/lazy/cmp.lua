return {
	{
		"Forsigg/nvim-cmp", -- hrsh7th/nvim-cmp",
		commit = "d884a049bb66722668ebe5de97f341327e8422cf",
		dependencies = {
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
				Text = "󰦨",
				Method = "󰡱",
				Function = "󰡱",
				Constructor = "",
				Field = "",
				Variable = "",
				Class = "",
				Interface = "",
				Module = "",
				Property = "",
				Unit = "",
				Value = "",
				Enum = "",
				Keyword = "",
				Snippet = "",
				Color = "",
				File = "󰈔",
				Reference = "",
				Folder = " ",
				EnumMember = "",
				Constant = "",
				Struct = "",
				Event = "",
				Operator = "",
				TypeParameter = "",
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
							nvim_lsp = "[LSP]",
							buffer = "[Buffer]",
							-- luasnip = "[Snippet]",
							spell = "[Spelling]",
						})[entry.source.name]

						return vim_item
					end,
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{
						name = "buffer",
						option = {
							get_bufnrs = function()
								return vim.api.nvim_list_bufs()
							end,
						},
					},
					-- { name = "luasnip" },
					{ name = "cmp_tabnine" },
					{ name = "nvim_lua" },
					{ name = "path" },
				}),
			})
		end,
	},
}
