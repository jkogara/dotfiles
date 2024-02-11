vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- LSP
  use {
	  "VonHeikemen/lsp-zero.nvim",
	  branch = "v1.x",
	  requires = {
		  -- LSP Support
		  {"neovim/nvim-lspconfig"},
		  {"williamboman/mason.nvim"},
		  {"williamboman/mason-lspconfig.nvim"},

		  -- Autocompletion
		  {"hrsh7th/nvim-cmp"},
		  {"hrsh7th/cmp-buffer"},
		  {"hrsh7th/cmp-path"},
		  {"saadparwaiz1/cmp_luasnip"},
      {'hrsh7th/cmp-cmdline'},
		  {"hrsh7th/cmp-nvim-lsp"},
		  {"hrsh7th/cmp-nvim-lua"},

		  -- Snippets
		  {"L3MON4D3/LuaSnip"},
		  {"rafamadriz/friendly-snippets"},
	  }
  }  --

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'nvim-treesitter/nvim-treesitter-refactor'
  use 'RRethy/nvim-treesitter-endwise'
  use 'nvim-treesitter/playground'

  -- Telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use { 'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    config = function()
      require('telescope').setup {
        defaults = {
          file_ignore_patterns = { "node_modules", ".git" }
        }
      }
    end
  }

  -- Git
  use 'tpope/vim-fugitive'
  use { 'lewis6991/gitsigns.nvim' }

  -- Statusline
  use 'nvim-lualine/lualine.nvim'

  -- Icons
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'

  -- Autopairs
  use { 'windwp/nvim-autopairs', config = function() require("nvim-autopairs").setup {} end }

  use 'uarun/vim-protobuf'
  use 'jparise/vim-graphql'
  use 'github/copilot.vim'
  use 'tyru/open-browser.vim'
  use 'weirongxu/plantuml-previewer.vim'
  use 'aklt/plantuml-syntax'
  use 'christoomey/vim-tmux-navigator'
  use 'jabirali/vim-tmux-yank'
  use 'thoughtbot/vim-rspec'
  use 'hashivim/vim-packer'
  use 'matze/vim-tex-fold'
  use 'fatih/vim-go'
  use 'ruanyl/vim-gh-line'

  use 'rust-lang/rust.vim'
  use 'overcache/NeoSolarized'

  -- Latex tools
  use 'vim-latex/vim-latex'
  use 'xuhdev/vim-latex-live-preview'

  -- Markdown preivew
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  use 'shinglyu/vim-codespell'
  use 'cappyzawa/starlark.vim'

  use 'hashivim/vim-terraform'

  use 'ap/vim-css-color'
  use 'mhinz/vim-grepper'
  use 'mbbill/undotree'

  use 'shumphrey/fugitive-gitlab.vim'
  use 'tpope/vim-bundler'
  use 'tpope/vim-commentary'
  use 'tpope/vim-dispatch'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rbenv'
  use 'tpope/vim-haml'
  use 'tpope/vim-rails'
  use 'tpope/vim-projectionist'
  use 'tpope/vim-rake'
  use 'tpope/vim-repeat'
  use 'tpope/vim-sensible'
  use 'tpope/vim-surround'

end)
