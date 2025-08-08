require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- nvim tree
map("n", "<leader>e", "<cmd> NvimTreeToggle <cr>", { desc = "Toggle Nvim Tree" })

-- lsp actions
map("n", "<leader>ca", "<cmd> lua vim.lsp.buf.code_action() <cr>", { desc = "LSP Actions" })


-- Replace horizontal terminal keybind
-- Unmap the default <leader>h if needed
map("n", "<leader>h", "", {})  -- unbind old mapping (optional, if it exists)

-- New mapping: <leader>hh to open horizontal terminal
map("n", "<leader>hh", function()
  require("nvchad.term").toggle { pos = "sp" }
end, { desc = "Toggle horizontal terminal" })
