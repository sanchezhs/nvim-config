-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/pyright.lua

return {
	cmd = {
		"pyright-langserver",
		"--stdio",
	},
	filetypes = {
		"python",
	},
	root_markers = {
		".git",
		"Pipfile",
		"pyproject.toml",
		"pyrightconfig.json",
		"requirements.txt",
		"setup.cfg",
		"setup.py",
	},
	-- https://microsoft.github.io/pyright/#/settings?id=pyright-settings
	settings = {
		python = {
			analysis = {
				typeCheckingMode    = "basic", -- "off" | "basic" | "standard" | "strict"
				autoSearchPaths     = true,
				useLibraryCodeForTypes = true,
				diagnosticMode      = "openFilesOnly",
				disableOrganizeImports = true, -- ruff se encarga de imports
			},
		},
	},

	single_file_support = true,
}
