function live_grep_git_dir()
	local git_dir = vim.fn.system(string.format("git -C %s rev-parse --show-toplevel", vim.fn.expand("%:p:h")))
	git_dir = string.gsub(git_dir, "\n", "") -- remove newline character from git_dir
	local opts = {
		cwd = git_dir,
	}
	require("telescope.builtin").live_grep(opts)
end

return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
		},
		version = "0.1.8",
		config = function()
			local actions = require("telescope.actions")
			require("telescope").setup({
				defaults = {
					file_ignore_patterns = { "node_modules", ".git" },
					mappings = {
						i = {
							["<esc>"] = actions.close,
						},
					},
				},
			})
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.grep_string, {})
			vim.keymap.set("n", "<leader>fr", builtin.registers, {})
			vim.keymap.set("n", "<leader>fs", builtin.live_grep, {})
			vim.keymap.set("n", "<C-p>", builtin.find_files, {})
			vim.keymap.set("n", "<C-G>", builtin.buffers, {})
		end,
	},
}
