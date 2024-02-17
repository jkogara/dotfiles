local ftMap = {
	vim = "indent",
	python = { "indent" },
	git = "",
}

require("ufo").setup({
	open_fold_hl_timeout = 150,
	close_fold_kinds = { "imports", "comment" },
	preview = {
		win_config = {
			border = { "", "─", "", "", "", "─", "", "" },
			winhighlight = "Normal:Folded",
			winblend = 0,
		},
	},
	provider_selector = function(bufnr, filetype, buftype)
		return ftMap[filetype] or { "treesitter", "indent" }
	end,
})

vim.keymap.set("n", "zM", require("ufo").openAllFolds)
vim.keymap.set("n", "zm", require("ufo").closeAllFolds)
vim.keymap.set("n", "F", function()
	local winid = require("ufo").peekFoldedLinesUnderCursor()
	if not winid then
		vim.lsp.buf.hover()
	end
end)
