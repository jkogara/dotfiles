local lualine = require "lualine"

local config = {
  options = {
    theme = 'onelight',
  },
  sections = {
    lualine_c = {
      { "filename", path = 1 },
      { "diagnostics", sources = { "nvim_diagnostic" } },
    },
    lualine_x = { "overseer", "encoding", "fileformat", "filetype" },
  }
}

lualine.setup(config)
