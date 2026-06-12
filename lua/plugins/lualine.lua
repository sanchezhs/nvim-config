require("lualine").setup({
  options = {
    theme           = "auto",
    icons_enabled   = true,
    globalstatus    = true,
    component_separators = { left = "", right = "" },
    section_separators   = { left = "", right = "" },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff" },
    lualine_c = { { "filename", path = 1 } },
    lualine_x = {
      { "diagnostics", sources = { "nvim_lsp" } },
      "filetype",
    },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
})
