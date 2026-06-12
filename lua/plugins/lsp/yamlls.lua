return {
  cmd        = { "yaml-language-server", "--stdio" },
  filetypes  = { "yaml", "yaml.docker-compose", "yaml.gitlab" },
  root_markers = { ".git" },
  settings = {
    yaml = {
      keyOrdering = false,
      format      = { enable = true },
      validate    = true,
      hover       = true,
      completion  = true,
      schemaStore = {
        enable = true,
        url    = "https://www.schemastore.org/api/json/catalog.json",
      },
    },
  },
  single_file_support = true,
}
