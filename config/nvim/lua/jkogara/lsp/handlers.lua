M = {}

M.import_depdendencies = function()
  local loaded, mason = pcall(require, "mason")
  if not loaded then
    return
  end

  local loaded, mlsp = pcall(require, "mason-lspconfig")
  if not loaded then
    return
  end

  local loaded, luadev = pcall(require, "neodev")
  if loaded then
    luadev.setup()
  end

  mason.setup()
  mlsp.setup()
end

M.setup_language_servers = function(defaults)
  vim.lsp.config("*", defaults)

  vim.lsp.config("lua_ls", require("jkogara.lsp.settings.lua_ls"))
  vim.lsp.enable("lua_ls")
  -- lspconfig.solargraph.setup(vim.tbl_deep_extend("force", require("jkogara.lsp.settings.solargraph"), defaults))
  vim.lsp.config("ruby_lsp", { init_options = { formatter = "rubocop_internal", linters = { "rubocop" } } })
  vim.lsp.enable("ruby_lsp")
  -- lspconfig.jsonls.setup(vim.tbl_deep_extend("force", require("jkogara.lsp.settings.jsonls"), defaults))
  vim.lsp.config("jsonls", require("jkogara.lsp.settings.jsonls"))
  vim.lsp.enable("jsonls")
  vim.lsp.enable("bashls")
  vim.lsp.enable("terraformls")
  vim.lsp.enable("tailwindcss")
  require("jkogara.lsp.settings.terraform")
  vim.lsp.enable("dockerls")
  vim.lsp.enable("html")
  vim.lsp.enable("tsserver")
  vim.lsp.enable("stimulus_ls")
  vim.lsp.enable("yamlls")
  vim.lsp.enable("svelte")
  vim.lsp.enable("jedi_language_server")
  vim.lsp.enable("typos_lsp")
  vim.lsp.config("eslint", {
    on_attach = function(client, bufnr)
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        command = "EslintFixAll",
      })
    end,
  })
  vim.lsp.enable("eslint")
end

M.default_on_attach = function(client, bufnr)
  require("jkogara.lsp.keymaps").setup(client, bufnr)
  require("jkogara.lsp.autocommands").setup(client, bufnr)
end

M.set_capabilities = function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  local loaded, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if not loaded then
    return capabilities
  end

  return cmp_nvim_lsp.default_capabilities(capabilities)
end

M.setup = function()
  M.import_depdendencies()

  local defaults = {
    on_attach = M.default_on_attach,
    capabilities = M.set_capabilities(),
  }

  M.setup_language_servers(defaults)
end

return M
