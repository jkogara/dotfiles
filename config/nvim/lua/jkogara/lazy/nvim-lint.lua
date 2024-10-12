return {
  {
    "mfussenegger/nvim-lint",
    enabled = false,
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    config = function()
      local lint = require("lint")
      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
      lint.linters_by_ft = {
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        svelte = { "eslint_d" },
        css = { "prettier" },
        scss = { "prettier" },
        python = { "flake8", "pylint" },
        jsx = { "eslint", "prettier" },
        dockerfile = { "hadolint" },
        rust = { "analyzer" },
        elixir = { "elixir-ls" },
        eruby = { "erblint" },
        ruby = { "bundle exec rubocop", "ruby" },
      }

      vim.keymap.set("n", "<leader>L", function()
        lint.try_lint()
      end, { desc = "Trigger linting for current file" })
    end,
  },
}
