return {
  { "folke/trouble.nvim",            dependencies = { "nvim-tree/nvim-web-devicons" } },

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
      -- modify your configuration vars here
      vim.g.matchup_treesitter_stopline = 500

      -- or call the setup function provided as a helper. It defines the
      -- configuration vars for you
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
  {
    "jkogara/nvim-erblint",
    config = function()
      vim.cmd([[
          autocmd BufWritePost *.erb ErbLint --autocorrect
        ]])
    end,
    dependencies = {
      "rcarriga/nvim-notify",
    },
  },
  { "ThePrimeagen/git-worktree.nvim" },
  { "uarun/vim-protobuf" },
  { "jparise/vim-graphql" },
  { "tyru/open-browser.vim" },
  { "javiorfo/nvim-nyctophilia" },
  { "christoomey/vim-tmux-navigator" },
  { "jabirali/vim-tmux-yank" },
  { "thoughtbot/vim-rspec" },
  { "hashivim/vim-packer" },
  { "fatih/vim-go" },
  { "ruanyl/vim-gh-line" },

  { "rust-lang/rust.vim" },

  -- -- Latex tools
  -- { "vim-latex/vim-latex" },
  {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = "mupdf"
    end,
  },

  -- -- Markdown preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  --
  -- {
  --   "jkogara/peek.nvim",
  --   event = { "VeryLazy" },
  --   build = "deno task --quiet build:fast",
  --   config = function()
  --     require("peek").setup({
  --       auto_load = true,
  --       app = "firefox",
  --       theme = "light",
  --     })
  --     vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
  --     vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
  --   end,
  -- },
  { "shinglyu/vim-codespell" },
  { "cappyzawa/starlark.vim" },

  { "hashivim/vim-terraform" },

  { "ap/vim-css-color" },
  { "mhinz/vim-grepper" },
  { "mbbill/undotree" },

  -- -- Git
  { "tpope/vim-fugitive" },
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
}
