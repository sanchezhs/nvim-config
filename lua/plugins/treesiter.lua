-- lua/plugins/treesitter.lua

require("nvim-treesitter.configs").setup({
  ensure_installed = { "lua", "vim", "vimdoc", "bash", "python", "javascript", "html", "css" },
  highlight = { enable = true },
  indent = { enable = true },
})

