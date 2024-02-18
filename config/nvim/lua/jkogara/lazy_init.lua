local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- LSP
    {
      "neovim/nvim-lspconfig",
      dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "L3MON4D3/LuaSnip",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-path",
        "hrsh7th/nvim-cmp",
        "j-hui/fidget.nvim",
        "saadparwaiz1/cmp_luasnip",
        "williamboman/mason-lspconfig.nvim",
        "williamboman/mason.nvim",
      },

      config = function()
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
          "force",
          {},
          vim.lsp.protocol.make_client_capabilities(),
          cmp_lsp.default_capabilities())

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
          ensure_installed = {
            "bashls",
            "cmake",
            "cssls",
            "dockerls",
            "emmet_language_server",
            "gopls",
            "graphql",
            "html",
            "jsonls",
            "lua_ls",
            "marksman",
            "pyright",
            "rust_analyzer",
            "solargraph",
            "terraformls",
            "tsserver",
            "typos_lsp",
            "vimls",
            "yamlls",
          },
          handlers = {
            function(server_name) -- default handler (optional)
              require("lspconfig")[server_name].setup {
                capabilities = capabilities
              }
            end,

            ["lua_ls"] = function()
              local lspconfig = require("lspconfig")
              lspconfig.lua_ls.setup {
                capabilities = capabilities,
                settings = {
                  Lua = {
                    diagnostics = {
                      globals = { "vim", "it", "describe", "before_each", "after_each" },
                    }
                  }
                }
              }
            end,
          }
        })

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
          snippet = {
            expand = function(args)
              require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            end,
          },
          mapping = cmp.mapping.preset.insert({
            ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
            ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
            ['<C-y>'] = cmp.mapping.confirm({ select = true }),
            ["<C-Space>"] = cmp.mapping.complete(),
          }),
          sources = cmp.config.sources({
            { name = "buffer" },
            { name = "cmp_tabnine" },
            { name = "luasnip" },
            { name = "nvim_lsp" },
            { name = "nvim_lua" },
            { name = "path" },
          }, {
            { name = 'buffer' },
          })
        })

        vim.diagnostic.config({
          -- update_in_insert = true,
          float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
          },
        })
      end
    },
    { "mfussenegger/nvim-lint" },

    -- Snippets
    { "rafamadriz/friendly-snippets" },
    { "saadparwaiz1/cmp_luasnip" },

    {
      "stevearc/conform.nvim",
      event = { "BufWritePre" },
      cmd = { "ConformInfo" },
      keys = {
        {
          -- Customize or remove this keymap to your liking
          "<leader>f",
          function()
            require("conform").format({ async = true, lsp_fallback = true })
          end,
          mode = "",
          desc = "Format buffer",
        },
      },
      -- Everything in opts will be passed to setup()
      opts = {
        -- Define your formatters
        formatters_by_ft = {
          lua = { "stylua" },
          -- Conform will run multiple formatters sequentially
          python = { "isort", "black" },
          -- Use a sub-list to run only the first available formatter
          javascript = { { "prettier" } },
          typescript = { { "prettier", "eslint", "trim_whitespace" } },
          ruby = { "rubocop" },
        },
        -- Set up format-on-save
        format_on_save = { timeout_ms = 2000, lsp_fallback = true },
        -- Customize formatters
        formatters = {
          shfmt = {
            prepend_args = { "-i", "2" },
          },
        },
      },
      init = function()
        -- If you want the formatexpr, here is the place to set it
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
        require("conform").formatters.ruby = {
          command = "/home/jkogara/.rbenv/shims/rubocop",
        }
      end,
    },
    { "folke/trouble.nvim",    dependencies = { "nvim-tree/nvim-web-devicons" } },

    { "kevinhwang91/nvim-ufo", dependencies = "kevinhwang91/promise-async" },

    -- -- Treesitter
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
          ensure_installed = {
            "c",
            "lua",
            "vim",
            "vimdoc",
            "query",
            "ruby",
            "javascript",
            "terraform",
            "yaml",
          },
          sync_install = true,
          highlight = {
            enable = true,
            disable = { "markdown", "md" },
            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
            -- Using this option may slow down your editor, and you may see some duplicate highlights.
            -- Instead of true it can also be a list of languages
            additional_vim_regex_highlighting = false,
          },
          indent = { enable = true },
          matchup = {
            enable = true, -- mandatory, false will disable the whole extension
            -- disable = { "c", "ruby" },  -- optional, list of language that will be disabled
            -- [options]
          },
          endwise = { enable = true },
        })
      end,
    },
    { "nvim-treesitter/nvim-treesitter-textobjects" },
    { "nvim-treesitter/nvim-treesitter-refactor" },
    { "RRethy/nvim-treesitter-endwise" },
    { "nvim-treesitter/playground" },

    -- -- Telescope
    { "nvim-lua/popup.nvim" },
    { "nvim-lua/plenary.nvim" },
    {
      "nvim-telescope/telescope.nvim",
      version = "0.1.2",
      config = function()
        require("telescope").setup({
          defaults = {
            file_ignore_patterns = { "node_modules", ".git" },
          },
        })
      end,
    },

    -- -- Statusline
    { "nvim-lualine/lualine.nvim" },

    -- -- Icons
    { "nvim-tree/nvim-tree.lua" },
    { "nvim-tree/nvim-web-devicons" },

    -- -- Autopairs
    {
      "windwp/nvim-autopairs",
      config = function()
        require("nvim-autopairs").setup({})
      end,
    },
    {
      "andymass/vim-matchup",
      init = function()
        vim.g.matchup_matchparen_offscreen = { method = "popup" }
      end,
    },

    { "uarun/vim-protobuf" },
    { "jparise/vim-graphql" },
    { "github/copilot.vim" },
    { "tyru/open-browser.vim" },
    {
      "javiorfo/nvim-soil",
      config = function()
        require("soil").setup({
          puml_jar = "/opt/plantuml.jar",

          image = {
            darkmode = false, -- Enable or disable darkmode
            format = "png",   -- Choose between png or svg

            -- This is a default implementation of using nsxiv to open the resultant image
            -- Edit the string to use your preferred app to open the image
            -- Some examples:
            -- return "feh " .. img
            -- return "xdg-open " .. img
            execute_to_open = function(img)
              return "nsxiv -b " .. img
            end,
          },
        })
      end,
    },
    { "javiorfo/nvim-nyctophilia" },
    { "christoomey/vim-tmux-navigator" },
    { "jabirali/vim-tmux-yank" },
    { "thoughtbot/vim-rspec" },
    { "hashivim/vim-packer" },
    { "matze/vim-tex-fold" },
    { "fatih/vim-go" },
    { "ruanyl/vim-gh-line" },
    { "overcache/NeoSolarized" },

    { "rust-lang/rust.vim" },

    -- -- Latex tools
    { "vim-latex/vim-latex" },

    -- -- Markdown preview
    {
      "iamcco/markdown-preview.nvim",
      build = function()
        vim.fn["mkdp#util#install"]()
      end,
    },

    { "shinglyu/vim-codespell" },
    { "cappyzawa/starlark.vim" },

    { "hashivim/vim-terraform" },

    { "ap/vim-css-color" },
    { "mhinz/vim-grepper" },
    { "mbbill/undotree" },

    -- -- Git
    { "tpope/vim-fugitive" },
    {
      "lewis6991/gitsigns.nvim",
      config = function()
        require('gitsigns').setup({
          signs = {
            add          = { text = '│' },
            change       = { text = '│' },
            delete       = { text = '_' },
            topdelete    = { text = '‾' },
            changedelete = { text = '~' },
            untracked    = { text = '┆' },
          },
        })
      end,
    },
    { "shumphrey/fugitive-gitlab.vim" },

    -- -- Tim Pope
    { "tpope/vim-bundler" },
    { "tpope/vim-commentary" },
    { "tpope/vim-dispatch" },
    { "tpope/vim-rbenv" },
    { "tpope/vim-haml" },
    { "tpope/vim-rails" },
    { "tpope/vim-projectionist" },
    { "tpope/vim-rake" },
    { "tpope/vim-repeat" },
    { "tpope/vim-sensible" },
    { "tpope/vim-surround" },
  },
  change_detection = { notify = false },
})
