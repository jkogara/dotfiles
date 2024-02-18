return {
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		cmd = { "ConformInfo" },
		keys = {
			{
				-- Customize or remove this keymap to your liking
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		config = function()
			require("conform").setup({
				log_level = vim.log.levels.DEBUG,
				formatters_by_ft = {
					_ = { "remove_trailing_lines" },
					javascript = { "prettier", "eslint", "trim_whitespace" },
					typescriptreact = { "prettier", "eslint", "trim_whitespace" },
					typescript = { "prettier", "eslint", "trim_whitespace" },
					css = { "prettier", "trim_whitespace" },
					python = { "yapf", "autopep8", "trim_whitespace" },
					terraform = { "terraform" },
					rust = { "rustfmt", "trim_whitespace" },
					elixir = { "mix_format", "trim_whitespace" },
					scss = { "prettier", "trim_whitespace" },
					ruby = { "rubocop", "trim_whitespace" },
					lua = { "stylua", "trim_whitespace" },
				},
				format_on_save = {
					timeout_ms = 2000,
					lsp_fallback = true,
				},
				formatters = {
					shfmt = {
						prepend_args = { "-i", "2" },
					},
				},
			})
		end,
		init = function()
			-- If you want the formatexpr, here is the place to set it
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
			require("conform").formatters.ruby = {
				command = "/home/jkogara/.rbenv/shims/rubocop",
			}
		end,
	},
}
