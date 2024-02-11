local null_ls = require("null-ls")
null_ls.setup({
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			-- create an augroup for the current buffer
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			-- format on save
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						async = false,
						bufnr = bufnr,
						-- ensure that null-ls is the only formatter used for formatting
						filter = function(client)
							return client.name == "null-ls"
						end,
					})
				end,
			})
		end
	end,
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.completion.spell,
		null_ls.builtins.completion.tags,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.rustfmt,
		null_ls.builtins.formatting.rubocop,
		null_ls.builtins.formatting.yapf,
		null_ls.builtins.diagnostics.flake8,
		null_ls.builtins.diagnostics.mypy,
	},
})
