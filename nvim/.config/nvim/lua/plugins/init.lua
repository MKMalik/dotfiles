return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "dart",
        "go",
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      -- Mason will automatically install these LSP servers and other tools
      ensure_installed = {
        "lua_ls",
        "stylua",
        "html",
        "cssls",
        "jsonls",
        "ts_ls",
        "go",
        -- You can add other language servers here, e.g., "eslint", "prettier", etc.
      },
    },
  },
  {
    "akinsho/flutter-tools.nvim",
    ft = "dart", -- Only load for dart files
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- "uloco/luasnip.nvim", -- Required for flutter-tools snippets
    },
    opts = {
      lsp = {
        -- This is where you can configure the dartls settings *within* flutter-tools
        -- It will override the global lspconfig settings for dartls
        settings = {
          dart = {
            completeFunctionCalls = true,
            showTodos = true,
            lineLength = 80,
          },
        },
      },
      -- Other flutter-tools configurations
      widget_guides = {
        enabled = true,
      },
      debugger = {
        enabled = true,
        -- Add the path to your Dart Debugger if not in PATH
        -- flutter_path = "~/.asdf/shims/flutter", -- Example for asdf
        -- If you have multiple Flutter SDKs, you might need to specify the path
      },
      dev_log = {
        enabled = true,
        open_cmd = "tabnew", -- Or "split", "vsplit"
      },
      -- For more options, see: https://github.com/akinsho/flutter-tools.nvim#configuration
    },
    config = function(_, opts)
      require("flutter-tools").setup(opts)
    end,
  },
  {
    "preservim/vim-markdown",
    ft = "markdown",
    config = function()
      vim.g.vim_markdown_folding_disabled = 1
      vim.g.vim_markdown_conceal = 0
      vim.g.vim_markdown_new_list_item_indent = 2
    end,
  },
  {
    "junegunn/goyo.vim",
    cmd = "Goyo",
  },
  {
    "preservim/vim-pencil",
    ft = "markdown",
    config = function()
      vim.cmd [[
      autocmd FileType markdown PencilSoft
    ]]
    end,
  },
  {
    "https://github.com/MKMalik/hyper-harpoon.git",
    lazy = false,
  },
  require("plugins.go"),
}
