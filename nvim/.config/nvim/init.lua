vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "autocmds"

vim.schedule(function()
  require "mappings"
end)

require("custom.configs.lspconfig")

-- make nvim transparent
vim.api.nvim_set_hl(0, "Normal", { bg = "none" });
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" });

-- Ensure Neovim's main window and floating window backgrounds are transparent
vim.opt.winhighlight = "Normal:Normal,NormalFloat:Normal"

-- It's often good practice to explicitly set background to 'dark' or 'light'
-- so colorschemes behave correctly even with transparency.
vim.opt.background = "dark" -- Or "light" if you use a light colorscheme
vim.o.scrolloff=999

vim.api.nvim_create_user_command("BookJournal", function(opts)
  local path = vim.fn.expand(opts.args)
  if vim.fn.filereadable(path) == 0 then
    local file = io.open(path, "w")
    local book_title = vim.fn.fnamemodify(path, ":h:t")
    file:write("# 📖 " .. book_title .. "\n")
    file:write("*Date: " .. os.date("%Y-%m-%d") .. "*\n\n")
    file:write("- 📄 Page: \n")
    file:write("- 📚 Chapter: \n")
    file:write("- ⏳ Duration: \n\n")
    file:write("---\n\n")

    file:write("## 🧠 Summary (in your own words)\n\n> \n\n")
    file:write("## 🔥 Big Ideas (Today’s Takeaways)\n\n- \n\n")
    file:write("## 💬 Quotes to Remember\n\n> \n\n")
    file:write("## 💡 Personal Reflection\n\n> \n\n")
    file:write("## 🛠️ Actionable Insight\n\n> \n\n")
    file:write("## ⏳ Questions to Revisit\n\n- \n\n")
    file:close()
  end
  vim.cmd("edit " .. path)
  vim.cmd("Goyo")
end, { nargs = 1 })

