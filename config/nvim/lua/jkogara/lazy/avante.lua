return {
  {
    "yetone/avante.nvim",
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    -- ⚠️ must add this setting! ! !
    build = vim.fn.has("win32") ~= 0
        and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
        or "make",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    ---@module 'avante'
    ---@type avante.Config
    opts = {
      -- add any opts here
      -- this file can contain specific instructions for your project
      instructions_file = "claude.md",
      -- for example
      provider = "claude",
      providers = {
        claude = {
          endpoint = "https://api.anthropic.com",
          model = "claude-sonnet-4-20250514",
          timeout = 30000, -- Timeout in milliseconds
          extra_request_body = {
            temperature = 0.75,
            max_tokens = 20480,
          },
        },
        -- moonshot = {
        --   endpoint = "https://api.moonshot.ai/v1",
        --   model = "kimi-k2-0711-preview",
        --   timeout = 30000, -- Timeout in milliseconds
        --   extra_request_body = {
        --     temperature = 0.75,
        --     max_tokens = 32768,
        --   },
        -- },
      },
      system_prompt = function()
        local hub = require("mcphub").get_hub_instance()
        return hub and hub:get_active_servers_prompt() or ""
      end,
      -- Using function prevents requiring mcphub before it's loaded
      custom_tools = function()
        return {
          require("mcphub.extensions.avante").mcp_tool(),
        }
      end,
      disabled_tools = {
        "list_files", -- Built-in file operations
        "search_files",
        "read_file",
        "create_file",
        "rename_file",
        "delete_file",
        "create_dir",
        "rename_dir",
        "delete_dir",
        "bash", -- Built-in terminal access
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick",      -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp",           -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua",           -- for file_selector provider fzf
      "stevearc/dressing.nvim",     -- for input provider dressing
      "folke/snacks.nvim",          -- for input provider snacks
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      {
        "zbirenbaum/copilot.lua",
        config = function()
          require("copilot").setup({
            panel = {
              enabled = true,
              auto_refresh = false,
              keymap = {
                jump_prev = "[[",
                jump_next = "]]",
                accept = "<CR>",
                refresh = "gr",
                open = "<M-CR>",
              },
              layout = {
                position = "bottom", -- | top | left | right
                ratio = 0.4,
              },
            },
            suggestion = {
              enabled = true,
              auto_trigger = false,
              debounce = 75,
              keymap = {
                accept = false,
                accept_word = false,
                accept_line = false,
                next = "<M-]>",
                prev = "<M-[>",
                dismiss = "<C-]>",
              },
            },
            filetypes = {
              yaml = true,
              markdown = true,
              help = false,
              gitcommit = false,
              gitrebase = false,
              hgcommit = false,
              svn = false,
              cvs = false,
              ["."] = false,
            },
            copilot_node_command = vim.fn.expand("$HOME") .. "/.nvm/versions/node/v22.20.0/bin/node", -- Node.js version must be > 22
            server_opts_overrides = {},
          })
          vim.keymap.set("i", "<Tab>", function()
            if require("copilot.suggestion").is_visible() then
              require("copilot.suggestion").accept()
            else
              vim.api.nvim_feedkeys(
                vim.api.nvim_replace_termcodes("<Tab>", true, false, true),
                "n",
                false
              )
            end
          end, { desc = "Super Tab" })
        end,
      },
      "ravitemer/mcphub.nvim",
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
  -- {
  --   "yetone/avante.nvim",
  --   event = "VeryLazy",
  --   version = false, -- Never set this value to "*"! Never!
  --   opts = {
  --     -- add any opts here
  --     -- for example
  --     provider = "claude",
  --     providers = {
  --       openai = {
  --         endpoint = "https://api.openai.com/v1",
  --         model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
  --         timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
  --         extra_request_body = {
  --           temperature = 0,
  --           max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
  --         },
  --         --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
  --       },
  --       claude = {
  --         endpoint = "https://api.anthropic.com",
  --         -- model = "claude-3-7-sonnet-20250219",
  --         model = "claude-sonnet-4-20250514",
  --         disable_tools = true,
  --         extra_request_body = {
  --           temperature = 0,
  --           max_tokens = 16000,
  --         },
  --         behaviour = {
  --           auto_suggestions = false,
  --           minimize_diff = false,
  --           enable_cursor_planning_mode = true,
  --           enable_claude_text_editor_tool_mode = true,
  --         },
  --       },
  --     },
  --     system_prompt = function()
  --       local hub = require("mcphub").get_hub_instance()
  --       return hub and hub:get_active_servers_prompt() or ""
  --     end,
  --     -- Using function prevents requiring mcphub before it's loaded
  --     custom_tools = function()
  --       return {
  --         require("mcphub.extensions.avante").mcp_tool(),
  --       }
  --     end,
  --     disabled_tools = {
  --       "list_files", -- Built-in file operations
  --       "search_files",
  --       "read_file",
  --       "create_file",
  --       "rename_file",
  --       "delete_file",
  --       "create_dir",
  --       "rename_dir",
  --       "delete_dir",
  --       "bash", -- Built-in terminal access
  --     },
  --   },
  --   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  --   build = "make",
  --   -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --     "stevearc/dressing.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --     --- The below dependencies are optional,
  --     "echasnovski/mini.pick",      -- for file_selector provider mini.pick
  --     "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
  --     "hrsh7th/nvim-cmp",           -- autocompletion for avante commands and mentions
  --     "ibhagwan/fzf-lua",           -- for file_selector provider fzf
  --     "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
  --     "zbirenbaum/copilot.lua",     -- for providers='copilot'
  --     "ravitemer/mcphub.nvim",
  --     {
  --       -- support for image pasting
  --       "HakonHarnes/img-clip.nvim",
  --       event = "VeryLazy",
  --       opts = {
  --         -- recommended settings
  --         default = {
  --           embed_image_as_base64 = false,
  --           prompt_for_file_name = false,
  --           drag_and_drop = {
  --             insert_mode = true,
  --           },
  --           -- required for Windows users
  --           use_absolute_path = true,
  --         },
  --       },
  --     },
  --     {
  --       -- Make sure to set this up properly if you have lazy=true
  --       "MeanderingProgrammer/render-markdown.nvim",
  --       opts = {
  --         file_types = { "markdown", "Avante" },
  --       },
  --       ft = { "markdown", "Avante" },
  --     },
  --   },
  -- },
}
