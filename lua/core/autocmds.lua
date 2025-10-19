-- lua/core/autocmds.lua

local group = vim.api.nvim_create_augroup("UserAutocmds", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  group = group,
  pattern = "*",
  callback = function() vim.highlight.on_yank() end,
})

