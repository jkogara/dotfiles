return {
	{
		"kevinhwang91/nvim-ufo",
		dependencies = "kevinhwang91/promise-async",
		config = function()
			local ftMap = {
				vim = "indent",
				python = { "indent" },
				git = "",
			}

			require("ufo").setup({
				open_fold_hl_timeout = 150,
				close_fold_kinds_for_ft = { "imports", "comment" },
				preview = {
					win_config = {
						border = { "", "─", "", "", "", "─", "", "" },
						winhighlight = "Normal:Folded",
						winblend = 0,
					},
				},
				provider_selector = function(_, filetype, _)
					return ftMap[filetype] or { "treesitter", "indent" }
				end,
			})

			vim.keymap.set("n", "zM", require("ufo").openAllFolds)
			-- vim.keymap.set("n", "zm", require("ufo").closeAllFolds)
			vim.keymap.set("n", "F", function()
				local winid = require("ufo").peekFoldedLinesUnderCursor()
				if not winid then
					vim.lsp.buf.hover()
				end
			end)
			-- options for nvim-ufo folding plugin
			vim.opt.foldcolumn = "1" -- '0' is not bad
			vim.opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
			vim.opt.foldlevelstart = 99
			vim.opt.foldenable = true
		end,
	},
}
