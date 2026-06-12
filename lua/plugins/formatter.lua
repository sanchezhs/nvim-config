local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    python     = { "ruff_format", "ruff_organize_imports" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    json       = { "prettier" },
    yaml       = { "prettier" },
    markdown   = { "prettier" },
    sh         = { "shfmt" },
  },

  format_on_save = function(bufnr)
    local size = vim.api.nvim_buf_get_offset(bufnr, vim.api.nvim_buf_line_count(bufnr))
    if size > 300 * 1024 then return end  -- skip files > 300 KB
    return { lsp_format = "fallback", timeout_ms = 2000 }
  end,
})

-- Formato manual explícito
vim.keymap.set({ "n", "v" }, "<leader>cf", function()
  conform.format({ lsp_format = "fallback", async = true })
end, { desc = "Format buffer" })
