local util = require("lspconfig.util")

return {
  filetypes = { "ruby", "rakefile" },
  root_dir = util.root_pattern("Gemfile", ".git", "."),
  flags = {
    debounce_text_changes = 150,
  },
  settings = {
    solargraph = {
      autoformat = true,
      completion = true,
      hover = true,
      formatting = true,
      diagnostic = true,
      folding = true,
      references = true,
      rename = true,
      symbols = true,
    },
  },
}
