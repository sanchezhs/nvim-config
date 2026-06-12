require("neogit").setup {
  process_spinner           = false,
  disable_line_numbers      = true,
  disable_relative_line_numbers = true,
  graph_style               = "unicode",

  telescope_sorter = function()
    return require("telescope").extensions.fzf.native_fzf_sorter()
  end,

  integrations = {
    diffview = true,
  },
}
