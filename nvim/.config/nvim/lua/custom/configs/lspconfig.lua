-- ~/.config/nvim/lua/custom/configs/lspconfig.lua

local lspconfig = require "lspconfig"
local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

-- Existing default NvChad LSP setup (if any)
require "lspconfig"

-- Setup tsserver
lspconfig.ts_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "vue" },
  root_dir = lspconfig.util.root_pattern("tsconfig.json", "jsconfig.json", ".git"),
  settings = {
    -- Optional: Add any specific tsserver settings here
    -- For example, if you want to enable JSX auto-completion for JavaScript files:
    javascript = {
      preferences = {
        jsx = "react",
      },
    },
    typescript = {
      preferences = {
        jsx = "react",
      },
    },
  },
}

lspconfig.dartls.setup {}

-- Add other LSP configurations below this
-- lspconfig.html.setup({ ... })
