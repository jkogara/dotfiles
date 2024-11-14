local conditional = function(fn)
  local utils = require("null-ls.utils").make_conditional_utils()
  return fn(utils)
end

return {
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      local sources = {
        -- conditional(function(utils)
        --   return utils.root_has_file("Gemfile")
        --       and null_ls.builtins.formatting.rubocop.with({
        --         command = "bundle",
        --         args = vim.list_extend(
        --           { "exec", "rubocop" },
        --           null_ls.builtins.formatting.rubocop._opts.args
        --         ),
        --       })
        --       or null_ls.builtins.formatting.rubocop
        -- end),
        null_ls.builtins.completion.luasnip,
        -- conditional(function(utils)
        --   return utils.root_has_file("Gemfile")
        --       and null_ls.builtins.diagnostics.rubocop.with({
        --         command = "bundle",
        --         args = vim.list_extend(
        --           { "exec", "rubocop" },
        --           null_ls.builtins.diagnostics.rubocop._opts.args
        --         ),
        --       })
        --       or null_ls.builtins.formatting.rubocop
        -- end),
        null_ls.builtins.diagnostics.terraform_validate,
        null_ls.builtins.diagnostics.pylint,
        null_ls.builtins.diagnostics.write_good,
        null_ls.builtins.formatting.black.with({ extra_args = { "--fast" } }),
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.prettier.with({
          filetypes = {
            "css",
            "scss",
            "html",
            "json",
            "yaml",
            "markdown",
            "graphql",
            "md",
            "txt",
          },
        }),
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.rustywind, -- organize tailwind classes
        null_ls.builtins.formatting.terraform_fmt,
        require("none-ls.diagnostics.eslint_d"),
        require("none-ls.formatting.eslint_d"),
        -- null_ls.builtins.formatting.erb_lint.with({
        --   on_output = function(params, done)
        --     local output = params.output
        --     if output:find("No errors were found in ERB files") then
        --       return done()
        --     end

        --     local metadata_end = output:match(".*==()") + 1
        --     return done({ { text = output:sub(metadata_end) } })
        --   end,
        -- }),
        null_ls.builtins.diagnostics.erb_lint.with({}),
      }
      null_ls.setup({
        sources = sources,
        debug = true,

        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ async = false })
              end,
            })
          end
        end,
      })
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvimtools/none-ls-extras.nvim",
    },
  },
}
