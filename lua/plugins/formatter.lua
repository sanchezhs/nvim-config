-- lua/plugins/formatting.lua
-- Centralized formatter setup using conform.nvim

local ok, conform = pcall(require, "conform")
if not ok then
	return
end

conform.setup({
	-- Map filetypes to formatter(s)
	formatters_by_ft = {
		-- lua = { "stylua" },
		python = { "ruff_format", "ruff_organize_imports" }, -- or "black" if you prefer
		javascript = { "prettier" },
		typescript = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		markdown = { "prettier" },
		sh = { "shfmt" },
	},

	-- Optional: format on save (tweak to taste)
	format_on_save = function(bufnr)
		-- Disable for big files
		local max = 300 * 1024 -- 300 KB
		local okb = pcall(function()
			return vim.api.nvim_buf_get_offset(bufnr, vim.api.nvim_buf_line_count(bufnr))
		end)
		if not okb then
			return
		end
		local size = vim.api.nvim_buf_get_offset(bufnr, vim.api.nvim_buf_line_count(bufnr))
		if size and size < max then
			return { lsp_fallback = true, timeout_ms = 2000 }
		end
	end,
})
