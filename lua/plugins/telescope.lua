-- lua/plugins/telescope.lua
-- NOTE: to enable fzf:
-- cd ~/.local/share/nvim/lazy/telescope-fzf-native.nvim
-- make clean && make
local telescope = require("telescope")

telescope.setup({
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
})

pcall(telescope.load_extension, "fzf")

vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>",  { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>",   { desc = "Buffers" })
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>",   { desc = "Recent files" })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>",  { desc = "Help tags" })

