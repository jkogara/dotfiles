return {
	{
		"overcache/NeoSolarized",
		priority = 1000,
		config = function()
			vim.cmd("set background=light")
			vim.cmd("set termguicolors")
			vim.cmd("colorscheme NeoSolarized")
		end,
	},
	{ "rebelot/kanagawa.nvim", priority = 1000 },
	{ "sainnhe/everforest", priority = 1000 },
}
