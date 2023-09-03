require("neorg").setup({
  load = {
    ["core.defaults"] = {},
    ["core.dirman"] = {
      config = {
        workspaces = {
          work = "/keybase/private/jkogara/notes/work",
          home = "/keybase/private/jkogara/notes/home",
        }
      }
    }
  }
})
