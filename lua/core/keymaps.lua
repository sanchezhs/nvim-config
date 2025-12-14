-- lua/core/keymaps.lua

local map = vim.keymap.set
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

map("n", "<leader>ww", ":w<CR>", { desc = "Write file" })
map("n", "<leader>qq", ":qa!<CR>", { desc = "Quit all" })
map("n", "<leader>e",  ":Ex<CR>", { desc = "Open netrw (fallback)" })

map("n", "<A-j>", ":m .+1<CR>==") -- move line up(n)
map("n", "<A-k>", ":m .-2<CR>==") -- move line down(n)
map("v", "<A-j>", ":m '>+1<CR>gv=gv") -- move line up(v)
map("v", "<A-k>", ":m '<-2<CR>gv=gv") -- move line down(v)

vim.keymap.set("n", "<leader>e", function()
  require("oil").open()
end, { desc = "Open Dired", silent = true })




-- vim.keymap.set("n", "<leader>e", ":Dired<CR>", {
--   desc = "Open Dired (netrw)",
--   silent = true,
-- })
