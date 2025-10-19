-- lua/core/keymaps.lua

local map = vim.keymap.set
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

map("n", "<leader>ww", ":w<CR>", { desc = "Write file" })
map("n", "<leader>qq", ":qa!<CR>", { desc = "Quit all" })
map("n", "<leader>e",  ":Ex<CR>", { desc = "Open netrw (fallback)" })

vim.keymap.set("n", "<leader>e", function()
  require("oil").open()
end, { desc = "Open Dired", silent = true })

-- vim.keymap.set("n", "<leader>e", ":Dired<CR>", {
--   desc = "Open Dired (netrw)",
--   silent = true,
-- })
