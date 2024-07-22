return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      vim.opt.signcolumn = "yes"
      require("gitsigns").setup({

        signs = {
          add = { text = "" },
          change = { text = "󰦒" },
          delete = { text = "󰍴" },
          topdelete = { text = "" },
          changedelete = { text = "󰜥" },
          untracked = { text = "󱣳" },
        },
      })
      vim.api.nvim_set_keymap(
        "n",
        "<C-b>",
        ":Gitsigns toggle_current_line_blame<CR>",
        { noremap = true, silent = true }
      )
    end,
  },
}
