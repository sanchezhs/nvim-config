return {
  cmd        = { "vscode-json-language-server", "--stdio" },
  filetypes  = { "json", "jsonc" },
  root_markers = { ".git" },
  settings = {
    json = {
      validate = { enable = true },
      format   = { enable = true },
    },
  },
  init_options = {
    provideFormatter = true,
  },
  single_file_support = true,
}
