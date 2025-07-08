return {
  { "folke/neodev.nvim", opts = {} },

  {
    "nvim-lua/lsp-status.nvim",
    event = "BufReadPre",
  },
  {
    "j-hui/fidget.nvim",
    event = "BufReadPre",
    config = function()
      require("fidget").setup({})
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    version = "v1.32.0",
  },
  {
    "williamboman/mason.nvim",
    event = "BufReadPre",
    version = "v1.11.0",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("jkogara.lsp").setup()
    end,
    build = ":MasonUpdate",
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
      local mason_tool_installer = require("mason-tool-installer")
      mason_tool_installer.setup({

        ensure_installed = {
          "bash-language-server",
          "black",
          "dockerfile-language-server",
          "erb-lint",
          "eslint-lsp",
          "eslint_d",
          "fixjson",
          "flake8",
          "isort",
          "jedi-language-server",
          "jq",
          "json-lsp",
          "jupytext",
          "lemonade",
          "lua-language-server",
          "prettier",
          "prettierd",
          "pylint",
          "ruby-lsp",
          "rubyfmt",
          "rustywind",
          "shfmt",
          "stimulus-language-server",
          "stylua",
          "svelte-language-server",
          "tailwindcss-language-server",
          "terraform-ls",
          "tflint",
          "ts-standard",
          "typescript-language-server",
          "typos-lsp",
          "write-good",
          "yaml-language-server",
        },
      })
    end,
  },
  {
    "mihyaeru21/nvim-lspconfig-bundler",
    event = "BufReadPre",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("lspconfig-bundler").setup()
    end,
  },
}
