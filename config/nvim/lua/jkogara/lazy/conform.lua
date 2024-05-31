return {
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		cmd = { "ConformInfo" },
		keys = {
			{
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
					javascript = { "prettierd", "prettier", "trim_whitespace" },
					typescriptreact = { "prettierd", "prettier", "trim_whitespace" },
					typescript = { "prettierd", "prettier", "trim_whitespace" },
					css = { "prettier", "trim_whitespace" },
					python = { "black", "trim_whitespace" },
					terraform = { "terraform" },
					rust = { "rustfmt", "trim_whitespace" },
					elixir = { "mix_format", "trim_whitespace" },
					scss = { "prettier", "trim_whitespace" },
					-- ruby = { "rubocop", "trim_whitespace" },
					eruby = { "erb-formatter", "trim_whitespace" },
					lua = { "stylua", "trim_whitespace" },
				},
				format_on_save = {
					timeout_ms = 5000,
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
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
			require("conform").formatters.ruby = {
				command = "/home/jkogara/.rbenv/shims/rubocop",
			}
		end,
	},
}
