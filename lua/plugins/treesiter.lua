-- nvim-treesitter main branch (Neovim 0.12+)
-- Highlighting and indentation are handled by Neovim core automatically
-- when parsers are installed. No need for the old configs module.

require("nvim-treesitter").setup({
  ensure_installed = { "lua", "vim", "vimdoc", "bash", "python", "javascript", "html", "css" },
})
