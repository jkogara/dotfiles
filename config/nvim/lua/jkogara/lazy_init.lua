local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		-- LSP
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
		{ "neovim/nvim-lspconfig" },
		{ "L3MON4D3/LuaSnip" },
		{ "mfussenegger/nvim-lint" },

		-- Snippets
		{ "L3MON4D3/LuaSnip" },
		{ "rafamadriz/friendly-snippets" },
		{ "mihyaeru21/nvim-lspconfig-bundler" },
		{ "saadparwaiz1/cmp_luasnip" },

		-- Autocompletion
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-cmdline" },
		{ "hrsh7th/cmp-nvim-lua" },
		{
			"stevearc/conform.nvim",
			config = function()
				require("conform").setup()
			end,
		},
		{ "folke/trouble.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },

		{ "kevinhwang91/nvim-ufo", dependencies = "kevinhwang91/promise-async" },

		-- -- Treesitter
		{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
		{ "nvim-treesitter/nvim-treesitter-textobjects" },
		{ "nvim-treesitter/nvim-treesitter-refactor" },
		{ "RRethy/nvim-treesitter-endwise" },
		{ "nvim-treesitter/playground" },

		-- -- Telescope
		{ "nvim-lua/popup.nvim" },
		{ "nvim-lua/plenary.nvim" },
		{
			"nvim-telescope/telescope.nvim",
			version = "0.1.2",
			config = function()
				require("telescope").setup({
					defaults = {
						file_ignore_patterns = { "node_modules", ".git" },
					},
				})
			end,
		},

		-- -- Statusline
		{ "nvim-lualine/lualine.nvim" },

		-- -- Icons
		{ "nvim-tree/nvim-tree.lua" },
		{ "nvim-tree/nvim-web-devicons" },

		-- -- Autopairs
		{
			"windwp/nvim-autopairs",
			config = function()
				require("nvim-autopairs").setup({})
			end,
		},
		{
			"andymass/vim-matchup",
			init = function()
				vim.g.matchup_matchparen_offscreen = { method = "popup" }
			end,
		},

		{ "uarun/vim-protobuf" },
		{ "jparise/vim-graphql" },
		{ "github/copilot.vim" },
		{ "tyru/open-browser.vim" },
		{ "javiorfo/nvim-soil" },
		{ "javiorfo/nvim-nyctophilia" },
		{ "christoomey/vim-tmux-navigator" },
		{ "jabirali/vim-tmux-yank" },
		{ "thoughtbot/vim-rspec" },
		{ "hashivim/vim-packer" },
		{ "matze/vim-tex-fold" },
		{ "fatih/vim-go" },
		{ "ruanyl/vim-gh-line" },
		{ "overcache/NeoSolarized" },

		{ "rust-lang/rust.vim" },

		-- -- Latex tools
		{ "vim-latex/vim-latex" },

		-- -- Markdown preview
		{
			"iamcco/markdown-preview.nvim",
			build = function()
				vim.fn["mkdp#util#install"]()
			end,
		},

		{ "shinglyu/vim-codespell" },
		{ "cappyzawa/starlark.vim" },

		{ "hashivim/vim-terraform" },

		{ "ap/vim-css-color" },
		{ "mhinz/vim-grepper" },
		{ "mbbill/undotree" },

		-- -- Git
		{ "tpope/vim-fugitive" },
		{ "lewis6991/gitsigns.nvim" },
		{ "shumphrey/fugitive-gitlab.vim" },

		-- -- Tim Pope
		{ "tpope/vim-bundler" },
		{ "tpope/vim-commentary" },
		{ "tpope/vim-dispatch" },
		{ "tpope/vim-rbenv" },
		{ "tpope/vim-haml" },
		{ "tpope/vim-rails" },
		{ "tpope/vim-projectionist" },
		{ "tpope/vim-rake" },
		{ "tpope/vim-repeat" },
		{ "tpope/vim-sensible" },
		{ "tpope/vim-surround" },
	},
	change_detection = { notify = false },
})
