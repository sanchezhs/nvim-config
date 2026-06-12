-- lua/core/keymaps.lua

local map = vim.keymap.set

-- Disable space in normal/visual (used as leader)
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- File
map("n", "<leader>ww", "<cmd>w<CR>",   { desc = "Write file" })
map("n", "<leader>qq", "<cmd>qa!<CR>", { desc = "Quit all" })

-- Clear search highlight
map("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- Move lines (normal & visual)
map("n", "<A-j>", "<cmd>m .+1<CR>==",  { desc = "Move line down" })
map("n", "<A-k>", "<cmd>m .-2<CR>==",  { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Window left" })
map("n", "<C-j>", "<C-w>j", { desc = "Window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window up" })
map("n", "<C-l>", "<C-w>l", { desc = "Window right" })

-- Oil (file explorer)
map("n", "<leader>e", function()
  require("oil").open()
end, { desc = "Open Oil", silent = true })

-- Git (fugitive keymaps están en plugins/init.lua bajo la spec de vim-fugitive)
