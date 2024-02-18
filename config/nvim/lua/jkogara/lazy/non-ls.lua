return {
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			local sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.code_actions.eslint_d,
				null_ls.builtins.completion.luasnip,
				null_ls.builtins.formatting.rubocop,
				null_ls.builtins.formatting.rustfmt,
				null_ls.builtins.formatting.standardts,
				null_ls.builtins.formatting.terrafmt,
			}
			null_ls.setup({ sources = sources, debug = true })
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
}
