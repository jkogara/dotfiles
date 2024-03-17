return {
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			local lualine = require("lualine")
			local lualine_config = {
				options = {
					theme = "solarized_light",
				},
				sections = {
					lualine_c = {
						{ "filename", path = 1 },
						{ "diagnostics", sources = { "nvim_diagnostic" } },
					},
					lualine_x = { "overseer", "encoding", "fileformat", "filetype" },
				},
				inactive_sections = {
					lualine_c = {
						{ "filename", path = 1 },
					},
				},
			}
			lualine.setup(lualine_config)
			lualine.refresh()
		end,
	},
}
