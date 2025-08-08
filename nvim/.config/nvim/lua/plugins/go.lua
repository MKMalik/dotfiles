return {
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",  -- required for floating window support
      "neovim/nvim-lspconfig", -- LSP support
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup({
        lsp_cfg = true, -- use default LSP setup
        lsp_inlay_hints = {
          enable = true,
        },
        dap_debug = true, -- enable delve debugger
      })
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()' -- install binaries
  },
}
