require("ibl").setup({
  indent = {
    char = "│",
    tab_char = "│",
  },
  scope = {
    enabled = true,
    show_start = false,
    show_end = false,
  },
  exclude = {
    filetypes = {
      "help", "dashboard", "lazy", "mason", "oil",
      "trouble", "toggleterm", "notify",
    },
  },
})
