return {
	{ "folke/neodev.nvim", opts = {} },

	{
		"nvim-lua/lsp-status.nvim",
		event = "BufReadPre",
	}, -- Used by other plugins for basic lsp info

	{
		"j-hui/fidget.nvim",
		event = "BufReadPre",
		config = function()
			require("fidget").setup({})
		end,
	},

	{
		"williamboman/mason.nvim",
		event = "BufReadPre",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("jkogara.lsp").setup()
		end,
		build = ":MasonUpdate",
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			local mason_tool_installer = require("mason-tool-installer")
			mason_tool_installer.setup({
				ensure_installed = {
					"prettier", -- prettier formatter
					"stylua", -- lua formatter
					"isort", -- python formatter
					"black", -- python formatter
					"pylint", -- python linter
					"eslint_d", -- js linter
					"rubyfmt", -- ruby formatter
					"eslint_d",
					"flake8",
					"shfmt",
					"ts-standard",
					"fixjson",
					"rustfmt",
					"typos_lsp",
				},
			})
		end,
	},
	{
		"mihyaeru21/nvim-lspconfig-bundler",
		event = "BufReadPre",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("lspconfig-bundler").setup()
		end,
	},
}
