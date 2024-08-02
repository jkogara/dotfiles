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
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
  {
    "tkatsu/vim-erblint",
    config = function()
      vim.cmd([[
          autocmd BufWritePost *.erb ErbLint --autocorrect
        ]])
    end,
  },
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
  { "vim-latex/vim-latex" },

  -- -- Markdown preview
  {
    "jannis-baum/vivify.vim",
  },

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
