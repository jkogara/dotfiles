return { -- -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/nvim-treesitter-refactor",
      "RRethy/nvim-treesitter-endwise",
      "nvim-treesitter/playground",
      "tree-sitter/tree-sitter-ruby",
    },
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = {
          "c",
          "lua",
          "vim",
          "vimdoc",
          "query",
          "ruby",
          "javascript",
          "terraform",
          "typescript",
          "svelte",
          "yaml",
        },
        sync_install = true,
        highlight = {
          enable = true,
          disable = { "markdown", "md" },
          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        matchup = {
          enable = true, -- mandatory, false will disable the whole extension
          -- disable = { "c", "ruby" },  -- optional, list of language that will be disabled
          -- [options]
        },
        endwise = { enable = true },
      })
    end,
  },
}
