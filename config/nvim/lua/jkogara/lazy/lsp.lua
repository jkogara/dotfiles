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
    "williamboman/mason.nvim",
    event = "BufReadPre",
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
          "typos-lsp",
          "prettier",               -- prettier formatter
          "stylua",                 -- lua formatter
          "isort",                  -- python formatter
          "black",                  -- python formatter
          "pylint",                 -- python linter
          "eslint_d",               -- js linter
          "rubyfmt",                -- ruby formatter
          "eslint_d",               -- js linter
          "flake8",                 -- python linter
          "shfmt",                  -- shell formatter
          "ts-standard",            -- typescript linter
          "tailwindcss-language-server", --tailwindcss
          "fixjson",                -- json formatter
          "typos_lsp",              -- spell checker
          "jq",                     -- json formatter
          "terraform-ls",           -- terraform language server
          "tflint",
          "lemonade",               -- lemonade copy paste util
          "stimulus-language-server", -- stimulus language server
          "lua-language-server",
          "bash-language-server",
          "dockerfile-language-server",
          "json-lsp",
          "yaml-language-server",
          "typescript-language-server",
          "write-good",
          "jedi-language-server",
          "svelte-language-server",
          "erb-lint",
          "rubocop",
          "rustywind",
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
