local M = {}

M.setup = function()
	require("jkogara.lsp.config").setup()
	require("jkogara.lsp.handlers").setup()
end

return M
