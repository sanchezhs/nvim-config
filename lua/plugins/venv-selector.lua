require("venv-selector").setup({
  settings = {
    options = {
      notify_user_on_venv_activation = true,
    },
  },
})

vim.keymap.set("n", "<leader>cv", "<cmd>VenvSelect<CR>",       { desc = "Select Python venv" })
vim.keymap.set("n", "<leader>cV", "<cmd>VenvSelectCached<CR>", { desc = "Reuse last venv" })
